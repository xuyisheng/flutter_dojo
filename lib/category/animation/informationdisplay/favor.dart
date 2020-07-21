import 'package:flutter/material.dart';

enum ScoreWidgetStatus { HIDDEN, BECOMING_VISIBLE, VISIBLE, BECOMING_INVISIBLE }

class FavorWidget extends StatefulWidget {
  @override
  _FavorWidgetState createState() => _FavorWidgetState();
}

class _FavorWidgetState extends State<FavorWidget> with TickerProviderStateMixin {
  int _counter = 0;
  ScoreWidgetStatus _scoreWidgetStatus = ScoreWidgetStatus.HIDDEN;
  final duration = Duration(milliseconds: 400);
  AnimationController scoreInAnimationController, scoreOutAnimationController, scoreSizeAnimationController;
  Animation scoreOutPositionAnimation;

  initState() {
    super.initState();
    scoreInAnimationController = AnimationController(duration: Duration(milliseconds: 150), vsync: this);
    scoreInAnimationController.addListener(() {
      setState(() {});
    });

    scoreOutAnimationController = AnimationController(vsync: this, duration: duration);
    scoreOutPositionAnimation = Tween(begin: 100.0, end: 150.0).animate(CurvedAnimation(parent: scoreOutAnimationController, curve: Curves.easeOut));
    scoreOutPositionAnimation.addListener(() {
      setState(() {});
    });
    scoreOutAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _scoreWidgetStatus = ScoreWidgetStatus.HIDDEN;
      }
    });

    scoreSizeAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    scoreSizeAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        scoreSizeAnimationController.reverse();
      }
    });
    scoreSizeAnimationController.addListener(() {
      setState(() {});
    });
  }

  dispose() {
    scoreInAnimationController.dispose();
    scoreOutAnimationController.dispose();
    super.dispose();
  }

  void increment() {
    scoreSizeAnimationController.forward(from: 0.0);
    setState(() => _counter++);
  }

  void onTapDown(TapDownDetails tap) {
    if (_scoreWidgetStatus == ScoreWidgetStatus.BECOMING_INVISIBLE) {
      scoreOutAnimationController.stop(canceled: true);
      _scoreWidgetStatus = ScoreWidgetStatus.VISIBLE;
    } else if (_scoreWidgetStatus == ScoreWidgetStatus.HIDDEN) {
      _scoreWidgetStatus = ScoreWidgetStatus.BECOMING_VISIBLE;
      scoreInAnimationController.forward(from: 0.0);
    }
    increment();
  }

  void onTapUp(TapUpDetails tap) {
    scoreOutAnimationController.forward(from: 0.0);
  }

  Widget getScoreButton() {
    var scorePosition = 0.0;
    var scoreOpacity = 0.0;
    var extraSize = 0.0;
    switch (_scoreWidgetStatus) {
      case ScoreWidgetStatus.HIDDEN:
        break;
      case ScoreWidgetStatus.BECOMING_VISIBLE:
      case ScoreWidgetStatus.VISIBLE:
        scorePosition = scoreInAnimationController.value * 100;
        scoreOpacity = scoreInAnimationController.value;
        extraSize = scoreSizeAnimationController.value * 3;
        break;
      case ScoreWidgetStatus.BECOMING_INVISIBLE:
        scorePosition = scoreOutPositionAnimation.value;
        scoreOpacity = 1.0 - scoreOutAnimationController.value;
    }
    return Positioned(
      child: Opacity(
        opacity: scoreOpacity,
        child: Container(
          height: 50.0 + extraSize,
          width: 50.0 + extraSize,
          decoration: ShapeDecoration(
            shape: CircleBorder(side: BorderSide.none),
            color: Colors.blue,
          ),
          child: Center(
            child: Text(
              '+' + _counter.toString(),
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0),
            ),
          ),
        ),
      ),
      bottom: scorePosition,
    );
  }

  Widget getClapButton() {
    var extraSize = 0.0;
    if (_scoreWidgetStatus == ScoreWidgetStatus.VISIBLE || _scoreWidgetStatus == ScoreWidgetStatus.BECOMING_VISIBLE) {
      extraSize = scoreSizeAnimationController.value * 3;
    }
    return GestureDetector(
      onTapUp: onTapUp,
      onTapDown: onTapDown,
      child: Container(
        height: 60.0 + extraSize,
        width: 60.0 + extraSize,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 1.0),
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.blue, blurRadius: 8.0)],
        ),
        child: Icon(
          Icons.favorite,
          color: Colors.blue,
          size: 40.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: FractionalOffset.center,
        overflow: Overflow.visible,
        children: <Widget>[
          getScoreButton(),
          getClapButton(),
        ],
      ),
    );
  }
}
