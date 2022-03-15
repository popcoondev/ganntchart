
import 'package:ganntchart/taskdata.dart';
import 'package:realm/realm.dart';

class TaskDataRepository {
  var config;
  var realm;

  TaskDataRepository() {
    config = Configuration([Task.schema]);
    realm = Realm(config);
  }

  List<Task> readAll() {
    return realm.all<Task>();
  }

  void write(Task task, bool isUpdate) {
    realm.write(() {
      realm.add(task, isUpdate);
    });
  }
}