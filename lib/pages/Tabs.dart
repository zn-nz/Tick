import 'package:flutter/material.dart';
import 'package:tick/tabs/Date.dart';
import 'package:tick/tabs/Task.dart';
import 'package:tick/tabs/Setting.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currenIndex = 0;
  List _tabList = [
    Task(),
    Date(),
    Setting(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabList[_currenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currenIndex,
        onTap: (int index) {
          setState(() {
            _currenIndex = index;
          });
        },
        iconSize: 25.0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.check_box), title: Container()),
          BottomNavigationBarItem(
              icon: Icon(Icons.date_range), title: Container()),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Container()),
        ],
      ),
    );
  }
}
