import "package:bmi_calculator/cal_widgets/cal_buttons.dart";
import "package:flutter/material.dart";

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  var userAnswer = "BMI is ";

  final weightTextController = TextEditingController();
  final heightTextController = TextEditingController();

  late FocusNode weightFocusNode;

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
  void initState() {
    super.initState();

    weightFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    weightTextController.dispose();
    weightFocusNode.dispose();
    heightTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
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
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextField(
                      focusNode: weightFocusNode,
                      controller: weightTextController,
                      readOnly: true,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Enter your weight"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextField(
                      controller: heightTextController,
                      readOnly: true,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Enter your height"),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userAnswer,
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
              color: Colors.deepPurple,
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
                        buttonTapped: () {
                          setState(() {
                            if (weightFocusNode.hasFocus) {
                              weightTextController.text += buttons[index];
                            } else {
                              heightTextController.text += buttons[index];
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
}
