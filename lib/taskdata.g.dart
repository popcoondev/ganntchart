// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taskdata.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Task extends _Task with RealmObject {
  Task(
    String title,
    String detail,
    String status,
    String startDate,
    String endDate,
    String createdTimestamp,
    String modifiedTimestamp,
  ) {
    this.title = title;
    this.detail = detail;
    this.status = status;
    this.startDate = startDate;
    this.endDate = endDate;
    this.createdTimestamp = createdTimestamp;
    this.modifiedTimestamp = modifiedTimestamp;
  }

  Task._();

  @override
  String get title => RealmObject.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObject.set(this, 'title', value);

  @override
  String get detail => RealmObject.get<String>(this, 'detail') as String;
  @override
  set detail(String value) => RealmObject.set(this, 'detail', value);

  @override
  String get status => RealmObject.get<String>(this, 'status') as String;
  @override
  set status(String value) => RealmObject.set(this, 'status', value);

  @override
  String get startDate => RealmObject.get<String>(this, 'startDate') as String;
  @override
  set startDate(String value) => RealmObject.set(this, 'startDate', value);

  @override
  String get endDate => RealmObject.get<String>(this, 'endDate') as String;
  @override
  set endDate(String value) => RealmObject.set(this, 'endDate', value);

  @override
  String get createdTimestamp =>
      RealmObject.get<String>(this, 'createdTimestamp') as String;
  @override
  set createdTimestamp(String value) =>
      RealmObject.set(this, 'createdTimestamp', value);

  @override
  String get modifiedTimestamp =>
      RealmObject.get<String>(this, 'modifiedTimestamp') as String;
  @override
  set modifiedTimestamp(String value) =>
      RealmObject.set(this, 'modifiedTimestamp', value);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(Task._);
    return const SchemaObject(Task, [
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('detail', RealmPropertyType.string),
      SchemaProperty('status', RealmPropertyType.string),
      SchemaProperty('startDate', RealmPropertyType.string),
      SchemaProperty('endDate', RealmPropertyType.string),
      SchemaProperty('createdTimestamp', RealmPropertyType.string),
      SchemaProperty('modifiedTimestamp', RealmPropertyType.string),
    ]);
  }
}
