import 'package:flutter/widgets.dart';

class AppModel extends ChangeNotifier {
  bool _isRunning = false;
  String? _errorMessage;

  set isRunning(bool value) {
    _isRunning = value;
    notifyListeners();
  }

  bool get isRunning => _isRunning;

  toggleRunning() {
    isRunning = !isRunning;
  }

  String? get errorMessage => _errorMessage;
  set errorMessage(String? value) {
    _errorMessage = value;
    notifyListeners();
  }
}
