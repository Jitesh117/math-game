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
  String userAnswer = '';
  void buttonTapped(String button) {
    setState(() {
      userAnswer += button;
    });
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
                      '1+1 = ',
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
