import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final arguments;
  final editParentText;
  const Task({Key key, this.arguments, this.editParentText}) : super(key: key);
  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  String _taskTitle = '';
  GlobalKey _tabsScaffoldKey;
  @override
  void initState() {
    super.initState();
    setState(() {
      _taskTitle = widget.arguments['taskTitle'];
      _tabsScaffoldKey = widget.arguments['tabsScaffoldKey'];
    });
    print(widget.arguments);
  }

  @override
  void didUpdateWidget(Task oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      _taskTitle = widget.arguments['taskTitle'];
    });
  }

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
              widget.tabsScaffoldKey;
              // print(_tabsScaffoldKey);
              // _tabsScaffoldKey.currentState.openDrawer();
            },
          ),
        ),
      ),
    );
  }
}
