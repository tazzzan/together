import 'package:flutter/material.dart';

class GroupInfo with ChangeNotifier {
  bool _isFavorited = true;
  int _interestScore = 41;

  get interestScore => _interestScore;

  void increment() {
    _interestScore += 1;
    notifyListeners();
  }
}
