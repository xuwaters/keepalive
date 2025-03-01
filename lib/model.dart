import 'package:flutter/widgets.dart';
import 'package:keepalive/src/rust/api/app.dart';

class AppModel extends ChangeNotifier {
  bool _isRunning = false;
  String? _errorMessage;

  @override
  void dispose() {
    isRunning = false;
    super.dispose();
  }

  bool get isRunning => _isRunning;

  set isRunning(bool value) {
    if (value == _isRunning) {
      return;
    }
    _isRunning = value;
    try {
      if (_isRunning) {
        startKeepAwake();
      } else {
        stopKeepAwake();
      }
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      notifyListeners();
    }
  }

  toggleRunning() {
    isRunning = !isRunning;
  }

  String? get errorMessage => _errorMessage;

  set errorMessage(String? value) {
    _errorMessage = value;
    notifyListeners();
  }
}
