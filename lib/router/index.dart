import 'package:flutter/material.dart';
import 'package:tick/pages/Tabs.dart';

final routes = {
  '/': (context) => Tabs(),
};
// 路由配置固定写法
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
