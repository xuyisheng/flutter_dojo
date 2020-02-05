import 'package:flutter/material.dart';

class SubtitleWidget extends StatelessWidget {
  final subtitle;

  SubtitleWidget(this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Text(
        subtitle,
        style: TextStyle(
          fontSize: 12,
          color: Colors.black38,
        ),
      ),
    );
  }
}
