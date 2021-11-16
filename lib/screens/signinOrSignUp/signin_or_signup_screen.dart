import 'package:chat/components/primary_button.dart';
import 'package:chat/constants.dart';
import 'package:chat/redux/actions.dart';
import 'package:chat/redux/states.dart';
import 'package:chat/screens/chats/chats_screen.dart';
import 'package:chat/screens/sign_up/sign_up.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';

class SigninOrSignupScreen extends StatelessWidget {
  const SigninOrSignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<ScreenMode, dynamic>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: state.backgroundColor,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  children: [
                    const Spacer(flex: 2),
                    Image.asset(
                      MediaQuery.of(context).platformBrightness == Brightness.light
                          ? "assets/images/Logo_light.png"
                          : "assets/images/Logo_dark.png",
                      height: 146,
                    ),
                    const Spacer(),
                    PrimaryButton(
                      text: "Sign In",
                      press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatsScreen(),
                        ),
                      ),
                    ),
                    const SizedBox(height: kDefaultPadding * 1.5),
                    PrimaryButton(
                      color: Theme.of(context).colorScheme.secondary,
                      text: "Sign Up",
                      press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUp(),
                        ),
                      ),
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
              ),
            ),
            floatingActionButton: changeScreenMode(context, state.isDark),
          );
        },
      converter: (store) => store.state,
    );
  }
}

Widget changeScreenMode(BuildContext context, bool isDark) {
  return StoreConnector<ScreenMode, dynamic> (
    builder: (context, callback) {
      return FloatingActionButton(
          child: (isDark)
              ? const Icon(Icons.light_mode_outlined)
              : const Icon(Icons.dark_mode_outlined),
          onPressed: () => callback(isDark),
          backgroundColor: Colors.blueGrey
      );
    },
    converter: (store) {
        return (isDarkMode) => store.dispatch(ChangeScreenMode(isDarkMode));
    },
  );
}

