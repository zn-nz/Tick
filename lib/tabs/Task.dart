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
  List _list = [
    {
      'title': '一',
      'subtitle': '1',
      'checked': false,
    },
    {
      'title': '二',
      'subtitle': '2',
      'checked': false,
    }
  ];
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
      body: _bodyBusy(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('点击了浮动按钮');
        },
        child: Icon(Icons.add),
      ),
    );
  }

  _bodyClear() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('今天没有任务', style: TextStyle(fontSize: 20.0)),
          Text('祝你度过宁静的夜晚时光', style: TextStyle(color: Colors.grey))
        ],
      ),
    );
  }

  _bodyBusy() {
    return ListView(
      children: _list.map((i) {
        return CheckboxListTile(
          value: i['checked'],
          onChanged: (e) {},
          subtitle: Text(i['subtitle']),
          title: Text(i['title']),
        );
      }).toList(),
    );
  }
}
