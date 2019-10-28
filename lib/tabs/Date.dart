import 'package:flutter/material.dart';

class Date extends StatefulWidget {
  Date({Key key}) : super(key: key);

  @override
  _DateState createState() => _DateState();
}

class _DateState extends State<Date> {
  String _title = '';
  _appBarTitle() {
    return _title + ',' + 'day';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(_appBarTitle()),
      ),
      body: Text('date'),
    );
  }
}
