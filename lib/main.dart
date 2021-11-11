import 'package:chat/screens/welcome/welcome_screen.dart';
import 'package:chat/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'redux/reducers.dart';
import 'redux/states.dart';

void main() {
  final Store<ScreenMode> store = Store<ScreenMode>(appReducers, initialState: ScreenMode.init);
  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<ScreenMode> store;
  const MyApp(this.store, {Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          home: WelcomeScreen(),
        )
    );
  }
}
