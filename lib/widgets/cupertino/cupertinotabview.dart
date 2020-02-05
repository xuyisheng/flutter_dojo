import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTabViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('Item1')),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), title: Text('Item2')),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('Page 1 - Tab $index'),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('要在CupertinoTabView上方而不是在其内部推送路径（例如在所有Tab上显示对话框时），请使用 Navigator.of(rootNavigator: true),如下'),
                    CupertinoButton(
                      child: Text('下一页'),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).push(
                          CupertinoPageRoute<void>(
                            builder: (BuildContext context) {
                              return CupertinoPageScaffold(
                                navigationBar: CupertinoNavigationBar(
                                  middle: Text('Page 2 - Tab $index'),
                                ),
                                child: Center(
                                  child: CupertinoButton(
                                    child: Text('Back'),
                                    onPressed: () => Navigator.of(context).pop(),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
