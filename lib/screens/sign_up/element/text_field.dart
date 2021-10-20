import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget _fieldWithText(
    BuildContext context, String hintText, bool isFOrLName, bool isPassword) {
  return Container(
    padding: const EdgeInsets.all(2),
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
    child: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * ((isFOrLName) ? 0.4 : 0.9),
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
          height: (MediaQuery.of(context).orientation == Orientation.landscape)
              ? MediaQuery.of(context).size.height * 0.075
              : MediaQuery.of(context).size.height * 0.045,
          width: MediaQuery.of(context).size.width * ((isFOrLName) ? 0.4 : 0.9),
          child: TextField(
            obscureText: isPassword,
            obscuringCharacter: "•",
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              suffixIcon: (isPassword) 
                  ? const Icon(Icons.remove_red_eye_outlined)
                  : const Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.white,
                    ),
            ),
          ),
        ),
      ],
    ),
  );
}

class CustomInput extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return _fieldWithText(context, hintText, isFOrLName, isPassword);
  }
}
