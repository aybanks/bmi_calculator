import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';


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
  int weight = 50;
  int age = 19;

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
          GestureDetector(
            onTap: (){
              // Navigator.pushNamed(context, '/results');
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage()));
            },
            child: Container(
              height: kBaseContainerHeight,
              color: kBaseBarColor,
              width: double.infinity,
              child: Center(child: Text('CALCULATE', style: TextStyle(fontSize: 20.0),)),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});
  final FaIconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0
      ),
      child: FaIcon(icon, color: Colors.white,),
    );
  }
}




