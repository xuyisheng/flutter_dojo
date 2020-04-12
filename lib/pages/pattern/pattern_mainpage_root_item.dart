import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/demo_item.dart';

class PatternMainPageListItem extends StatelessWidget {
  final DemoItemCategory entryData;

  PatternMainPageListItem(this.entryData);

  Widget _buildRootTiles(BuildContext context, DemoItemCategory root) {
    if (root.list.isEmpty) {
      return ListTile(title: Text(root.name));
    }
    return Theme(
      data: ThemeData(
        accentColor: Colors.white,
        unselectedWidgetColor: Colors.white,
      ),
      child: ExpansionTile(
        key: PageStorageKey<DemoItemCategory>(root),
        title: Text(
          root.name,
          style: TextStyle(color: Colors.white),
        ),
        children: root.list.map((demo) => _buildChildTiles(context, demo)).toList(),
      ),
    );
  }

  Widget _buildChildTiles(BuildContext context, DemoItem children) {
    return PatternMainPageChildListItem(children.title, children.subtitle, children.icon, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: children.buildRoute),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildRootTiles(context, entryData);
  }
}

class PatternMainPageChildListItem extends StatelessWidget {
  final title;
  final subtitle;
  final icon;
  final onTap;

  PatternMainPageChildListItem(this.title, this.subtitle, this.icon, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(12),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 114, 123, 225),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          margin: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
