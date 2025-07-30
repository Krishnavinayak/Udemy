import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
class ChooseGender extends StatelessWidget {
  const ChooseGender({super.key, required this.iconName, required this.gender});
  final IconData iconName;
  final String gender;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(iconName, size: 80,),
        SizedBox(height: 15,),
        Text(gender, style: labelText)
      ],
    );
  }
}