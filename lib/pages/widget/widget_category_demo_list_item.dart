import 'package:flutter/material.dart';

class WidgetCategoryDemoListItem extends StatelessWidget {
  final title;
  final subtitle;
  final icon;
  final onTap;

  WidgetCategoryDemoListItem(this.title, this.subtitle, this.icon, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(8),
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 24),
              width: double.infinity,
              constraints: BoxConstraints(minHeight: 48),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 114, 123, 225),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                margin: EdgeInsets.only(
                  left: 96,
                  top: 24,
                  bottom: 24,
                  right: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Text(
                        subtitle,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(6),
              margin: EdgeInsets.only(left: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                icon,
                size: 48,
              ),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
