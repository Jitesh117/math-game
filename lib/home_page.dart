import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_game_flutter/const.dart';
import 'package:math_game_flutter/util/my_button.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // user answer
  List<String> numpad = [
    '7',
    '8',
    '9',
    'C',
    '4',
    '5',
    '6',
    'DEL',
    '1',
    '2',
    '3',
    '=',
    '0',
  ];
  //number A, number B
  int a = 1, b = 1;
  String userAnswer = '';
  void buttonTapped(String button) {
    setState(() {
      if (button == '=') {
        checkResult();
      } else if (button == 'C') {
        userAnswer = '';
      } else if (button == 'DEL') {
        if (userAnswer.isNotEmpty) {
          userAnswer = userAnswer.substring(0, userAnswer.length - 1);
        }
      }
      // maximum of 3 digit numbers
      else if (userAnswer.length < 3) {
        userAnswer += button;
      }
    });
  }

  void checkResult() {
    if (a + b == int.parse(userAnswer)) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.deepPurple,
              content: Container(
                height: 200,
                // color: Colors.deepPurple,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Correct!',
                      style: whiteTextStyle,
                    ),
                    GestureDetector(
                      onTap: goToNextQuestion,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.deepPurple.shade300,
                            borderRadius: BorderRadius.circular(8)),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          });
    } else
      print('not correct');
  }

  var RandomNumber = Random();

  void goToNextQuestion() {
    Navigator.of(context).pop();

    setState(() {
      userAnswer = '';
    });

    // create a new question
    a = RandomNumber.nextInt(10);
    b = RandomNumber.nextInt(10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      body: Column(
        children: [
          // TODO: level progress, player need 5 correct answers in a row to get to the next level
          Container(
            height: 160,
            color: Colors.deepPurple,
          ),
          // question
          Expanded(
            child: Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      a.toString() + ' + ' + b.toString() + ' = ',
                      style: whiteTextStyle,
                    ),

                    //answer box
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade400,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          userAnswer,
                          style: whiteTextStyle,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: numpad.length,
                itemBuilder: (BuildContext context, int index) {
                  return MyButton(
                    child: numpad[index],
                    onTap: () => buttonTapped(numpad[index]),
                  );
                },
              ),
            ),
          )
          //number pad
        ],
      ),
    );
  }
}
