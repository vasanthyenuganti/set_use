import 'package:flutter/cupertino.dart';

class SliderProvider extends ChangeNotifier {
  double _sliderValue = 0;
  double get sliderValue => _sliderValue;

  void onSlideChange(double val) {
    _sliderValue = val;
    notifyListeners();
  }
}
