import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class GridViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('GridView.count'),
        SubtitleWidget('子Item中的Size设置无效，尺寸由ViewPort宽度和元素间Spacing决定'),
        Container(
          height: 200,
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            padding: EdgeInsets.all(8),
            childAspectRatio: 2,
            mainAxisSpacing: 8,
            children: generateGrid(),
          ),
        ),
        MainTitleWidget('GridView.builder'),
        Container(
          height: 100,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 4,
              crossAxisSpacing: 8,
              childAspectRatio: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.blueAccent,
                child: Center(child: Text('$index')),
              );
            },
            itemCount: 20,
          ),
        ),
        MainTitleWidget('设置副轴子元素最大数量'),
        Container(
          height: 200,
          child: GridView(
            children: <Widget>[
              Container(
                child: Text('Item'),
                alignment: Alignment.center,
                color: Colors.blue,
              ),
              Container(
                child: Text('Item'),
                alignment: Alignment.center,
                color: Colors.blue,
              ),
              Container(
                child: Text('Item'),
                alignment: Alignment.center,
                color: Colors.blue,
              ),
              Container(
                child: Text('Item'),
                alignment: Alignment.center,
                color: Colors.blue,
              ),
              Container(
                child: Text('Item'),
                alignment: Alignment.center,
                color: Colors.blue,
              ),
              Container(
                child: Text('Item'),
                alignment: Alignment.center,
                color: Colors.blue,
              ),
            ],
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 2,
            ),
          ),
        ),
        MainTitleWidget('设置副轴子元素最大宽度'),
        Container(
          height: 200,
          child: GridView(
            children: <Widget>[
              Container(
                child: Text('Item'),
                alignment: Alignment.center,
                color: Colors.blue,
              ),
              Container(
                child: Text('Item'),
                alignment: Alignment.center,
                color: Colors.blue,
              ),
              Container(
                child: Text('Item'),
                alignment: Alignment.center,
                color: Colors.blue,
              ),
              Container(
                child: Text('Item'),
                alignment: Alignment.center,
                color: Colors.blue,
              ),
              Container(
                child: Text('Item'),
                alignment: Alignment.center,
                color: Colors.blue,
              ),
              Container(
                child: Text('Item'),
                alignment: Alignment.center,
                color: Colors.blue,
              ),
            ],
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 2,
            ),
          ),
        ),
      ],
    );
  }

  generateGrid() {
    return List.generate(20, (index) {
      return Container(
        color: Colors.blueAccent,
        child: Center(child: Text('$index')),
      );
    });
  }
}
