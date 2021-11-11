import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
class ScreenMode {
  static var init = const ScreenMode(Colors.white, false);
  final Color backgroundColor;
  final bool isDark;

  const ScreenMode(this.backgroundColor, this.isDark);
}
