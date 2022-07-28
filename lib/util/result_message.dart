import 'package:flutter/material.dart';

import '../const.dart';

class ResultMessage extends StatelessWidget {
  const ResultMessage({
    Key? key,
    required this.message,
    required this.onTap,
    required this.icon,
  }) : super(key: key);
  final String message;
  final VoidCallback onTap;
  final icon;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple,
      content: Container(
        height: 200,
        // color: Colors.deepPurple,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              message,
              style: whiteTextStyle,
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.deepPurple.shade300,
                    borderRadius: BorderRadius.circular(8)),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
