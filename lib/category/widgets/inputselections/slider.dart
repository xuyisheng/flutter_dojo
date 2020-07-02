import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double value = 0;
  var rangeValues = const RangeValues(20, 80);
  var distValue = 50.0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('Slider基本用法'),
        Slider(
          value: value,
          min: 0,
          max: 100,
          onChanged: (v) {
            setState(() => value = v.roundToDouble());
          },
        ),
        MainTitleWidget('Slider adaptive'),
        SubtitleWidget('根据平台的不同产生不同风格的Slider'),
        Slider.adaptive(
          value: value,
          min: 0,
          max: 100,
          onChanged: (v) {
            setState(() => value = v.roundToDouble());
          },
        ),
        MainTitleWidget('Custom Slider with divisions'),
        Slider(
          value: value,
          inactiveColor: Colors.yellow,
          label: 'Now : $value',
          min: 0.0,
          max: 100.0,
          divisions: 10,
          activeColor: Colors.black,
          //进度中活动部分的颜色
          onChanged: (v) {
            setState(() => value = v.roundToDouble());
          },
        ),
        MainTitleWidget('RangeSlider'),
        RangeSlider(
          activeColor: Colors.blue,
          inactiveColor: Colors.red,
          divisions: 100,
          values: rangeValues,
          min: 0.0,
          max: 100.0,
          onChanged: (RangeValues values) {
            setState(() {
              rangeValues = values;
            });
          },
          labels: RangeLabels(
            '${rangeValues.start.round()}',
            '${rangeValues.end.round()}',
          ),
        ),
        RangeSlider(
          values: RangeValues(0.3, 0.7),
          onChanged: null,
        ),
        MainTitleWidget('自定义Slider'),
        SliderView(
          distValue: distValue,
          onChangedistValue: (double value) {
            distValue = value;
          },
        ),
      ],
    );
  }
}

class SliderView extends StatefulWidget {
  const SliderView({Key key, this.onChangedistValue, this.distValue}) : super(key: key);

  final Function(double) onChangedistValue;
  final double distValue;

  @override
  _SliderViewState createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  double distValue = 5.0;

  @override
  void initState() {
    distValue = widget.distValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: distValue.round(),
                child: const SizedBox(),
              ),
              Container(
                width: 170,
                child: Text(
                  'Value ${distValue.toStringAsFixed(1)}',
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 100 - distValue.round(),
                child: const SizedBox(),
              ),
            ],
          ),
          SliderTheme(
            data: SliderThemeData(
              thumbShape: CustomThumbShape(),
            ),
            child: Slider(
              onChanged: (double value) {
                setState(() {
                  distValue = value;
                });
                try {
                  widget.onChangedistValue(distValue);
                } catch (_) {}
              },
              min: 0,
              max: 100,
              activeColor: Colors.grey,
              inactiveColor: Colors.grey.withOpacity(0.4),
              divisions: 100,
              value: distValue,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomThumbShape extends SliderComponentShape {
  static const double _thumbSize = 3.0;
  static const double _disabledThumbSize = 3.0;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return isEnabled ? const Size.fromRadius(_thumbSize) : const Size.fromRadius(_disabledThumbSize);
  }

  static final Animatable<double> sizeTween = Tween<double>(
    begin: _disabledThumbSize,
    end: _thumbSize,
  );

  @override
  void paint(
    PaintingContext context,
    Offset thumbCenter, {
    Animation<double> activationAnimation,
    Animation<double> enableAnimation,
    bool isDiscrete,
    TextPainter labelPainter,
    RenderBox parentBox,
    SliderThemeData sliderTheme,
    TextDirection textDirection,
    double value,
  }) {
    final Canvas canvas = context.canvas;
    final ColorTween colorTween = ColorTween(
      begin: sliderTheme.disabledThumbColor,
      end: sliderTheme.thumbColor,
    );
    canvas.drawPath(
        Path()
          ..addOval(
            Rect.fromPoints(
              Offset(thumbCenter.dx + 12, thumbCenter.dy + 12),
              Offset(thumbCenter.dx - 12, thumbCenter.dy - 12),
            ),
          )
          ..fillType = PathFillType.evenOdd,
        Paint()
          ..color = Colors.black.withOpacity(0.5)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, convertRadiusToSigma(8)));

    final Paint cPaint = Paint();
    cPaint..color = Colors.white;
    cPaint..strokeWidth = 14 / 2;
    canvas.drawCircle(Offset(thumbCenter.dx, thumbCenter.dy), 12, cPaint);
    cPaint..color = colorTween.evaluate(enableAnimation);
    canvas.drawCircle(Offset(thumbCenter.dx, thumbCenter.dy), 10, cPaint);
  }

  double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }
}
