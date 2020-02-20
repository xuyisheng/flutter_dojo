import 'package:flutter/material.dart';
import 'package:flutter_dojo/animation/loading/loadingflip.dart';
import 'package:flutter_dojo/animation/loading/loadingtype1.dart';
import 'package:flutter_dojo/animation/loading/loadingtype2.dart';
import 'package:flutter_dojo/animation/loading/loadingtype3.dart';
import 'package:flutter_dojo/animation/loading/loadingtype4.dart';
import 'package:flutter_dojo/animation/loading/loadingtype5.dart';
import 'package:flutter_dojo/animation/loading/loadingtype6.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        LoadingType1(),
        LoadingType2(
          radius: 20,
          dotRadius: 4,
        ),
        LoadingType3(
          dotType: DotType.circle,
        ),
        LoadingType4(),
        Align(
          alignment: Alignment.topLeft,
          child: LoadingTypeFlip(
            loaderBackground: Colors.red,
            iconColor: Colors.white,
            icon: Icons.email,
            animationType: "full_flip",
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: LoadingTypeFlip(
            loaderBackground: Colors.blueAccent,
            iconColor: Colors.orangeAccent,
            icon: Icons.subway,
            animationType: "half_flip",
            rotateIcon: true,
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: LoadingTypeFlip(
            loaderBackground: Colors.green,
            iconColor: Colors.white,
            icon: Icons.wifi,
            animationType: "half_flip",
            shape: "circle",
            rotateIcon: false,
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: LoadingType5(size: Size(200, 200)),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: LoadingType6(),
        ),
      ],
    );
  }
}
