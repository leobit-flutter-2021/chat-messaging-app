import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat/screens/sign_up/element/app_bar.dart';
import 'package:chat/screens/sign_up/element/app_logo.dart';
import 'package:chat/screens/sign_up/element/confirm_button.dart';
import 'package:chat/screens/sign_up/element/text_field.dart';


class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: CupertinoColors.activeGreen,
          title: const AppBarSignUp()),
      body: Container(
        color: CupertinoColors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
            child: Column(children: [
          const AppLogo(),
          const CustomInput(
              hintText: "Your nickname",
              isFOrLName: false,
              isPassword: false),
          Row(
            children: const [
              CustomInput(
                  hintText: "First name ", isFOrLName: true, isPassword: false),
              CustomInput(
                  hintText: "Last name ", isFOrLName: true, isPassword: false),
            ],
          ),
          const CustomInput(
              hintText: "Email address ", isFOrLName: false, isPassword: false),
          const CustomInput(
              hintText: "Password ", isFOrLName: false, isPassword: true),
          const CustomInput(
              hintText: "Confirm password ",
              isFOrLName: false,
              isPassword: true),
          const ConfirmButton()
        ])),
      ),
    );
  }
}
