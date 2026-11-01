import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
// import 'input_page.dart';
import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({required this.bmiResult, required this.resultText, required this.interpretaion});
  final String bmiResult;
  final String resultText;
  final String interpretaion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result', style: kCardTextStyle,),
          )
          ),
          Expanded(
            flex: 5,
              child: ReusableCard(
                color: kActiveContainerColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(resultText.toUpperCase(), style: kResultTextStyle,),
                    Text(bmiResult, style: kBMITextStyle,),
                    Text(interpretaion, style: kBodyTextStyle, textAlign: TextAlign.center,)
                  ],
            ),)),
          BottomButton(
              buttonTitle: 'RE-CALCULATE',
              onTap: (){
                Navigator.pop(context);
              }
          )
        ],
      ),
    );
  }
}

