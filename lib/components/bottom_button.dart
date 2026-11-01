import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onTap;

  BottomButton({required this.buttonTitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: kBaseContainerHeight,
        color: kBaseBarColor,
        width: double.infinity,
        child: Center(child: Text(buttonTitle, style: TextStyle(fontSize: 20.0),)),
      ),
    );
  }
}