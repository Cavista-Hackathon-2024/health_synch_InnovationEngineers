import 'package:flutter/material.dart';

class DashProvider extends ChangeNotifier {
  int selectedIndex = 0;

  void onTapItem(index) {
    selectedIndex = index;
    notifyListeners();
  }
}
