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
                child: Text(
                  "1 + 1 = ?",
                  style: whiteTextStyle,
                ),
              ),
            ),
          ),

          /// Number pad section
          Expanded(
            flex: 2,
            child: GridView.builder(
              itemCount: numberPad.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) {
                return MyButton(child: numberPad[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
