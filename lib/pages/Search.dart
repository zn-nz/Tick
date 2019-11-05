import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tick/store/AppTheme.dart';

class Search extends StatelessWidget {
  const Search({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appTheme = Provider.of<AppTheme>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: _appTheme.appBarStyle,
        title: TextField(
          autofocus: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '搜索清单、标签、任务',
            suffixIcon: GestureDetector(
              onTap: () {
                print('语音');
              },
              child: Icon(Icons.mic),
            ),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[],
      ),
    );
  }
}
