import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class AutoFoldWidget extends StatefulWidget {
  @override
  _AutoFoldWidgetState createState() => _AutoFoldWidgetState();
}

class _AutoFoldWidgetState extends State<AutoFoldWidget> {
  final String desc = 'The first is one which allocates resources in '
      '[State.initState] and disposes of them in [State.dispose], '
      'but which does not depend on [InheritedWidget]s or call [State.setState]. '
      'Such widgets are commonly used at the root of an application or page, '
      'and communicate with subwidgets via [ChangeNotifier]s, [Stream]s, or other such objects.';
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          MainTitleWidget('通过AnimatedCrossFade实现可伸缩Text展示'),
          Padding(
            padding: EdgeInsets.all(8),
            child: AnimatedCrossFade(
              firstChild: Text(
                desc,
                maxLines: 2,
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              secondChild: Text(
                desc,
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: kThemeAnimationDuration,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                setState(() => isExpanded = !isExpanded);
              },
              child: Text(
                isExpanded ? "less" : "more..",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
