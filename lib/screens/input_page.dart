import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../../constants.dart';
import '../components/round_icon_button.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';


enum Gender {
  male, female
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  // Color maleCardColor = inactiveContainerColor;
  // Color femaleCardColor = inactiveContainerColor;

  Gender? gender;

  int height = 180;
  int weight = 70;
  int age = 20;

  String calculatedBmi = '';
  String resultText = '';
  String interpretation = '';

  // void updateColor(Gender gender) {
  //   // male pressed
  //   if (gender == Gender.male) {
  //     if (maleCardColor == inactiveContainerColor) {
  //       maleCardColor = activeContainerColor;
  //       femaleCardColor = inactiveContainerColor;
  //     }
  //     else {
  //       maleCardColor = inactiveContainerColor;
  //     }
  //   }
  //   // female pressed
  //   else {
  //     if (femaleCardColor == inactiveContainerColor) {
  //       femaleCardColor = activeContainerColor;
  //       maleCardColor = inactiveContainerColor;
  //     }
  //     else {
  //       femaleCardColor = inactiveContainerColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR')),
      body: Column(
        crossAxisAlignment:CrossAxisAlignment.stretch ,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    color: gender ==  Gender.male ? kActiveContainerColor : kInactiveContainerColor,
                    cardChild: IconContent(icon: FontAwesomeIcons.mars, gender: 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    color: gender == Gender.female ? kActiveContainerColor : kInactiveContainerColor,
                    cardChild: IconContent(icon: FontAwesomeIcons.venus, gender: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: ReusableCard(color: kActiveContainerColor, cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('HEIGHT', style: kGenderTextStyle,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  Text(height.toString(), style: kCardTextStyle),
                  Text('cm', style: kGenderTextStyle,),
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Color(0xFFFFFFFF),
                  inactiveTrackColor: Color(0xFF8D8E98),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  thumbColor: Color(0xFFEB1555),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
                  overlayColor: Color(0x29EB1555),
                ),
                child: Slider(value: height.toDouble(), min: 100, max: 200, onChanged: (double newValue) {setState(() {
                  height = newValue.toInt();
                });}),
              )
            ],
          ),)),
          Expanded(
            child: Row(
              children: [
                Expanded(child: ReusableCard(
                    color: kActiveContainerColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT', style: kGenderTextStyle),
                      Text(weight.toString(), style: kCardTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                            setState(() {
                              weight --;
                            });
                          },),
                          SizedBox(width: 10.0,),
                          RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                            setState(() {
                              weight ++;
                            });
                          })
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(child: ReusableCard(
                    color: kActiveContainerColor,
                  cardChild: Column(
                    mainAxisAlignment: .center,
                    children: [
                      Text('AGE', style: kGenderTextStyle),
                      Text(age.toString(), style: kCardTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                            setState(() {
                              age --;
                            });
                          },),
                          SizedBox(width: 10.0,),
                          RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                            setState(() {
                              age ++;
                            });
                          })
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
          BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: (){
                // Navigator.pushNamed(context, '/results');
                // results page should take in height and weight?
                CalculatorBrain calculator = CalculatorBrain(height: height, weight: weight);

                Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(bmiResult: calculator.bmiCalculator(), interpretaion: calculator.getInterpretation(), resultText: calculator.getResultText(),)));
              },
          ),
        ],
      ),
    );
  }
}




