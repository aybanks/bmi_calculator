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
              Slider(value: height.toDouble(), min: 100, max: 200, activeColor: Color(0xFFEB1555) ,inactiveColor: Color(0xFF8D8E98), onChanged: (double newValue) {setState(() {
                height = newValue.toInt();
              });})
            ],
          ),)),
          Expanded(
            child: Row(
              children: [
                Expanded(child: ReusableCard(color: kActiveContainerColor)),
                Expanded(child: ReusableCard(color: kActiveContainerColor)),
              ],
            ),
          ),
          Container(
            height: kBaseContainerHeight,
            color: kBaseBarColor,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
