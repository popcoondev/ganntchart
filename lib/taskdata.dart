import 'package:flutter/material.dart';
import 'package:realm/realm.dart';  // import realm package
import 'dart:io';

part 'taskdata.g.dart'; // declare a part file.

// generate command:
// >flutter pub run realm generate
@RealmModel()
class _Task {
  late String title;
  late String detail;
  late String status;
  late String startDate;
  late String endDate;
  late String createdTimestamp;
  late String modifiedTimestamp;
}


