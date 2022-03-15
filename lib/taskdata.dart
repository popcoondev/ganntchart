import 'package:realm/realm.dart';  // import realm package
import 'dart:io';

part 'taskdata.g.dart'; // declare a part file.

// generate command
// >flutter pub run realm generate
@RealmModel()
class _Task {
  @PrimaryKey()
  late final int id;

  late String title;
  late String detail;
  late String status;
  late int startDate;
  late int endDate;
  late int createdTimestamp;
  late int modifiedTimestamp;
}


