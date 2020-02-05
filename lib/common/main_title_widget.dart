import 'package:flutter/material.dart';

class MainTitleWidget extends StatelessWidget {
  final title;

  MainTitleWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 2, color: getGoogleBlue()),
          bottom: BorderSide(width: 2, color: getGoogleBlue()),
          left: BorderSide(width: 10, color: getGoogleBlue()),
          right: BorderSide(width: 2, color: getGoogleBlue()),
        ),
      ),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(8),
        child: Text(
          title,
          style: TextStyle(
            color: getGoogleBlue(),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

getGoogleBlue() => Color(0xFF2d85f0);
