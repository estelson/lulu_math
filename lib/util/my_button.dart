import 'package:flutter/material.dart';
import 'package:lulu_math/const.dart';

class MyButton extends StatelessWidget {
  final String child;
  final VoidCallback onTap;

  const MyButton({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Color? buttonColor = Colors.deepPurple[400];

    if(child == "C") {
      buttonColor = Colors.green;
    } else if(child == "DEL") {
      buttonColor = Colors.red;
    } else if(child == "=") {
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
