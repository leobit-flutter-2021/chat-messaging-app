import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final String hintText;
  final bool isFOrLName;
  final bool isPassword;

  const CustomInput(
      {Key? key,
      required this.hintText,
      required this.isFOrLName,
      required this.isPassword})
      : super(key: key);

  @override
  CustomInputState createState() => CustomInputState();
}

class CustomInputState extends State<CustomInput> {
  bool passwordVisibility = true;

  Widget _fieldWithText(BuildContext context, String hintText, bool isFOrLName,
      bool isPassword, bool showPassword) {
    return Container(
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
      child: Column(
        children: [
          Container(
            width:
                MediaQuery.of(context).size.width * ((isFOrLName) ? 0.4 : 0.9),
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              hintText,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height:
                (MediaQuery.of(context).orientation == Orientation.landscape)
                    ? MediaQuery.of(context).size.height * 0.075
                    : MediaQuery.of(context).size.height * 0.045,
            width:
                MediaQuery.of(context).size.width * ((isFOrLName) ? 0.4 : 0.9),
            child: TextField(
              obscureText: showPassword,
              obscuringCharacter: "•",
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                suffixIcon: (isPassword)
                    ? (showPassword)
                        ? InkWell(
                            child: const Icon(Icons.lock),
                            onTap: changePasswordVisibility,
                          )
                        : InkWell(
                            child: const Icon(Icons.lock_open_outlined),
                            onTap: changePasswordVisibility,
                          )
                    : Container(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _fieldWithText(context, widget.hintText, widget.isFOrLName,
        widget.isPassword, passwordVisibility);
  }

  void changePasswordVisibility() {
    setState(() {
      if (passwordVisibility) {
        passwordVisibility = false;
      } else {
        passwordVisibility = true;
      }
    });
  }
}
