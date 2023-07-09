import 'package:flutter/material.dart';

class GeneralCard extends StatelessWidget {
  const GeneralCard(
      {required this.onPress, required this.cardWidget, required this.colour});

  final Color colour;
  final Widget cardWidget;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardWidget,
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
