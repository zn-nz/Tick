import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tick/store/AppTheme.dart';

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

  _listChanged(int i) {
    setState(() {
      _list[i]['checked'] = !_list[i]['checked'];
    });
  }

  _getText() async {
    Dio _dio = new Dio();
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      print(options.path);
      options.path = 'https://api.github.com/users/nanmucoffin';
      print(options.path);
      return options;
    }, onResponse: (Response response) {
      // 在返回响应数据之前做一些预处理
      // return response; // continue
    }, onError: (DioError e) {
      // 当请求失败时做一些预处理
      print(e);
      return e; //continue
    }));
    Response response =
        await _dio.get("https://api.github.com/users/lay-coder");
    print(response);
  }

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
    final _appTheme = Provider.of<AppTheme>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _appTheme.appBarStyle,
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
      body: _list.isEmpty ? _bodyClear() : _bodyBusy(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('点击了浮动按钮');
          _getText();
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
      children: _list.asMap().keys.map((i) {
        final _textStyle =
            TextStyle(color: _list[i]['checked'] ? Colors.grey : Colors.black);
        return CheckboxListTile(
          activeColor: Colors.grey,
          value: _list[i]['checked'],
          onChanged: (e) {
            _listChanged(i);
          },
          subtitle: Text(
            _list[i]['subtitle'],
            style: _textStyle,
          ),
          title: Text(
            _list[i]['title'],
            style: _textStyle,
          ),
        );
      }).toList(),
    );
  }
}
