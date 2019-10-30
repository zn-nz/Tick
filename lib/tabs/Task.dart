import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final arguments;
  final openTabsDrawer;
  const Task({Key key, this.arguments, this.openTabsDrawer}) : super(key: key);
  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  String _taskTitle = '';
  @override
  void initState() {
    super.initState();
    setState(() {
      _taskTitle = widget.arguments['taskTitle'];
    });
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
              widget.openTabsDrawer();
            },
          ),
        ),
      ),
    );
  }
}
