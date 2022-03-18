// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taskdata.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Task extends _Task with RealmObject {
  Task(
    String id,
    String title,
    String detail,
    String status,
    int startDate,
    int endDate,
    int createdTimestamp,
    int modifiedTimestamp,
  ) {
    RealmObject.set(this, 'id', id);
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
  String get id => RealmObject.get<String>(this, 'id') as String;
  @override
  set id(String value) => throw RealmUnsupportedSetError();

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
  int get startDate => RealmObject.get<int>(this, 'startDate') as int;
  @override
  set startDate(int value) => RealmObject.set(this, 'startDate', value);

  @override
  int get endDate => RealmObject.get<int>(this, 'endDate') as int;
  @override
  set endDate(int value) => RealmObject.set(this, 'endDate', value);

  @override
  int get createdTimestamp =>
      RealmObject.get<int>(this, 'createdTimestamp') as int;
  @override
  set createdTimestamp(int value) =>
      RealmObject.set(this, 'createdTimestamp', value);

  @override
  int get modifiedTimestamp =>
      RealmObject.get<int>(this, 'modifiedTimestamp') as int;
  @override
  set modifiedTimestamp(int value) =>
      RealmObject.set(this, 'modifiedTimestamp', value);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(Task._);
    return const SchemaObject(Task, [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('detail', RealmPropertyType.string),
      SchemaProperty('status', RealmPropertyType.string),
      SchemaProperty('startDate', RealmPropertyType.int),
      SchemaProperty('endDate', RealmPropertyType.int),
      SchemaProperty('createdTimestamp', RealmPropertyType.int),
      SchemaProperty('modifiedTimestamp', RealmPropertyType.int),
    ]);
  }
}
