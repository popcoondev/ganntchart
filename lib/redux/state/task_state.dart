import 'package:flutter/foundation.dart';

@immutable
class TaskState {
  final bool isSaved;

  const TaskState({
    this.isSaved = false,
  });

  TaskState copyWith({required bool isSaved}) {
    return TaskState(isSaved: isSaved ?? this.isSaved);
  }
}