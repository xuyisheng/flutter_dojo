import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  @override
  _BottomNavigationBarWidgetState createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int currentIndex = 1;
  PageController pageController;
  var currentPage = 0;
  var itemType = BottomNavigationBarType.fixed;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('BottomNavigationBar基本使用'),
        MultiSelectionWidget(
          'Type',
          BottomNavigationBarType.values,
          BottomNavigationBarType.values,
          (value) {
            setState(() => itemType = value);
          },
        ),
        BottomNavigationBar(
          type: itemType,
          iconSize: 24,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() => currentIndex = index);
          },
          fixedColor: Colors.blue,
          unselectedItemColor: Colors.red,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'List',
              icon: Icon(Icons.list),
            ),
            BottomNavigationBarItem(
              label: 'Message',
              icon: Icon(Icons.message),
            ),
            BottomNavigationBarItem(
              label: 'add',
              icon: Icon(Icons.add),
            ),
            BottomNavigationBarItem(
              label: 'menu',
              icon: Icon(Icons.menu),
            ),
            BottomNavigationBarItem(
              label: 'other',
              icon: Icon(Icons.devices_other),
            ),
          ],
        ),
        MainTitleWidget('BottomNavigationBar with PageView in Scaffold'),
        Expanded(
          child: Column(
            children: <Widget>[
              Expanded(
                child: PageView(
                  children: <Widget>[
                    Container(
                      color: Colors.grey.shade200,
                    ),
                    Container(
                      color: Colors.redAccent,
                    ),
                    Container(
                      color: Colors.blueAccent,
                    ),
                  ],
                  controller: pageController,
                  physics: BouncingScrollPhysics(),
                  onPageChanged: (page) {
                    setState(() => currentPage = page);
                  },
                ),
              ),
              BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.toys),
                    label: 'toys',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.tap_and_play),
                    label: 'play',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.landscape),
                    label: 'landscape',
                  ),
                ],
                onTap: (page) {
                  pageController.animateToPage(
                    page,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
                currentIndex: currentPage,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
