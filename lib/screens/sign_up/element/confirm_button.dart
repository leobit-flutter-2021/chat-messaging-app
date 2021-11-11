import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat/screens/chats/chats_screen.dart';

Widget _finishButton(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatsScreen(),
        ),
      );
    },
    child: Container(
      margin: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 0.6,
      height: (MediaQuery.of(context).orientation == Orientation.landscape)
          ? MediaQuery.of(context).size.height * 0.15
          : MediaQuery.of(context).size.height * 0.09,
      decoration: const BoxDecoration(
        color: CupertinoColors.activeOrange,
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: const Center(
          child: Text("Go to chatting",
              style: TextStyle(
                  fontSize: 24,
                  color: CupertinoColors.white,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center)),
    ),
  );
}

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _finishButton(context);
  }
}
