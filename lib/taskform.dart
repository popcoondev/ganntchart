import 'package:flutter/material.dart';

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