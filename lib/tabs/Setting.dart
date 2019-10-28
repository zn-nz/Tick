import 'package:flutter/material.dart';
import 'package:tick/components/Avatar.dart';

class Setting extends StatelessWidget {
  const Setting({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('设置'),
      ),
      body: Scrollbar(
        child: ListView(
          children: <Widget>[
            Avatar(),
            Avatar(),
            Avatar(),
            Avatar(),
            Avatar(),
            Avatar(),
            Avatar(),
            Avatar(),
            Avatar(),
            Avatar(),
            Avatar(),
            Avatar(),
            Avatar(),
            Avatar(),
            Avatar(),
            Avatar(),
            Avatar(),
          ],
        ),
      ),
    );
  }
}
