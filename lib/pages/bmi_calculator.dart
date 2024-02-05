import "package:bmi_calculator/cal_widgets/cal_buttons.dart";
import "package:flutter/material.dart";

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  final List<String> buttons = [
    "7",
    "8",
    "9",
    "->",
    "4",
    "5",
    "6",
    "DEL",
    "1",
    "2",
    "3",
    "CE",
    "00",
    "0",
    ".",
    "BMI",
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
              margin: const EdgeInsets.only(top: 80.0),
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) { 
                  if (index == 3) {
                    return CalButton(
                      buttonText: buttons[index],
                      color: Colors.black,
                      textColor: Colors.white,
                    );
                  } else if (index == 7) {
                    return CalButton(
                      buttonText: buttons[index],
                      color: Colors.red,
                      textColor: Colors.white,
                    );
                  } else if (index == 11) {
                    return CalButton(
                      buttonText: buttons[index],
                      color: Colors.orange,
                      textColor: Colors.white,
                    );
                  } else if (index == 15) {
                    return CalButton(
                      buttonText: buttons[index],
                      color: Colors.indigo,
                      textColor: Colors.white,
                    );
                  } else {
                    return CalButton(
                      buttonText: buttons[index],
                      color: Colors.white,
                      textColor: Colors.indigo,
                    );
                  }
                  
                }
              ),
            ),
          ),
        ],
      ),
    );
  }
}
