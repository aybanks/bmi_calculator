import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR', style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
          Text('Your Result', style: kCardTextStyle,),
          Expanded(child: ReusableCard(color: kActiveContainerColor,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: .center,
                children: [
                  Text('OVERWEIGHT', style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight(900)),),
                ],
              ),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Text('26.7', style: kNewCardTextStyle,),
                ],
              ),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Expanded(child: Text('You have a higher than normal body weight. Try to exercise more.')),
                ],
              )
            ],
          )
            ,)),
          GestureDetector(
            onTap: (){
              // Navigator.pushNamed(context, '/results');
              Navigator.pop(context);
            },
            child: Container(
              height: kBaseContainerHeight,
              color: kBaseBarColor,
              width: double.infinity,
              child: Center(child: Text('RE-CALCULATE', style: TextStyle(fontSize: 20.0),)),
            ),
          )
        ],
      ),
    );
  }
}
