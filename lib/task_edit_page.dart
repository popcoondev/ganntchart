import 'package:flutter/material.dart';
import 'package:ganntchart/task_form_view.dart';
import 'package:ganntchart/task_item_view.dart';
import 'package:ganntchart/taskdata.dart';

class TaskEditPage extends StatefulWidget {
  final String title;
  Task task;

  TaskEditPage({Key? key, required this.title, required this.task}) : super(key: key);


  @override
  State<TaskEditPage> createState() => _TaskEditPageState();
}

class _TaskEditPageState extends State<TaskEditPage> {

  @override
  Widget build(BuildContext context) {
    debugPrint('_TaskEditPageState build ${widget.task.title}');

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TaskForm(task: widget.task, onSave: _onSave,),
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