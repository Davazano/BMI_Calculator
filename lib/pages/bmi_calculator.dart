import "package:bmi_calculator/cal_widgets/cal_buttons.dart";
import "package:flutter/material.dart";

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  var bmiAnswer = "BMI is ";

  final weightTextController = TextEditingController();
  final heightTextController = TextEditingController();

  late FocusNode weightFocusNode;
  late FocusNode heightFocusNode;

  final List<String> buttons = [
    "7",
    "8",
    "9",
    "<->",
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
  void initState() {
    super.initState();

    weightFocusNode = FocusNode();
    heightFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    weightTextController.dispose();
    weightFocusNode.dispose();
    heightTextController.dispose();
    heightFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              // color: Colors.deepPurple[100],
              //margin: const EdgeInsets.only(bottom: 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextField(
                      autofocus: true,
                      focusNode: weightFocusNode,
                      controller: weightTextController,
                      readOnly: true,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Enter your weight (kg)"),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextField(
                      focusNode: heightFocusNode,
                      controller: heightTextController,
                      readOnly: true,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Enter your height (m)"),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    alignment: Alignment.centerRight,
                    child: Text(
                      bmiAnswer,
                      style: const TextStyle(fontSize: 22),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.blue[300],
              margin: const EdgeInsets.only(top: 80.0),
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 3) {
                      // toggle focus button to toggle textfield focus
                      return CalButton(
                        buttonTapped: () {
                          setState(() {
                            if (weightFocusNode.hasFocus) {
                              heightFocusNode.requestFocus();
                            } else if (heightFocusNode.hasFocus) {
                              weightFocusNode.requestFocus();
                            }
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.black,
                        textColor: Colors.white,
                      );
                    } else if (index == 7) {
                      return CalButton(
                        buttonTapped: () {
                          setState(() {
                            if (weightFocusNode.hasFocus) {
                              weightTextController.text = "";
                            } else if (heightFocusNode.hasFocus) {
                              heightTextController.text = "";
                            }
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.red,
                        textColor: Colors.white,
                      );
                    } else if (index == 11) {
                      // Clear button to clear all text fields
                      return CalButton(
                        buttonTapped: () {
                          setState(() {
                            weightTextController.text = "";
                            heightTextController.text = "";
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.orange,
                        textColor: Colors.white,
                      );
                    } else if (index == 15) {
                      // BMI button to calculate BMI
                      return CalButton(
                        buttonTapped: () {
                          setState(() {
                            if (weightTextController.text.isNotEmpty &&
                                heightTextController.text.isNotEmpty) {
                              var height =
                                  double.parse(heightTextController.text);
                              var heightSquared = height * height;
                              bmiAnswer =
                                  "BMI is ${(double.parse(weightTextController.text) / heightSquared).toStringAsFixed(2)}";
                            }
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.indigo,
                        textColor: Colors.white,
                      );
                    } else {
                      return CalButton(
                        buttonTapped: () {
                          setState(() {
                            if (weightFocusNode.hasFocus) {
                              weightTextController.text +=
                                  checkAndFormatCalculatorInput(buttons[index],
                                      weightTextController.text);
                            } else if (heightFocusNode.hasFocus) {
                              heightTextController.text +=
                                  checkAndFormatCalculatorInput(buttons[index],
                                      heightTextController.text);
                            }
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.white,
                        textColor: Colors.indigo,
                      );
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }

  String checkAndFormatCalculatorInput(
      String buttonString, String textFieldString) {
    String value = "";
    if (!(buttonString == "." && textFieldString.contains("."))) {
      if (buttonString != "." && textFieldString == "0") {
        value = ".$buttonString";
      } else if (buttonString == "." && textFieldString == "") {
        value = "0$buttonString";
      } else {
        value = buttonString;
      }
    }
    return value;
  }
}
