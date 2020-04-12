import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class ShadowMaskWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MainTitleWidget('通过叠加Container的LinearGradient实现遮罩效果'),
          Container(
            height: 300,
            child: Stack(
              children: <Widget>[
                Image.asset("images/owl.jpg", fit: BoxFit.cover, width: double.infinity),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [const Color(0x00000000), const Color(0xD9333333)],
                      stops: [0.0, 0.9],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(0.0, 1.0),
                    ),
                  ),
                )
              ],
            ),
          ),
          MainTitleWidget('通过DecorationImage的colorFilter实现遮罩效果'),
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("images/owl.jpg"),
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4),
                  BlendMode.multiply,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
