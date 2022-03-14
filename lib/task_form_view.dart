import 'package:flutter/material.dart';
import 'package:ganntchart/task_item_view.dart';
import 'package:ganntchart/taskdata.dart';
import 'package:realm/realm.dart';

class TaskForm extends StatefulWidget {
  List<TaskItem> listItems = <TaskItem>[];
  int target = -1;

  TaskForm({Key? key, required this.listItems, target}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TaskFormState();

}

class _TaskFormState extends State<TaskForm> {
  String _taskTitle = "";
  String _taskDetail = "";
  String _taskStatus = 'TODO';
  late DateTimeRange _taskDateRange = DateTimeRange(start: DateTime.now(), end: DateTime.now());
  int _startDate = 0;
  int _endDate = 0;
  // late TimeRanges _taskTimeRange;

  TextEditingController _taskTitleController = TextEditingController();
  TextEditingController _taskDetailController = TextEditingController();


  @override
  void initState() {
    super.initState();
    debugPrint('_TaskFormState initState');
    int target = widget.target;
    if(target > -1) {
      TaskItem item = widget.listItems[target];
      // _taskTitle = item.task.title;
      // _taskDetail = item.task.detail;
      // _taskStatus = item.task.status;
      // _startDate = item.task.startDate;
      // _endDate = item.task.endDate;

    }

  }

  @override
  Widget build(BuildContext context) {
    debugPrint('_TaskFormState build');
    return Container(
        child: SingleChildScrollView(
            child:Form(
              child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _taskTitleController,
                      decoration: const InputDecoration(
                        hintText: 'Task Title',
                        labelText: 'Title *',
                      ),
                      onChanged: (text) => { _taskTitle = text },
                    ),
                    TextField(
                      controller: _taskDetailController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 10,
                      decoration: const InputDecoration(
                        hintText: 'Task Detail',
                        labelText: 'Detail *',
                      ),
                      onChanged: (text) => { _taskDetail = text },
                    ),
                    DropdownButton<String>(
                      value: _taskStatus,
                      onChanged: (String? newValue) {
                        setState(() {
                          _taskStatus = newValue!;
                        });
                      },
                      items: <String>['TODO', 'IN PROGRESS', 'IN REVIEW', 'DONE']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),

                    ),
                    ElevatedButton(
                      onPressed: () async {
                        DateTimeRange? range = await showDateRangePicker(
                          context: context,
                          firstDate: DateTime(2020,1,1),
                          lastDate: DateTime(2039,12,31),
                        );
                        debugPrint('${range?.start}, ${range?.end}');
                        setState(() {
                          _taskDateRange = range!;
                        });
                        debugPrint('${_taskDateRange?.start}, ${_taskDateRange?.end}');
                      },
                      child: Text('set DateRange'),

                    ),
                    ElevatedButton(
                      onPressed: () {
                        debugPrint(_taskTitle);
                        debugPrint(_taskDetail);
                        debugPrint(_taskStatus);
                        // debugPrint(_taskDateRange?.start);
                        // debugPrint(_taskDateRange?.end);
                        //
                        var config = Configuration([Task.schema]);
                        var realm = Realm(config);
                        var task = Task(
                            _taskTitle,
                            _taskDetail,
                            _taskStatus,
                            "",
                            "",
                            "",
                            "",
                        );
                        realm.write(() {
                          realm.add(task);
                        });

                        var tasks = realm.all<Task>();
                        tasks.forEach((task) {
                          debugPrint('${task.title}, ${task.detail}, ${task.status}');
                        });

                        setState(() {
                          debugPrint("addTaskItem");
                          widget.listItems.add(TaskItem(
                              task: Task(
                                _taskTitle,
                                _taskDetail,
                                _taskStatus,
                                "",
                                "",
                                "",
                                "",
                              )
                          ));

                          _taskTitleController.text = '';
                          _taskDetailController.text = '';
                          _taskTitle = '';
                          _taskDetail = '';
                          _taskStatus = 'TODO';

                        });

                      },
                      child: const Text('Save'),

                    )
                  ]
              ),
            )
        )
    );
  }

}