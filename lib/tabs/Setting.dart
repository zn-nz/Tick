import 'package:flutter/material.dart';

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
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          children: <Widget>[
            GestureDetector(
              onTap: () {
                print('单击');
              },
              onDoubleTap: () {
                print('doubletap');
              },
              child: ListBody(children: <Widget>[
                CircleAvatar(
                  // radius: 100.0,
                  backgroundImage: AssetImage("assets/images/avatar.png"),
                ),
              ]),
            ),
            GestureDetector(
              onTap: () {
                print('单击');
              },
              onDoubleTap: () {
                print('doubletap');
              },
              child: Container(
                width: 10.0,
                height: 20.0,
                child: CircleAvatar(
                  // radius: 100.0,
                  backgroundImage: AssetImage("assets/images/avatar.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
