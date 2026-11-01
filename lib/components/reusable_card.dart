import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget? cardChild;
  final VoidCallback? onTap;

  const ReusableCard({super.key, required this.color, this.cardChild, this.onTap});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        // width: 200,
        // height: 200,
        margin: EdgeInsets.all(15),
        child: cardChild,
      ),
    );
  }
}