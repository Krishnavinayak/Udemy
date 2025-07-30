import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/choosegender.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/results.dart';
import 'package:bmi_calculator/reusable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



enum Gender {male, female}
class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child: 
                ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                    
                  },
                  colour: selectedGender == Gender.male? activecolour : inactivecolour,
                  cardChild: ChooseGender(iconName: FontAwesomeIcons.mars, gender: "Male",),)),
                Expanded(child: ReusableCard(onPress: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                  colour: selectedGender == Gender.female? activecolour : inactivecolour,
                cardChild: ChooseGender(iconName: FontAwesomeIcons.venus, gender: "Female",),))
              ],
            )),
          Expanded(child: ReusableCard(
            colour: activecolour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Height",style: labelText,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(),
                    style: kNumberTextStyle),
                    Text("cm",
                    style: labelText,)
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xff8D8E98),
                    thumbColor: Color(0xffEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)

                  ),
                  child: Slider(
                    value: height.toDouble(),  
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    }),
                )
              ],
            ),
            )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: activecolour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Weight", style: labelText,),
                        Text(weight.toString(),style: kNumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconbutton(icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },),
                            SizedBox(width: 10,),
                            RoundIconbutton(icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },)
                          ],
                        )
                      ],
                    ),)),
                Expanded(child: ReusableCard(colour: activecolour,
                cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Age", style: labelText,),
                        Text(age.toString(),style: kNumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconbutton(icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },),
                            SizedBox(width: 10,),
                            RoundIconbutton(icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },)
                          ],
                        )
                      ],
                    ),))
              ],
            )),
          BottomButton(buttonTitle: "CALCULATE", onTap: () {
            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
        Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ResultPage(
      bmiResult: calc.calculateBMI(),
      bmi: calc.getResult(),
      interpretation: calc.getInterpretation(),
    ),
  ),
);

      },)
        ],
      )
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key, required this.onTap, required this.buttonTitle
  });
  final VoidCallback onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: bottomcolour,
        margin: EdgeInsets.only(top: 10.0),
        height: bottomheight,
        width: double.infinity,
        child: Center(child: Text(buttonTitle,style: TextStyle(color: Colors.white, fontSize: 25),)),
      ),
    );
  }
}

class RoundIconbutton extends StatelessWidget {
  const RoundIconbutton({required this.icon, required this.onPressed});
  final IconData? icon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Color(0xff4C4F5E),
      onPressed: onPressed,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      child: FaIcon(icon),
    );
  }
}





