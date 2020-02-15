import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class TreeWidget extends StatefulWidget {
  @override
  _TreeWidgetState createState() => _TreeWidgetState();
}

class _TreeWidgetState extends State<TreeWidget> {
  Node nodeData = Node(
    father: '世界',
    expanded: true,
    children: [
      Node(
        father: '中国',
        children: [
          Node(father: '北京'),
          Node(father: '上海'),
        ],
      ),
      Node(
        father: '美国',
        children: [
          Node(father: '纽约'),
          Node(father: '旧金山'),
        ],
      ),
      Node(
        father: '日本',
        children: [
          Node(father: '东京'),
          Node(father: '名古屋'),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MainTitleWidget('使用Node结构实现Tree结构示意图'),
        buildNode(nodeData),
      ],
    );
  }

  Widget buildNode(Node node) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildFather(node),
        if (node.expanded && node.children != null)
          ...node.children.map((v) {
            return Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: buildNode(v),
            );
          }).toList()
      ],
    );
  }

  Widget buildFather(Node node) {
    return GestureDetector(
      onTap: () {
        setState(() {
          node.expanded = !node.expanded;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(node.father),
      ),
    );
  }
}

class Node {
  String father;
  List<Node> children;
  bool expanded;

  Node({this.father, this.children, this.expanded = false});
}
