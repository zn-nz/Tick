import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:tick/router/index.dart' as routesConfig;
import 'package:tick/store/AppTheme.dart';
import 'package:tick/store/index.dart';

// // 必须是顶层函数
_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

void main() {
  runApp(MultiProvider(
    providers: appStore,
    child: MyApp(),
  ));
  // 透明沉浸状态栏，写在渲染之后
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _appTheme = Provider.of<AppTheme>(context);
    return MaterialApp(
      title: 'Tick',
      initialRoute: '/',
      onGenerateRoute: routesConfig.onGenerateRoute,
      theme: ThemeData(
        textTheme: TextTheme(
          title: TextStyle(color: Colors.black),
        ),
        primaryColor: _appTheme.styleColor,
        scaffoldBackgroundColor: Colors.white,
        primaryColorBrightness: Brightness.light,
        toggleableActiveColor: _appTheme.styleColor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: _appTheme.styleColor),
        appBarTheme: AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          textTheme: TextTheme(
            title: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
