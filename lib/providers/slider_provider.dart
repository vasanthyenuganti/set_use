import 'package:flutter/cupertino.dart';

class SliderProvider extends ChangeNotifier {
  double _sliderValue = 1;
  double get sliderValue => _sliderValue;

  void onSlideChange(double val) {
    _sliderValue = val;
    notifyListeners();
  }
}
