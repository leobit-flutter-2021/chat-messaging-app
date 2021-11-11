import 'package:chat/redux/actions.dart';
import 'package:chat/redux/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'components/body.dart';

class ChatsScreen extends StatefulWidget {
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<ScreenMode, dynamic>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.backgroundColor,
          appBar: buildAppBar(),
          body: Body(),
          floatingActionButton: changeScreenMode(context, state.isDark),
          bottomNavigationBar: buildBottomNavigationBar(),
        );
      },
      converter: (store) => store.state,
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.messenger), label: "Chats"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
        BottomNavigationBarItem(icon: Icon(Icons.call), label: "Calls"),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 14,
            backgroundImage: AssetImage("assets/images/user_2.png"),
          ),
          label: "Profile",
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text("Chats"),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );
  }
}

Widget changeScreenMode(BuildContext context, bool isDark) {
  return StoreConnector<ScreenMode, dynamic>(
    builder: (context, callback) {
      return FloatingActionButton(
          child: (isDark)
              ? const Icon(Icons.light_mode_outlined)
              : const Icon(Icons.dark_mode_outlined),
          onPressed: () => callback(isDark),
          backgroundColor: Colors.blueGrey);
    },
    converter: (store) {
      return (isDarkMode) => store.dispatch(ChangeScreenMode(isDarkMode));
    },
  );
}
