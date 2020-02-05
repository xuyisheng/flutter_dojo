import 'package:flutter/material.dart';

class DojoMainPageListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imgUrl;
  final onTap;

  DojoMainPageListItem(this.title, this.subtitle, this.imgUrl, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(16),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomLeft,
              children: <Widget>[
                Image.asset(imgUrl),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 24,
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
