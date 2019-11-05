import 'package:flutter/material.dart';

class AppTheme with ChangeNotifier {
  Color _styleColor = Colors.deepPurpleAccent;
  Color get styleColor => _styleColor;
  set styleColor(Color val) {
    _styleColor = val;
    notifyListeners();
  }

  Color _appBarStyle = Colors.white;
  Color get appBarStyle => _appBarStyle;
  set appBarStyle(Color val) {
    _appBarStyle = val;
    notifyListeners();
  }
}
