import 'package:flutter/material.dart';
import 'package:ganntchart/taskdata.dart';
import 'package:realm/realm.dart';

class TaskForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TaskFormState();

}

class _TaskFormState extends State<TaskForm> {
  String _taskTitle = "";
  String _taskDetail = "";
  int _taskStatus = 0;
  late DateTimeRange _taskDateRange = DateTimeRange(start: DateTime.now(), end: DateTime.now());
  // late TimeRanges _taskTimeRange;

  TextEditingController _taskTitleController = TextEditingController();
  TextEditingController _taskDetailController = TextEditingController();
  String dropdownValue = 'TODO';


  @override
  void initState() {
    super.initState();
    debugPrint('initState');


  }

  @override
  Widget build(BuildContext context) {
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
                      value: dropdownValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
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
                        debugPrint(dropdownValue);
                        // debugPrint(_taskDateRange?.start);
                        // debugPrint(_taskDateRange?.end);

                        var config = Configuration([Task.schema]);
                        var realm = Realm(config);
                        var task = Task(
                            _taskTitle,
                            _taskDetail,
                            dropdownValue,
                            "",
                            "",
                            "",
                            "",
                            // _taskDateRange.start.toString(),
                            // _taskDateRange.end.toString(),
                            // DateTime.now().toString(),
                            // DateTime.now().toString(),
                        );
                        realm.write(() {
                          realm.add(task);
                        });

                        var tasks = realm.all<Task>();
                        tasks.forEach((task) {
                          debugPrint('${task.title}, ${task.detail}, ${task.status}');
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