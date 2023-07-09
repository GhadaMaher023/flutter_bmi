import 'package:flutter/material.dart';
import 'package:untitled8/constants.dart';

class CalcButton extends StatelessWidget {
  const CalcButton({required this.onTap, required this.buttonName});

  final Function() onTap;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(buttonName, style: kCalcButtonTextStyle),
        ),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(8),
        width: double.infinity,
        height: 80,
        color: kBottomContainerColour,
      ),
    );
  }
}
