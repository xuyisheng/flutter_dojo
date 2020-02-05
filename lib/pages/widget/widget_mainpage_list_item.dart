import 'package:flutter/material.dart';

class WidgetMainPageListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imgUrl;
  final onTap;

  WidgetMainPageListItem(this.title, this.subtitle, this.imgUrl, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                left: 70,
                right: 20,
              ),
              padding: EdgeInsets.only(
                left: 50,
                right: 20,
              ),
              constraints: BoxConstraints(minHeight: 100),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        subtitle,
                        style: TextStyle(
                          color: Color(0xffb6b2df),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xff333366),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: ClipOval(
                child: Container(
                  color: Colors.white70,
                  child: Image.asset(
                    imgUrl,
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
