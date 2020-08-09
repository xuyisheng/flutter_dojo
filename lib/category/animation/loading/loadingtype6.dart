import 'package:flutter/material.dart';

class LoadingType6 extends StatefulWidget {
  @override
  _LoadingType6State createState() => _LoadingType6State();
}

class _LoadingType6State extends State<LoadingType6> with SingleTickerProviderStateMixin {
  Animation<double> loaderAnimation1;
  Animation<double> loaderAnimation2;
  Animation<double> loaderAnimation3;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: Duration(seconds: 1), vsync: this);

    loaderAnimation1 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0,
          0.71,
          curve: Curves.linear,
        ),
      ),
    );

    loaderAnimation2 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.1,
          0.81,
          curve: Curves.linear,
        ),
      ),
    );

    loaderAnimation3 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.2,
          0.91,
          curve: Curves.linear,
        ),
      ),
    );

    controller.addListener(() {
      setState(() {});
    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Opacity(
          opacity: loaderAnimation1.value <= 0.3
              ? 2.5 * loaderAnimation1.value
              : (loaderAnimation1.value > 0.30 && loaderAnimation1.value <= 0.70)
                  ? 1.0
                  : 2.5 - (2.5 * loaderAnimation1.value),
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              width: 30,
              height: 30,
              color: Colors.red,
            ),
          ),
        ),
        Opacity(
          opacity: loaderAnimation2.value <= 0.3
              ? 2.5 * loaderAnimation2.value
              : (loaderAnimation2.value > 0.30 && loaderAnimation2.value <= 0.70)
                  ? 1.0
                  : 2.5 - (2.5 * loaderAnimation2.value),
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              width: 30,
              height: 30,
              color: Colors.blue,
            ),
          ),
        ),
        Opacity(
          opacity: loaderAnimation3.value <= 0.3
              ? 2.5 * loaderAnimation3.value
              : (loaderAnimation3.value > 0.30 && loaderAnimation3.value <= 0.70)
                  ? 1.0
                  : 2.5 - (2.5 * loaderAnimation3.value),
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              width: 30,
              height: 30,
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }
}
