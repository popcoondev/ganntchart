import 'package:ganntchart/redux/reducer/taskReducer.dart';
import 'package:ganntchart/redux/state/app_state.dart';

import 'loadingReducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    isLoading: loadingReducer(state.isLoading, action),
    taskState: taskReducer(state.taskState, action),
  );
}
