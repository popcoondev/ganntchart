
import 'package:flutter/material.dart';
import 'package:ganntchart/taskdata.dart';
import 'package:realm/realm.dart';

class TaskDataRepository {
  RealmResults<Task> readAll() {
    var config = Configuration([Task.schema]);
    var realm = Realm(config);
    RealmResults<Task> list = realm.all<Task>();

    return list;
  }

  void update(Task task) {
    var config = Configuration([Task.schema]);
    var realm = Realm(config);

    realm.write(() {
      Task? item = realm.find(task.id);
      item = task;
    });
  }

  void add(Task task) {
    var config = Configuration([Task.schema]);
    var realm = Realm(config);

    realm.write(() {
      realm.add(task);
    });
  }

}