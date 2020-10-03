import 'dart:math' as math;

import 'package:flutter/material.dart';

class RollCardWidget extends StatefulWidget {
  @override
  _RollCardWidgetState createState() => _RollCardWidgetState();
}

class _RollCardWidgetState extends State<RollCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[RollCardWithRotation(), RollCardWithScale()],
    );
  }
}

class RollCardWithRotation extends StatefulWidget {
  @override
  _RollCardWithRotationState createState() => _RollCardWithRotationState();
}

class _RollCardWithRotationState extends State<RollCardWithRotation> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool _flag = true;
  Color _color = Colors.blue;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1), value: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          onPressed: () async {
            if (_flag) {
              await _controller.reverse();
              setState(() {
                _color = Colors.orange;
              });
              await _controller.forward();
            } else {
              await _controller.reverse();
              setState(() {
                _color = Colors.blue;
              });
              await _controller.forward();
            }
            _flag = !_flag;
          },
          child: Text('Roll'),
        ),
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform(
              transform: Matrix4.rotationX((1 - _controller.value) * math.pi / 2),
              alignment: Alignment.center,
              child: Container(
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(vertical: 12),
                alignment: Alignment.center,
                decoration: BoxDecoration(color: _color.withOpacity(0.2), border: Border.all(color: Colors.grey)),
                child: FlutterLogo(textColor: _color, size: double.maxFinite),
              ),
            );
          },
        ),
      ],
    );
  }
}

class RollCardWithScale extends StatefulWidget {
  RollCardWithScaleState createState() => RollCardWithScaleState();
}

class RollCardWithScaleState extends State<RollCardWithScale> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _frontScale;
  Animation<double> _backScale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _frontScale = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.5, curve: Curves.easeIn),
    ));
    _backScale = CurvedAnimation(
      parent: _controller,
      curve: Interval(0.5, 1.0, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            setState(() {
              if (_controller.isCompleted || _controller.velocity > 0)
                _controller.reverse();
              else
                _controller.forward();
            });
          },
          child: Text('Roll'),
        ),
        Stack(
          children: <Widget>[
            AnimatedBuilder(
              child: CustomCard(colors: Colors.orange),
              animation: _backScale,
              builder: (BuildContext context, Widget child) {
                final Matrix4 transform = Matrix4.identity()..scale(1.0, _backScale.value, 1.0);
                return Transform(
                  transform: transform,
                  alignment: FractionalOffset.center,
                  child: child,
                );
              },
            ),
            AnimatedBuilder(
              child: CustomCard(colors: Colors.blue),
              animation: _frontScale,
              builder: (BuildContext context, Widget child) {
                final Matrix4 transform = Matrix4.identity()..scale(1.0, _frontScale.value, 1.0);
                return Transform(
                  transform: transform,
                  alignment: FractionalOffset.center,
                  child: child,
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

class CustomCard extends StatelessWidget {
  CustomCard({this.colors});

  final MaterialColor colors;

  Widget build(BuildContext context) {
    return Container(
      alignment: FractionalOffset.center,
      height: 144.0,
      width: 360.0,
      decoration: BoxDecoration(
        color: colors.shade50,
        border: Border.all(color: Color(0xFF9E9E9E)),
      ),
      child: FlutterLogo(size: 100.0, textColor: colors),
    );
  }
}
