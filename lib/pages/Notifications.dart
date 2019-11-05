import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tick/store/AppTheme.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appTheme = Provider.of<AppTheme>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _appTheme.appBarStyle,
        title: Text('消息'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text('暂无消息')],
        ),
      ),
    );
  }
}
