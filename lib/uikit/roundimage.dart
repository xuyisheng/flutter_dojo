import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class RoundImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey.withOpacity(0.2),
        child: Column(
          children: <Widget>[
            MainTitleWidget('通过BoxDecoration设置Shape'),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: AssetImage('images/book.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            MainTitleWidget('通过ClipRRect进行裁切'),
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                width: 100,
                height: 100,
                child: Image.asset('images/book.jpg'),
              ),
            ),
            MainTitleWidget('CircleAvatar'),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/book.jpg'),
            ),
            MainTitleWidget('通过Material进行裁切'),
            Material(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(25),
              child: Container(
                width: 100,
                height: 100,
                child: Image.asset('images/book.jpg'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
