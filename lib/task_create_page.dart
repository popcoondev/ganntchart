import 'package:flutter/material.dart';
import 'package:ganntchart/task_form_view.dart';
import 'package:ganntchart/task_item_view.dart';
import 'package:ganntchart/taskdata.dart';

class TaskCreatePage extends StatefulWidget {
  final String title;
  Task? task;

  TaskCreatePage({Key? key, required this.title, this.task}) : super(key: key);


  @override
  State<TaskCreatePage> createState() => _TaskCreatePageState();
}

class _TaskCreatePageState extends State<TaskCreatePage> {

  @override
  Widget build(BuildContext context) {
    debugPrint('_TaskCreatePageState build');

    return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TaskForm(task: widget.task, onSave: _onSave),
            ],
         ),
        ),
    );
  }

  void _onSave(Task task) {
    debugPrint('_onSave ${task.title}');
    Navigator.pop(context, task);
  }

}