import 'package:flutter/material.dart';
import 'package:untitled8/components/general_card.dart';
import 'package:untitled8/components/calc_btn.dart';
import 'package:untitled8/constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.description,
      required this.result,
      required this.resultWord});

  final String result;
  final String resultWord;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: GeneralCard(
              onPress: () {},
              colour: kActiveCardColour,
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultWord.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    result,
                    style: kBMITextStyle,
                  ),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          CalcButton(
            buttonName: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
