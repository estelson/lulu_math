import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lulu_math/const.dart';
import 'package:lulu_math/util/my_button.dart';
import 'package:lulu_math/util/result_message.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Number pad list
  List<String> numberPad = ["7", "8", "9", "C", "4", "5", "6", "DEL", "1", "2", "3", "=", "0"];

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
      } else if (userAnswer.length < 3) {
        /// Maximum of 4 numbers can be inputted
        userAnswer += button;
      }
    });
  }

  /// Check if user answer is correct or not
  void checkResult() {
    if (userAnswer.isNotEmpty) {
      if (numberA + numberB == int.parse(userAnswer)) {
        /// If correct
        showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(message: "Acertou!!!", onTap: goToNextQuestion, icon: Icons.arrow_forward);
          },
        );
      } else {
        /// If NOT correct
        showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(message: "Errou!!!", onTap: goBackToQuestion, icon: Icons.rotate_left);
          },
        );
      }
    } else {
      /// If NOT correct
      showDialog(
        context: context,
        builder: (context) {
          return ResultMessage(message: "Responda a questão!!!", onTap: goBackToQuestion, icon: Icons.cancel);
        },
      );
    }
  }

  /// Create random numbers
  var randomNumber = Random();

  /// Go to next question function
  void goToNextQuestion() {
    /// Dismiss alert dialog
    Navigator.of(context).pop();

    /// Reset values
    setState(() {
      userAnswer = "";
    });

    /// Create a new question
    numberA = randomNumber.nextInt(10);
    numberB = randomNumber.nextInt(10);
  }

  /// Go back to current question function
  void goBackToQuestion() {
    /// Dismiss alert dialog
    Navigator.of(context).pop();

    setState(() {
      userAnswer = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Olá Luiza!!!",
          style: whiteTextStyle,
        ),
      ),
      body: Column(
        children: [
          // Container(
          //   height: 160,
          //   width: MediaQuery.of(context).size.width,
          //   color: Colors.deepPurple,
          //   child: Center(child: Text("Olá Luiza!!!")),
          // ),

          /// Question section
          Expanded(
            child: Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// Question
                    Text(
                      "${numberA.toString()} + ${numberB.toString()} =  ",
                      style: whiteTextStyle,
                    ),

                    /// Answer box
                    Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: const Color(0xFF9575CD),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 2,
                            // color: Color(0xFF7D62AC),
                            color: Color(0xFFAD88EE),
                            offset: Offset(2, 2),
                          ),
                          BoxShadow(
                            blurRadius: 2,
                            // color: Color(0xFFAD88EE),
                            color: Color(0xFF7D62AC),
                            offset: Offset(-2, -2),
                          ),
                        ],
                        gradient: const LinearGradient(
                          stops: [0, 1],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF8669B9),
                            Color(0xFF9F7DDB),
                          ],
                        ),
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
