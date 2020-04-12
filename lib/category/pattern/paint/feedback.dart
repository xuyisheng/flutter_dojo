import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class FeedbackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('通过Material来实现InkWell的Feedback'),
        Container(
          color: Colors.red,
          height: 80.0,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.white.withOpacity(0.5),
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}
