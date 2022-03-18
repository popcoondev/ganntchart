import 'package:flutter/material.dart';
import 'package:ganntchart/task_data_repository.dart';
import 'package:ganntchart/task_form_view.dart';
import 'package:ganntchart/task_item_view.dart';
import 'package:ganntchart/taskdata.dart';
import 'package:realm/realm.dart';

class TaskEditPage extends StatefulWidget {
  final String title;
  Task? task;
  Function(Task)? onSave;

  TaskEditPage({Key? key, required this.title, required this.task, this.onSave}) : super(key: key);


  @override
  State<TaskEditPage> createState() => _TaskEditPageState();
}

class _TaskEditPageState extends State<TaskEditPage> {

  @override
  Widget build(BuildContext context) {
    debugPrint('_TaskEditPageState build ${widget.task?.title}');

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
    widget.onSave!(task);
    Navigator.pop(context);
  }



}