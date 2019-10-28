import 'package:flutter/material.dart';
import 'package:tick/components/Avatar.dart';

class Task extends StatefulWidget {
  const Task({Key key}) : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  String _taskTitle = '今天';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(_taskTitle),
        leading: Builder(
          builder: (BuildContext context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 160.0,
              color: Colors.indigoAccent[100],
              padding: EdgeInsets.only(
                  top: 35.0, right: 15.0, bottom: 15.0, left: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Avatar(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
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
                  ),
                ],
              ),
            ),
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
