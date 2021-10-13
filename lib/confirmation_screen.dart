import 'package:DBP/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:DBP/home_screen.dart';
import 'package:DBP/transfer.dart';
import 'package:intl/intl.dart';

var f = NumberFormat('###,###');

class ConfirmScreen extends StatefulWidget {
  const ConfirmScreen({Key? key}) : super(key: key);

  @override
  _ConfirmScreenState createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  List<Step> steps = [
    Step(
      title: const Text(
        "Please confirm if Transfer Amount is correct.",
        style: TextStyle(color: Color(0xFFFE971A)),
      ),
      isActive: true,
      state: StepState.complete,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              alignment: Alignment.topLeft,
              child: Text("Transfer Amount",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: 'Glacial Bold',
                    color: const Color(0xFFFE971A),
                    fontSize: 30,
                  ))),
          Container(
              alignment: Alignment.topLeft,
              child: Text("PHP " + f.format(Variables().money()).toString(),
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: 'Glacial Bold',
                    color: const Color(0xFFFE971A),
                    fontSize: 40,
                  ))),
        ],
      ),
    ),
    Step(
        isActive: true,
        state: StepState.complete,
        title: const Text(
          "Please confirm if Account Number is correct.",
          style: TextStyle(color: Color(0xFFFE971A)),
        ),
        content: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: Text("Account Number",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: 'Glacial Bold',
                    color: const Color(0xFFFE971A),
                    fontSize: 30,
                  )),
            ),
            Container(
                alignment: Alignment.topLeft,
                child: Text(Variables().number(),
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: 'Glacial Bold',
                      color: const Color(0xFFFE971A),
                      fontSize: 40,
                    )))
          ],
        )),
  ];
  StepperType stepperType = StepperType.horizontal;

  int currentStep = 0;
  bool complete = false;

  next() {
    currentStep + 1 != steps.length
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
    if (complete) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - currentStep);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  switchStepType() {
    setState(() => stepperType == StepperType.horizontal
        ? stepperType = StepperType.vertical
        : stepperType = StepperType.horizontal);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Color(0xFF231D25),
        appBar: AppBar(
          backgroundColor: Color(0xFF212121),
          centerTitle: true,
          title: Text("Confirmation"),
        ),
        body: Stack(
          children: <Widget>[
            Expanded(
              child: Theme(
                data: ThemeData(
                    colorScheme:
                        ColorScheme.light(primary: const Color(0xFFF25A14))),
                child: Stepper(
                  steps: steps,
                  currentStep: currentStep,
                  onStepContinue: next,
                  onStepCancel: cancel,
                  onStepTapped: (step) => goTo(step),
                ),
              ),
            )
          ],
        ));
  }
}
