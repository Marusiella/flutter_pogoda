import 'package:flutter/material.dart';

class MyProvider with ChangeNotifier {
  double visibility = 0.0;
  double get getVisibility => visibility;
  void setVisibility(double value) {
    visibility = value;
    notifyListeners();
  }
}
