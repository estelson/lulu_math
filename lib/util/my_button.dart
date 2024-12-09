import 'package:flutter/material.dart';
import 'package:lulu_math/const.dart';

class MyButton extends StatelessWidget {
  final String child;
  final VoidCallback onTap;

  const MyButton({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Color? purpleButtonColor = Colors.deepPurpleAccent;

    Color? deepPurpleButtonColor = Colors.deepPurple[300];
    Color? deepPurpleDarkerShadowColor = Colors.deepPurple[700];
    Color? deepPurpleLighterColor = Colors.deepPurple[200];

    Color? redButtonColor = Colors.red;

    Color? greenButtonColor = const Color.fromARGB(255, 70, 159, 38);

    Color? buttonColor = purpleButtonColor;
    Color? buttonDarkerShadowColor = deepPurpleDarkerShadowColor;
    Color? buttonLighterShadowColor = deepPurpleLighterColor;

    if(child == "C") {
      buttonColor = greenButtonColor;
    } else if(child == "DEL") {
      buttonColor = redButtonColor;
    } else if(child == "=") {
      buttonColor = purpleButtonColor;
      buttonDarkerShadowColor = deepPurpleDarkerShadowColor;
      buttonLighterShadowColor = deepPurpleLighterColor;
    } else {
      buttonColor = deepPurpleButtonColor;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              /// Darker shadow at bottom right
              BoxShadow(
                color: buttonDarkerShadowColor!,
                offset: const Offset(1, 1),
                blurRadius: 5,
                spreadRadius: 1,
              ),

              /// Lighter shadow at top left
              BoxShadow(
                color: buttonLighterShadowColor!,
                offset: const Offset(-1, -1),
                blurRadius: 5,
                spreadRadius: 1,
              ),
            ],
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
