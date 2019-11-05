import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tick/store/AppTheme.dart';

class Setting extends StatelessWidget {
  const Setting({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appTheme = Provider.of<AppTheme>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('设置'),
      ),
      body: Scrollbar(
        child: ListView(
          children: <Widget>[
            UserInfo(),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/theme'),
              leading: Icon(Icons.color_lens),
              trailing: SizedBox(
                width: 30.0,
                height: 30.0,
                child: CircleAvatar(
                  backgroundColor: _appTheme.styleColor,
                ),
              ),
              title: Text('主题'),
            ),
          ],
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey[300]),
        ),
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            onTap: () => print('Info'),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "assets/images/avatar.png",
                width: 56.0,
                height: 56.0,
                fit: BoxFit.fill,
              ),
            ),
            trailing: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                "assets/images/avatar.png",
                width: 30.0,
                height: 30.0,
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.deepOrange[600], width: 1),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: GestureDetector(
                onTap: () {
                  print('升级会员');
                },
                child: Text(
                  '升级到高级会员',
                  style: TextStyle(color: Colors.deepOrange[600]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
