import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget _appLogo(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.width * 0.3,
    width: MediaQuery.of(context).size.width * 0.3,
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        image: DecorationImage(
            image: AssetImage("assets/images/img.png"), fit: BoxFit.cover)),
  );
}

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _appLogo(context);
  }
}
