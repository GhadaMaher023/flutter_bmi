import 'package:flutter/material.dart';
import 'package:untitled8/constants.dart';

class IconStructure extends StatelessWidget {
  const IconStructure({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
