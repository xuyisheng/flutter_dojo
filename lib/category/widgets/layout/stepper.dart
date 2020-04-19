import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class StepperWidget extends StatefulWidget {
  @override
  _StepperWidgetState createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  int _currentStep = 0;
  bool isVertical = true;

  @override
  Widget build(BuildContext context) {
    var stepData = [
      Step(
        title: Text(
          'Step 1',
          style: TextStyle(color: _currentStep == 0 ? Colors.blueAccent : Colors.grey),
        ),
        isActive: _currentStep == 0,
        state: changeTitleIcon(0),
        content: SizedBox(
          width: 100.0,
          height: 100.0,
          child: Text('Content1'),
        ),
      ),
      Step(
        title: Text(
          'Step 2',
          style: TextStyle(color: _currentStep == 1 ? Colors.blueAccent : Colors.grey),
        ),
        isActive: _currentStep == 1,
        state: changeTitleIcon(1),
        content: SizedBox(
          width: 100.0,
          height: 100.0,
          child: Text('Content2'),
        ),
      ),
      Step(
        title: Text(
          'Step 3',
          style: TextStyle(color: _currentStep == 2 ? Colors.blueAccent : Colors.grey),
        ),
        isActive: _currentStep == 2,
        state: changeTitleIcon(2),
        content: SizedBox(
          width: 100.0,
          height: 100.0,
          child: Text('Content3'),
        ),
      )
    ];
    return Column(
      children: <Widget>[
        MainTitleWidget('Stepper基本使用'),
        Row(
          children: <Widget>[
            Text('竖屏模式'),
            Switch(
              value: isVertical,
              onChanged: (v) {
                setState(() => isVertical = v);
              },
            )
          ],
        ),
        Expanded(
          child: Stepper(
            type: isVertical ? StepperType.vertical : StepperType.horizontal,
            currentStep: _currentStep,
            onStepContinue: () {
              if (_currentStep >= 2) return;
              setState(() => _currentStep += 1);
            },
            onStepCancel: () {
              if (_currentStep <= 0) return;
              setState(() => _currentStep -= 1);
            },
            onStepTapped: (index) {
              setState(() => _currentStep = index);
            },
            controlsBuilder: (_, {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
              return Row(
                children: <Widget>[
                  RaisedButton(
                    color: Colors.red,
                    onPressed: onStepCancel,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.arrow_back, color: Colors.white),
                        Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: onStepContinue,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.check, color: Colors.white),
                        Text(
                          'OK',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            steps: stepData,
          ),
        ),
      ],
    );
  }

  changeTitleIcon(index) {
    if (_currentStep == index) return StepState.editing;
    if (_currentStep > index) return StepState.complete;
    return StepState.indexed;
  }
}
