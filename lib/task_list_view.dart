

import 'package:flutter/material.dart';
import 'package:ganntchart/task_item_view.dart';
import 'package:ganntchart/taskdata.dart';
import 'package:realm/realm.dart';

class TaskList extends StatefulWidget {
  var listItems = <TaskItem>[];


  TaskList({Key? key, required this.listItems}) : super(key: key);

  @override
  // TaskListState createState() => TaskListState();
  State<StatefulWidget> createState() => _TaskListState();

}

class _TaskListState extends State<TaskList> {
  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
        height: _screenSize.height-160,
        width: double.infinity,
        child: ListView(
          children: widget.listItems,
        ),
     );
  }
}
