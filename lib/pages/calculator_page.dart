import 'package:flutter/material.dart';
import 'package:untitled8/components/calc_btn.dart';
import 'package:untitled8/components/general_card.dart';
import 'package:untitled8/components/icon_structure.dart';
import 'package:untitled8/components/my_fab.dart';
import 'package:untitled8/constants.dart';
import 'package:untitled8/oop/bmi_logic.dart';
import 'package:untitled8/pages/result_page.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  bool isMale = true;
  int height = 150;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GeneralCard(
                    onPress: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    colour: isMale ? kActiveCardColour : kInActiveCardColour,
                    cardWidget: IconStructure(icon: Icons.male, label: 'MALE'),
                  ),
                ),
                Expanded(
                  child: GeneralCard(
                    onPress: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    colour: isMale ? kInActiveCardColour : kActiveCardColour,
                    cardWidget:
                        IconStructure(icon: Icons.female, label: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GeneralCard(
              onPress: () {},
              colour: kActiveCardColour,
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Colors.grey,
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: GeneralCard(
                  onPress: () {},
                  colour: kActiveCardColour,
                  cardWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyFab(
                              icon: Icons.minimize,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              }),
                          SizedBox(
                            width: 8,
                          ),
                          MyFab(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: GeneralCard(
                        onPress: () {},
                        colour: kActiveCardColour,
                        cardWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyFab(
                                    icon: Icons.minimize,
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    }),
                                SizedBox(
                                  width: 8,
                                ),
                                MyFab(
                                    icon: Icons.add,
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    }),
                              ],
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ),
          CalcButton(
            buttonName: 'CALCULATE',
            onTap: () {
              BmiLogic calc = BmiLogic(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    result: calc.calculateBMI(),
                    resultWord: calc.getResult(),
                    description: calc.showDescription(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
