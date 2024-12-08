import 'package:flutter/material.dart';
import 'package:lulu_math/const.dart';

class MyButton extends StatelessWidget {
  final String child;

  const MyButton({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple[200],
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            child,
            style: whiteTextStyle,
          ),
        ),
      ),
    );
  }
}
