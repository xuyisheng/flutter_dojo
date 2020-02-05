import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/demo_item.dart';

class UIKitMainPageListItem extends StatelessWidget {
  final DemoItem demoItem;

  UIKitMainPageListItem(this.demoItem);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 16,
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 16,
                  left: 16,
                  bottom: 30,
                ),
                child: CircleAvatar(
                  child: Icon(demoItem.icon),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: Text(
                      demoItem.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 100, 100, 135),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8,
                      left: 24,
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.forward,
                          color: Color.fromARGB(255, 100, 100, 135),
                        ),
                        Text(
                          demoItem.subtitle,
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 100, 100, 135),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: demoItem.buildRoute),
        );
      },
    );
  }
}
