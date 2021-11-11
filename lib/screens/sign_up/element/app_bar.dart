import 'package:flutter/material.dart';

Widget _appBar(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: const [
      Text('Sign up'),
      Text(
        'Sign in?',
        style: TextStyle(fontWeight: FontWeight.w400),
      ),
    ],
  );
}

class AppBarSignUp extends StatelessWidget {
  const AppBarSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _appBar(context);
  }
}
