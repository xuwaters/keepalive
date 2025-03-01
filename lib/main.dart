import 'package:flutter/material.dart';
import 'package:keepalive/model.dart';
import 'package:provider/provider.dart';

import 'src/rust/frb_generated.dart';

Future<void> main() async {
  await RustLib.init();
  runApp(const KeepAliveApp());
}

class KeepAliveApp extends StatelessWidget {
  const KeepAliveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppModel>(
      create: (_) => AppModel(),
      child: MaterialApp(
        title: 'Keep Screen Awake',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        ),
        home: const KeepAliveHomePage(),
      ),
    );
  }
}

class KeepAliveHomePage extends StatelessWidget {
  const KeepAliveHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Click start to keep screen awake')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StatusIndicator(),
            const SizedBox(height: 24),
            ToggleRunButton(),
            const SizedBox(height: 16),
            ErrorMessage(),
          ],
        ),
      ),
    );
  }
}

class ToggleRunButton extends StatelessWidget {
  const ToggleRunButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Consumer<AppModel>(
        builder:
            (context, model, child) => ElevatedButton(
              onPressed: model.toggleRunning,
              style: _createButtonStyle(context, model),
              child: Text(
                model.isRunning ? 'Stop' : 'Start',
                style: const TextStyle(fontSize: 18),
              ),
            ),
      ),
    );
  }

  _createButtonStyle(BuildContext context, AppModel model) {
    final colorScheme = Theme.of(context).colorScheme;
    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor:
          model.isRunning ? colorScheme.error : colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      padding: const EdgeInsets.symmetric(vertical: 16),
      disabledBackgroundColor: colorScheme.surfaceContainerHighest,
      disabledForegroundColor: colorScheme.onSurfaceVariant,
    );
    return buttonStyle;
  }
}

// Status Indicator Component
class StatusIndicator extends StatelessWidget {
  const StatusIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder:
          (context, model, widget) => Row(
            children: [
              const SizedBox(width: 8),
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      model.isRunning
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.error,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                model.isRunning ? 'Running' : 'Stopped',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
    );
  }
}

// Add this new ErrorMessage component just after the other component classes
class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, model, child) {
        if (model.errorMessage == null) return const SizedBox.shrink();

        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.errorContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(
                Icons.error_outline,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  model.errorMessage!,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onErrorContainer,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
