import 'package:ganntchart/redux/action/actions.dart';
import 'package:ganntchart/redux/state/task_state.dart';
import 'package:redux/redux.dart';

final taskReducer = combineReducers<TaskState>([
  TypedReducer<TaskState, TaskSavedAction>(_set),
]);

TaskState _set(TaskState taskState, TaskSavedAction action) {
  return TaskState(
    isSaved: true,
  );
}