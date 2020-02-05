import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('Card基本用法'),
        Card(
          clipBehavior: Clip.antiAlias,
          color: Colors.green,
          elevation: 20,
          margin: EdgeInsets.all(20),
          semanticContainer: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(
                  Icons.card_giftcard,
                  color: Colors.white,
                ),
                title: Text(
                  'Card Demo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                subtitle: Text(
                  'something in card',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 16,
                  ),
                ),
                contentPadding: EdgeInsets.all(24),
              ),
              ButtonBarTheme(
                data: ButtonBarThemeData(),
                child: ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {},
                    ),
                    FlatButton(
                      child: const Text(
                        'OK',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        MainTitleWidget('Card with Inkwell'),
        Card(
          color: Colors.cyan,
          margin: EdgeInsets.all(20),
          elevation: 0,
          child: Container(
            height: 100,
            child: InkWell(
              splashColor: Colors.deepOrange,
              onTap: () {},
              child: Center(
                child: Text(
                  'Card with Inkwell',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        MainTitleWidget('Card with different radius'),
        Card(
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
              bottom: Radius.elliptical(30, 60),
            ),
          ),
          child: Container(
            height: 100,
            child: Center(
              child: Text(
                'Card',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
