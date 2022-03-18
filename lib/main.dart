import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ganntchart/redux/action/actions.dart';
import 'package:ganntchart/redux/reducer/app_state_reducer.dart';
import 'package:ganntchart/redux/state/app_state.dart';
import 'package:ganntchart/task_create_page.dart';
import 'package:ganntchart/task_data_repository.dart';
import 'package:ganntchart/task_edit_page.dart';
import 'package:ganntchart/task_item_view.dart';
import 'package:ganntchart/task_list_view.dart';
import 'package:ganntchart/taskdata.dart';
import 'package:realm/realm.dart';
import 'package:redux/redux.dart';
import 'task_form_view.dart';

void main() {
  debugPrint('main');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  // final store = Store<AppState>(
  //   appReducer,
  //   initialState: const AppState(),
  // );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPrint('MyApp build');
    return MaterialApp(
            title: 'GanntChart',
            theme: ThemeData(
              primarySwatch: Colors.amber,
            ),
            home: const MyHomePage(title: 'GanntChart'),
        );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  DateTime _today = DateTime.now();
  List<Task> listItems = <Task>[];
  // late GlobalObjectKey<TaskListState> listViewKey;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // void _listUpdate() {
  //   setState(() {
  //     listViewKey.currentState?.update();
  //   });
  // }

  @override
  void initState() {
    updateList();
  }

  void updateList() {
    var config = Configuration([Task.schema]);
    var realm = Realm(config);
    RealmResults<Task> tasks = TaskDataRepository().readAll();
    tasks.forEach((task) {
      listItems.add(Task(
        task.id,
        task.title,
        task.detail,
        task.status,
        task.startDate,
        task.endDate,
        task.createdTimestamp,
        task.modifiedTimestamp,
      ));
    });
  }

  void _gotoTaskForm() async {
    debugPrint('_gotoTaskForm');
    await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return TaskEditPage(title: 'Add Task', onSave: _onSave, task: null,);
    }));
  }
  
  void _onSave(task) {
    debugPrint('main onsave ${task.title}');
    TaskDataRepository().add(task);
    setState(() {
      listItems.add(task);

    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('_MyHomePageState build');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TaskList(listItems: listItems)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _gotoTaskForm,
        tooltip: 'ADD TASK',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

