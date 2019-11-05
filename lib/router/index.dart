import 'package:flutter/material.dart';
import 'package:tick/pages/Notifications.dart';
import 'package:tick/pages/Tabs.dart';
import 'package:tick/pages/Search.dart';
import 'package:tick/pages/ThemeSelect.dart';
import 'package:tick/tabs/Setting.dart';

final routes = {
  '/': (context) => Tabs(),
  '/setting': (context) => Setting(),
  '/notifications': (context) => Notifications(),
  '/search': (context) => Search(),
  '/theme': (context) => ThemeSelect(),
};
// ignore: top_level_function_literal_block
final onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
