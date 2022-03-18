import 'package:flutter/material.dart';
import 'package:ganntchart/task_item_view.dart';
import 'package:ganntchart/taskdata.dart';
import 'package:realm/realm.dart';
import 'package:uuid/uuid.dart';

class TaskForm extends StatefulWidget {
  Task? task;
  Function(Task)? onSave;

  TaskForm({Key? key, required this.task, this.onSave}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TaskFormState();

}

class _TaskFormState extends State<TaskForm> {
  String _taskId = ""; //uniqkey
  String _taskTitle = "";
  String _taskDetail = "";
  String _taskStatus = 'TODO';
  late DateTimeRange _taskDateRange = DateTimeRange(start: DateTime.now(), end: DateTime.now());
  int _startDate = -1;
  int _endDate = -1;
  // late TimeRanges _taskTimeRange;

  TextEditingController _taskTitleController = TextEditingController();
  TextEditingController _taskDetailController = TextEditingController();


  @override
  void initState() {
    super.initState();
    debugPrint('_TaskFormState initState');

    if(widget.task != null) {
      Task task = widget.task!;
      _taskId = task.id;
      _taskTitle = task.title;
      _taskDetail = task.detail;
      _taskStatus = task.status;
      _startDate = task.startDate;
      _endDate = task.endDate;
      _taskTitleController = TextEditingController(text: _taskTitle);
    }
    else {
      _taskId = Uuid().v4();
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
                    TextFormField(
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
                        Task task = Task(
                            _taskId,
                            _taskTitle,
                            _taskDetail,
                            _taskStatus,
                            _startDate,
                            _endDate,
                            0,
                            0,
                        );
                        widget.task = task;

                        //UI reset
                        _taskId = Uuid().v4();
                        _taskTitleController.text = '';
                        _taskDetailController.text = '';
                        _taskTitle = '';
                        _taskDetail = '';
                        _taskStatus = 'TODO';

                        //callback
                        widget.onSave!(task);
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