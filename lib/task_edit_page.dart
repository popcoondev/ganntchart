import 'package:flutter/material.dart';
import 'package:ganntchart/task_form_view.dart';
import 'package:ganntchart/task_item_view.dart';
import 'package:ganntchart/taskdata.dart';

class TaskEditPage extends StatefulWidget {
  List<TaskItem> listItems = [];

  TaskEditPage({Key? key, required this.title, required List<TaskItem> this.listItems}) : super(key: key);
  final String title;


  @override
  State<TaskEditPage> createState() => _TaskEditPageState();
}

class _TaskEditPageState extends State<TaskEditPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TaskForm(listItems: widget.listItems),
        ],
       ),
      ),
    );
  }

}