import 'package:flutter/material.dart';
import 'package:tick/tabs/Date.dart';
import 'package:tick/tabs/Task.dart';
import 'package:tick/tabs/Setting.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

final GlobalKey<ScaffoldState> _tabsScaffoldKey =
    new GlobalKey<ScaffoldState>();

class _TabsState extends State<Tabs> {
  int _currenIndex = 0;
  String _taskTitle = '今天';
  _groupTitleChange(String val) {
    setState(() {
      _taskTitle = val;
    });
    Navigator.pop(context);
  }

  _openTabsDrawer() {
    _tabsScaffoldKey.currentState.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _tabsScaffoldKey,
      body: _currenIndex == 0
          ? Task(arguments: {
              'taskTitle': _taskTitle,
            }, openTabsDrawer: () => _openTabsDrawer())
          : _currenIndex == 1 ? Date() : Setting(),
      drawerEdgeDragWidth: 0.0,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              otherAccountsPictures: <Widget>[
                IconButton(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.topCenter,
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    iconSize: 30.0,
                    onPressed: () {
                      print('search');
                    }),
                IconButton(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.topCenter,
                    icon: Icon(
                      Icons.add_alert,
                      color: Colors.white,
                    ),
                    iconSize: 26.0,
                    onPressed: () {
                      print('alarm');
                    }),
                IconButton(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.topCenter,
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  iconSize: 26.0,
                  onPressed: () {
                    print('setting');
                  },
                ),
              ],
              currentAccountPicture: GestureDetector(
                onTapUp: (e) {
                  print('修改头像');
                },
                child: CircleAvatar(
                  child: Container(
                    alignment: Alignment.topRight,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        width: 20.0,
                        height: 20.0,
                        image: AssetImage("assets/images/avatar.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  backgroundImage: AssetImage("assets/images/avatar.png"),
                ),
              ),
              accountEmail: null,
              accountName: null,
            ),
            RadioListTile(
              groupValue: _taskTitle,
              value: '今天',
              title: Text('今天'),
              activeColor: Colors.red,
              onChanged: _groupTitleChange,
            ),
            RadioListTile(
              groupValue: _taskTitle,
              value: '收集箱',
              title: Text('收集箱'),
              activeColor: Colors.red,
              onChanged: _groupTitleChange,
            ),
          ],
        ),
      ),
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
