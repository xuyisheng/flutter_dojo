import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';
import 'package:flutter_dojo/style/app_color.dart';

class PageChangeAnimWidget extends StatefulWidget {
  @override
  _PageChangeAnimWidgetState createState() => _PageChangeAnimWidgetState();
}

class _PageChangeAnimWidgetState extends State<PageChangeAnimWidget> {
  PageController pageController;
  double currentPageValue = 0;
  var colors;
  var selectionValue = '';

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() => currentPageValue = pageController.page);
    });
    colors = List.generate(20, (index) {
      return AppColor.randomColor();
    }).toList();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MultiSelectionWidget(
          'ChangeAnim',
          [
            'Roll',
            'Rotate',
            'ThreeDRotate',
            'ThreeDRoll',
            'Spring',
            'Scale',
            'Translate',
          ],
          [
            'Roll',
            'Rotate',
            'ThreeDRotate',
            'ThreeDRoll',
            'Spring',
            'Scale',
            'Translate',
          ],
          (value) {
            setState(() => selectionValue = value);
          },
        ),
        Expanded(
          child: PageView.builder(
            controller: pageController,
            itemCount: 20,
            itemBuilder: (context, index) {
              var progress = currentPageValue - index;
              var color = colors[index];
              var widget;
              switch (selectionValue) {
                case 'Rotate':
                  widget = RotateWidget(progress, color);
                  break;
                case 'ThreeDRotate':
                  widget = ThreeDRotateWidget(progress, color);
                  break;
                case 'ThreeDRoll':
                  widget = ThreeDRollWidget(progress, color);
                  break;
                case 'Roll':
                  widget = RollWidget(progress, color);
                  break;
                case 'Spring':
                  widget = SpringWidget(progress, color);
                  break;
                case 'Spring':
                  widget = SpringWidget(progress, color);
                  break;
                case 'Scale':
                  widget = ScaleWidget(progress, color);
                  break;
                case 'Translate':
                  widget = TranslateWidget(progress, color);
                  break;
                default:
                  widget = Container(color: color);
                  break;
              }
              if (index == currentPageValue.floor()) {
                // 当前页
                return widget;
              } else if (index == currentPageValue.floor() + 1) {
                // 下一页
                return widget;
              } else {
                // 上一页
                return Container(color: color);
              }
            },
          ),
        )
      ],
    );
  }
}

class RollWidget extends StatelessWidget {
  final progress;
  final color;

  RollWidget(this.progress, this.color);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi * progress,
      child: Container(
        color: color,
        child: Center(child: Text('RollWidget')),
      ),
    );
  }
}

class RotateWidget extends StatelessWidget {
  final progress;
  final color;

  RotateWidget(this.progress, this.color);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..rotateY(progress)
        ..rotateZ(progress),
      child: Container(
        color: color,
        child: Center(child: Text('RotateWidget')),
      ),
    );
  }
}

class ThreeDRotateWidget extends StatelessWidget {
  final progress;
  final color;

  ThreeDRotateWidget(this.progress, this.color);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.004)
        ..rotateY(progress)
        ..rotateZ(progress),
      child: Container(
        color: color,
        child: Center(child: Text('ThreeDRotateWidget')),
      ),
    );
  }
}

class ThreeDRollWidget extends StatelessWidget {
  final progress;
  final color;

  ThreeDRollWidget(this.progress, this.color);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateX(progress)
        ..rotateY(progress)
        ..rotateZ(progress),
      child: Container(
        color: color,
        child: Center(child: Text('ThreeDRollWidget')),
      ),
    );
  }
}

class SpringWidget extends StatelessWidget {
  final progress;
  final color;

  SpringWidget(this.progress, this.color);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()..rotateY(progress),
      child: Container(
        color: color,
        child: Center(child: Text('SpringWidget')),
      ),
    );
  }
}

class ScaleWidget extends StatelessWidget {
  final progress;
  final color;

  ScaleWidget(this.progress, this.color);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()..scale(progress + 1, progress + 1),
      child: Container(
        color: color,
        child: Center(child: Text('ScaleWidget')),
      ),
    );
  }
}

class TranslateWidget extends StatelessWidget {
  final progress;
  final color;

  TranslateWidget(this.progress, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Transform(
          transform: Matrix4.translationValues(
            -progress * MediaQuery.of(context).size.width / 2,
            0.0,
            0.0,
          ),
          child: Text('TranslateWidget'),
        ),
      ),
    );
  }
}
