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
          children: <Widget>[
            GestureDetector(
              onTap: () {
                print('单击');
              },
              onDoubleTap: (){
                print('doubletap');
              },
              child: CircleAvatar(
                radius: 100.0,
                backgroundImage: AssetImage("assets/images/avatar.png"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
