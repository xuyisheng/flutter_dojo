import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_dojo/common/main_title_widget.dart';

class AssetBundleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('通过rootBundle获取asste'),
        Container(
          child: FutureBuilder(
            builder: (context, snapshot) {
              return Text(snapshot.data.toString());
            },
            future: loadAsset(),
          ),
        ),
        MainTitleWidget('通过DefaultAssetBundle获取asste'),
        Container(
          child: FutureBuilder(
            builder: (context, snapshot) {
              return Text(snapshot.data.toString());
            },
            future: loadAssetDefault(context),
          ),
        ),
      ],
    );
  }

  Future<String> loadAssetDefault(BuildContext context) async {
    return await DefaultAssetBundle.of(context).loadString('lib/category/widgets/buttons/buttonbar.dart');
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('lib/category/widgets/buttons/buttonbar.dart');
  }
}
