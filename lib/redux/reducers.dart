import 'package:chat/redux/states.dart';
import 'package:flutter/material.dart';
import 'actions.dart';

ScreenMode appReducers(ScreenMode previousScreenMode, dynamic action) {
  if (action is ChangeScreenMode && !action.isDark) {
    return const ScreenMode(Colors.blueGrey, true);
  }
  else if (action is ChangeScreenMode && action.isDark){
    return const ScreenMode(Colors.white, false);
  } else {
    return ScreenMode(previousScreenMode.backgroundColor, previousScreenMode.isDark);
  }
}
