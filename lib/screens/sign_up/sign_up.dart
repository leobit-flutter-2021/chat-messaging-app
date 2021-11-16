import 'package:chat/redux/actions.dart';
import 'package:chat/redux/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat/screens/sign_up/element/app_bar.dart';
import 'package:chat/screens/sign_up/element/app_logo.dart';
import 'package:chat/screens/sign_up/element/confirm_button.dart';
import 'package:chat/screens/sign_up/element/text_field.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<ScreenMode, dynamic>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.backgroundColor,
          appBar: AppBar(
              backgroundColor: CupertinoColors.activeGreen,
              title: const AppBarSignUp()),
          body: SizedBox(
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
                      hintText: "First name ",
                      isFOrLName: true,
                      isPassword: false),
                  CustomInput(
                      hintText: "Last name ",
                      isFOrLName: true,
                      isPassword: false),
                ],
              ),
              const CustomInput(
                  hintText: "Email address ",
                  isFOrLName: false,
                  isPassword: false),
              const CustomInput(
                  hintText: "Password ", isFOrLName: false, isPassword: true),
              const CustomInput(
                hintText: "Confirm password ",
                isFOrLName: false,
                isPassword: true,
              ),
              const ConfirmButton()
            ])),
          ),
          floatingActionButton: changeScreenMode(context, state.isDark),
        );
      },
      converter: (store) => store.state,
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
