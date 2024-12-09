import 'package:flutter/material.dart';
import 'package:lulu_math/const.dart';
import 'package:lulu_math/util/my_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Number pad list
  List<String> numberPad = [
    "7",
    "8",
    "9",
    "C",
    "4",
    "5",
    "6",
    "DEL",
    "1",
    "2",
    "3",
    "=",
    "0",
  ];

  /// Number A, number B
  int numberA = 1;
  int numberB = 1;

  /// User answers
  String userAnswer = "";

  /// User tapped a button function
  void buttonTapped(String button) {
    setState(() {
      if (button == "=") {
        /// Calculate if user answer is correct or not
        checkResult();
      } else if (button == "C") {
        /// Clear the input
        userAnswer = "";
      } else if (button == "DEL") {
        /// Delete the last number
        if (userAnswer.isNotEmpty) {
          userAnswer = userAnswer.substring(0, userAnswer.length - 1);
        }
      } else if (userAnswer.length < 4) {
        /// Maximum of 4 numbers can be inputted
        userAnswer += button;
      }
    });
  }

  /// Check if user answer is correct or not
  void checkResult() {
    if (userAnswer.isNotEmpty) {
      if (numberA + numberB == int.parse(userAnswer)) {
        debugPrint("");
        debugPrint("CORRECT!");
        debugPrint("");
      } else {
        debugPrint("");
        debugPrint("INCORRECT!");
        debugPrint("");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body: Column(
        children: [
          /// Level progress section=> Player needs 5 correct answers in a row to proceed to next level
          Container(
            height: 160,
            color: Colors.deepPurple,
          ),

          /// Question section
          Expanded(
            child: Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// Question
                    Text(
                      "${numberA.toString()} + ${numberB.toString()} = ",
                      style: whiteTextStyle,
                    ),

                    /// Answer box
                    Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[400],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          userAnswer,
                          style: whiteTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// Number pad section
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: GridView.builder(
                itemCount: numberPad.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  return MyButton(
                    child: numberPad[index],
                    onTap: () => buttonTapped(numberPad[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
