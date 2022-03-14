import 'package:flutter/foundation.dart';
import 'package:ganntchart/redux/state/task_state.dart';

@immutable
class AppState {
  final bool isLoading;
  final TaskState taskState;

  const AppState({
    this.isLoading = false,
    this.taskState = const TaskState(),
  });

  AppState copyWith({ required bool isLoading, required TaskState taskState,}) {
    return AppState(
        isLoading: isLoading ?? this.isLoading,
        taskState: taskState ?? this.taskState
      );
  }
}
