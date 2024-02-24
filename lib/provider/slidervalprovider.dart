import 'package:flutter/material.dart';

class SliderValueProvider with ChangeNotifier {
  double _sliderValue = 0;
  double get sliderValue => _sliderValue;

  void setValue(double val) {
    _sliderValue = val;
    notifyListeners();
  }
}
