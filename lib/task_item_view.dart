import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ganntchart/task_edit_page.dart';
import 'package:ganntchart/taskdata.dart';

class TaskItem extends StatefulWidget {
  Task task;

  TaskItem({Key? key, required this.task}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TaskItemState();

}

class _TaskItemState extends State<TaskItem> {

  void _gotoTaskForm() {
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("TaskItem " + widget.task.title);
    Icon icon = Icon(Icons.task);
    if(widget.task.status == 'DONE') {
      icon = Icon(Icons.done);
    }

    // return Text(widget.task.title);
    return ListTile(
      leading: icon,
      title: Text(widget.task.title),
      subtitle: Text(widget.task.status),
      trailing: Icon(Icons.more_vert),
      onTap: () => _gotoTaskForm(),

    );
  }
}


