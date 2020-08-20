import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MainTitleWidget('Banner基本使用'),
          Container(
            margin: const EdgeInsets.all(10.0),
            color: Colors.yellow,
            height: 100,
            child: ClipRect(
              child: Banner(
                message: 'hello',
                location: BannerLocation.topEnd,
                color: Colors.red,
                child: Container(
                  color: Colors.yellow,
                  height: 100,
                  child: Center(
                    child: Text('Banner in corner'),
                  ),
                ),
              ),
            ),
          ),
          MainTitleWidget('CheckedModeBanner'),
          SubtitleWidget(
              'Displays a [Banner] saying \"DEBUG\" when running in checked mode. [MaterialApp] builds one of these by default. Does nothing in release mode.'),
          Container(
            margin: const EdgeInsets.all(10.0),
            color: Colors.yellow,
            height: 100,
            child: ClipRect(
              child: CheckedModeBanner(
                child: Container(
                  color: Colors.yellow,
                  height: 100,
                  child: Center(
                    child: Text('Banner in corner'),
                  ),
                ),
              ),
            ),
          ),
          MainTitleWidget('MaterialBanner'),
          SubtitleWidget(
              '''MaterialBannerTheme: An inherited widget that defines the configuration for [MaterialBanner]s in this widget's subtree.'''),
          MaterialBannerTheme(
            data: MaterialBannerTheme.of(context).copyWith(backgroundColor: Colors.red),
            child: MaterialBanner(
              leading: IconButton(
                icon: Icon(Icons.person),
                onPressed: () {},
              ),
              leadingPadding: EdgeInsets.all(5),
              content: Text('XuYisheng'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.collections_bookmark),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
