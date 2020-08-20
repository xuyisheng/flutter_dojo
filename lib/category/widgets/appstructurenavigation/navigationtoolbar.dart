import 'package:flutter/material.dart';

class NavigationToolbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        height: 50,
        color: Colors.grey.shade200,
        child: NavigationToolbar(
          centerMiddle: false,
          middleSpacing: 20,
          leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {},
          ),
          middle: IconButton(
            icon: Icon(Icons.face),
            onPressed: () {},
          ),
          trailing: IconButton(
            icon: Icon(Icons.person_pin_circle),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
