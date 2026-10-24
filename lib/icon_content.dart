import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';


class IconContent extends StatelessWidget {
  final FaIconData icon;
  final String gender;


  const IconContent({super.key, required this.icon, required this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          icon,
          color: Colors.white,
          size: 80,
        ),
        SizedBox(height: 15.0),
        Text(
          gender,
          style: kGenderTextStyle,
        ),
      ],
    );
  }
}