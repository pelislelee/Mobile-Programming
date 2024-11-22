import 'package:flutter/material.dart';

class TextSizeProvider with ChangeNotifier {
  double _textSize = 16.0;

  double get textSize => _textSize;

  void increaseTextSize() {
    _textSize = _textSize + 2.0;
    notifyListeners();
  }

  void decreaseTextSize() {
    if (_textSize > 10.0) {
      _textSize = _textSize - 2.0;
      notifyListeners();
    }
  }
} 