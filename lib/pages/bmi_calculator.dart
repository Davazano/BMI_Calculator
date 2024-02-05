import "package:bmi_calculator/cal_widgets/cal_buttons.dart";
import "package:flutter/material.dart";

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {

  final List<String> buttons = [
    "7", "8", "9", "->",
    "4", "5", "6", "DEL",
    "1", "2", "3", "CE",
    "0", ".", "BMI",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(),
          ),
          Expanded(
            flex: 2,
            child: Container(
              // color: Colors.indigo,
              child: const Center(
                child: CalButton(
                  color: Colors.indigo,
                  textColor: Colors.white,
                  buttonText: "0",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
