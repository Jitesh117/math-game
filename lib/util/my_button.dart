import 'package:flutter/material.dart';
import '../const.dart';

class MyButton extends StatelessWidget {
  MyButton({Key? key, required this.child, required this.onTap})
      : super(key: key);

  @override
  final String child;
  final VoidCallback onTap;
  var buttonColor = Colors.deepPurple.shade400;
  Widget build(BuildContext context) {
    if (child == 'C') {
      buttonColor = Colors.green;
    } else if (child == 'DEL') {
      buttonColor = Colors.red;
    } else if (child == '=') {
      buttonColor = Colors.deepPurple;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              child,
              style: whiteTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
