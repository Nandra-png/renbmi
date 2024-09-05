
import 'app_state.dart';
import 'package:renbmi/action.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is SetHeight) {
    return state.copyWith(height: action.height);
  } else if (action is SetWeight) {
    return state.copyWith(weight: action.weight);
  } else if (action is SetAge) {
    return state.copyWith(age: action.age);
  } else if (action is ToggleGender) {
    return state.copyWith(isMale: !state.isMale);
  }
  return state;
}

