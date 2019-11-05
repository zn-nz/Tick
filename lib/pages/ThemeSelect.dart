import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tick/store/AppTheme.dart';

class ThemeSelect extends StatelessWidget {
  const ThemeSelect({Key key}) : super(key: key);
  static List _colorList = [
    {'name': '官方紫', 'color': Colors.deepPurpleAccent},
    {'name': '夜间', 'color': Colors.grey[800]},
    {'name': '纯黑', 'color': Colors.black},
    {'name': '粉色', 'color': Colors.pinkAccent},
    {'name': '绿色', 'color': Colors.green},
    {'name': '黄色', 'color': Colors.yellow},
  ];
  @override
  Widget build(BuildContext context) {
    final _appTheme = Provider.of<AppTheme>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _appTheme.appBarStyle,
        title: Text('主题'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                width: 360.0,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(bottom: 30.0),
                            child: Text(
                              '纯色主题',
                              style: TextStyle(color: Colors.grey),
                            ))
                      ],
                    ),
                    Wrap(
                      spacing: 40.0,
                      runSpacing: 20.0,
                      children: _colorList.asMap().keys.map((i) {
                        return GestureDetector(
                          onTap: () {
                            _appTheme.styleColor = _colorList[i]['color'];
                          },
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 60.0,
                                height: 60.0,
                                margin: EdgeInsets.only(bottom: 10.0),
                                decoration: BoxDecoration(
                                  color: _colorList[i]['color'],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: _colorList[i]['color'] ==
                                        _appTheme.styleColor
                                    ? Icon(
                                        Icons.check_circle,
                                        color: Colors.white,
                                      )
                                    : null,
                              ),
                              Text(
                                _colorList[i]['name'],
                                style: TextStyle(
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
