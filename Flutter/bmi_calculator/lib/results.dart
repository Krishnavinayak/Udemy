import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/inputpage.dart';
import 'package:bmi_calculator/reusable.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.bmiResult, required this.bmi, required this.interpretation});

  final String bmiResult;
  final String bmi;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator",),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text("Your Result", style: kTitleStyle,),
            )
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(colour:activecolour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(bmi, style: TextStyle(
                    color: Color(0xff24D876),
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),),
                  Text(bmiResult, style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold
                  ),),
                  Text(interpretation, style: TextStyle(
                    fontSize: 22,
                  
                  ),
                  textAlign: TextAlign.center,),

                  
                ],
              ),),
              ),
            BottomButton(onTap: (){
                    Navigator.pop(context);
                  }, buttonTitle: "RE-CALCULATE")
        ],
      ),
      );
  }
}