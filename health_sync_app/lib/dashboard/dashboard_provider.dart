import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDateDdMmYy(DateTime date) {
  final DateFormat formatter = DateFormat('dd/MM/yy');
  String formattedDate = formatter.format(date);
  return formattedDate;
}

class DashProvider extends ChangeNotifier {
  int selectedIndex = 0;

  void onTapItem(index) {
    selectedIndex = index;
    notifyListeners();
  }
}
