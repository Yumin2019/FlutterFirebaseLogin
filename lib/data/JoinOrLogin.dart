import 'package:flutter/material.dart';

// you can use ChangeNotifier to show new UI like LiveData in android
class JoinOrLogin extends ChangeNotifier {
  bool _isJoin = false; // _ means private member

  bool get isJoin => _isJoin;

  void toggle() {
    // data is changed, notify widgets
    _isJoin = !_isJoin;
    notifyListeners();
  }

}