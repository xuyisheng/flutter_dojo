import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class AboutDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LicenseRegistry.addLicense(() async* {
      yield LicenseEntryWithLineBreaks(['com.xys.flutter_dojo'], 'xuyisheng');
    });
    return Column(
      children: <Widget>[
        MainTitleWidget('Show AboutDialog'),
        RaisedButton(
          onPressed: () {
            showAboutDialog(
              context: context,
              applicationIcon: Icon(Icons.favorite),
              applicationVersion: '2.0.0',
              applicationName: 'Flutter Dojo',
              applicationLegalese: 'XYS',
              children: [
                Text('data1'),
                Text('data2'),
                Text('data3'),
              ],
            );
          },
          child: Text('Show'),
        ),
      ],
    );
  }
}
