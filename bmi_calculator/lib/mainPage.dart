import 'package:flutter/material.dart';
import 'reuseablecard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'icon.dart';
import 'result.dart';
import 'brain.dart';

class MainPage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  Color maleColor;
  Color femaleColor;
  int height = 125;
  int age = 20;
  int weight = 55;
  gender gendr = gender.female;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Center(
            child: Text('BMI Calculator'),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour:
                          gendr == gender.male ? activeColor : inActiveColor,
                      onTap: () {
                        setState(() {
                          gendr = gender.male;
                        });
                      },
                      child: GenderIcon(
                        gender: 'MALE',
                        icon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onTap: () {
                        setState(() {
                          gendr = gender.female;
                        });
                      },
                      colour:
                          gendr == gender.female ? activeColor : inActiveColor,
                      child: GenderIcon(
                        gender: 'FEMALE',
                        icon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: activeColor,
                      child: Column(
                        children: [
                          Text(
                            'HEIGHT',
                            style: tStyle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            textBaseline: TextBaseline.alphabetic,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: [
                              Text(
                                height.toString(),
                                style: tbStyle,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'cm',
                                style: tStyle,
                              )
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Color(0x29FFFFFF),
                              thumbColor: Color(0xFF03A9F4),
                              thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 15,
                              ),
                              overlayShape: RoundSliderOverlayShape(
                                overlayRadius: 30,
                              ),
                              overlayColor: Color(0x2903A9F4),
                            ),
                            child: Slider(
                              onChanged: (newValue) {
                                setState(() {
                                  height = newValue.round();
                                });
                              },
                              value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: activeColor,
                      onTap: () {},
                      child: Column(
                        children: [
                          Text(
                            'WEIGHT',
                            style: tStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            weight.toString(),
                            style: tbStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                colour: Colors.blue,
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight > 35 ? weight-- : weight;
                                    ;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              RoundIconButton(
                                colour: Colors.blue,
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight < 150 ? weight++ : weight;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onTap: () {},
                      colour: activeColor,
                      child: Column(
                        children: [
                          Text(
                            'AGE',
                            style: tStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            age.toString(),
                            style: tbStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                colour: Colors.blue,
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age > 5 ? age-- : age;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              RoundIconButton(
                                colour: Colors.blue,
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age < 95 ? age++ : age;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                BMI calculator =
                    BMI(height: height.toDouble(), weight: weight.toDouble());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Result(
                      bmi: calculator.calculate_bmi(),
                      suggestion: calculator.suggestion(),
                      category: calculator.Category(),
                    ),
                  ),
                );
              },
              child: Container(
                height: 55,
                color: Colors.blue,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: tStyle,
                  ),
                ),
                padding: EdgeInsets.all(5),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final Function onPressed;
  final Color colour;
  final IconData icon;
  RoundIconButton({this.onPressed, this.colour, this.icon});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      onPressed: onPressed,
      fillColor: colour,
      child: Icon(icon),
    );
  }
}
