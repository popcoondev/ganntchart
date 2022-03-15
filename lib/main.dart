import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ganntchart/redux/action/actions.dart';
import 'package:ganntchart/redux/reducer/app_state_reducer.dart';
import 'package:ganntchart/redux/state/app_state.dart';
import 'package:ganntchart/task_create_page.dart';
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
    // return StoreProvider(
    //     store: store,
    //     child: MaterialApp(
    //     title: 'GanntChart',
    //     theme: ThemeData(
    //       primarySwatch: Colors.amber,
    //     ),
    //     // home: const MyHomePage(title: 'GanntChart'),
    //       home: StoreConnector(
    //         distinct: true,
    //         onInit: (store) => store.dispatch(LoadingAction),
    //         converter: (store) => true,
    //         builder: (context, _) {
    //           return MyHomePage(title: 'Gannt');
    //         }
    //       )
    //   ),
    // );
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
    var config = Configuration([Task.schema]);
    var realm = Realm(config);
    var tasks = realm.all<Task>();
    tasks.forEach((task) {
      listItems.add(Task(
        task.title,
        task.detail,
        task.status,
        "",
        "",
        "",
        "",
      ));
    });
  }

  Future<void> _gotoTaskForm() async {
    debugPrint('_gotoTaskForm 1');
    Task? newTask = await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return TaskCreatePage(title: 'Add Task');
    }));
    debugPrint('_gotoTaskForm 2');
    setState(() {
      if(newTask != null) {
        debugPrint('_gotoTaskForm 3');
        listItems.add(newTask);
      }
    });
    debugPrint('_gotoTaskForm 4');
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
            // const Text(
            //   'You have pushed the button this many times:',
            // ),
            // Text(
            //   '$_today',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
            // TaskForm(listItems: listItems),
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

