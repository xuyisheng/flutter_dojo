import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class StepperWidget extends StatefulWidget {
  @override
  _StepperWidgetState createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('Stepper基本使用'),
        Expanded(
          child: Stepper(
            currentStep: _currentStep,
            onStepContinue: () {
              if (_currentStep >= 4) return;
              setState(() {
                _currentStep += 1;
              });
            },
            onStepCancel: () {
              if (_currentStep <= 0) return;
              setState(() {
                _currentStep -= 1;
              });
            },
            steps: const <Step>[
              Step(
                title: Text('Step 1'),
                content: SizedBox(
                  width: 100.0,
                  height: 100.0,
                ),
              ),
              Step(
                title: Text('Step 2'),
                content: SizedBox(
                  width: 100.0,
                  height: 100.0,
                ),
              ),
              Step(
                title: Text('Step 3'),
                content: SizedBox(
                  width: 100.0,
                  height: 100.0,
                ),
              ),
              Step(
                title: Text('Step 4'),
                content: SizedBox(
                  width: 100.0,
                  height: 100.0,
                ),
              ),
              Step(
                title: Text('Step 5'),
                content: SizedBox(
                  width: 100.0,
                  height: 100.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
