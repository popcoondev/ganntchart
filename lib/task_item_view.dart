import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ganntchart/task_data_repository.dart';
import 'package:ganntchart/task_edit_page.dart';
import 'package:ganntchart/taskdata.dart';
import 'package:realm/realm.dart';

class TaskItem extends StatefulWidget {
  Task task;

  TaskItem({Key? key, required this.task}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TaskItemState();

}

class _TaskItemState extends State<TaskItem> {

  void _gotoTaskForm() async {
    await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return TaskEditPage(title: 'Edit Task', task: widget.task, onSave: _onSave
      );
    }));
 }

  void _onSave(Task task) {
    debugPrint('_onSave ${task.title}');
    // TaskDataRepository repository = TaskDataRepository();
    // repository.write(task, true);
    // var config = Configuration([Task.schema]);
    // var realm = Realm(config);
    // RealmResults<Task> list = realm.all<Task>();
    // list.forEach((task) {
    //   debugPrint('${task.id} ${task.title}');
    // });
    // realm.write(() {
    //   Task? item = realm.find(task.id);
    //   item!.title = task.title;
    //   item!.detail = task.detail;
    //   item!.status = task.status;
    //   item!.startDate = task.startDate;
    //   item!.endDate = task.endDate;
    //   item!.createdTimestamp = task.createdTimestamp;
    //   item!.modifiedTimestamp = task.modifiedTimestamp;
    // });
    // realm.close();
    TaskDataRepository().update(task);
    setState(() {
      widget.task = task;
    });

  }

  @override
  Widget build(BuildContext context) {
    // debugPrint('_TaskItemState build ${widget.task.title}');
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


