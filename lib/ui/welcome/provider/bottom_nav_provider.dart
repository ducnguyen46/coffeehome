import 'package:flutter/material.dart';

class BottomNavProvider with ChangeNotifier {
  int currentPage = 0;

  void onTapBar(int index) {
    currentPage = index;
    notifyListeners();
  }

  void onPageChanged(int page) {
    currentPage = page;
    notifyListeners();
  }
}
