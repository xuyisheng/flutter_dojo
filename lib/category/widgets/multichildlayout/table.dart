import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/item_util.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class TableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('Table基本使用'),
        SubtitleWidget('TableCell: A widget that controls how a child of a [Table] is aligned.'),
        Container(
          color: Colors.blue,
          child: Table(
            border: TableBorder.all(),
            columnWidths: {1: FractionColumnWidth(.7)},
//              defaultColumnWidth: IntrinsicColumnWidth(),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                children: [
                  TableCell(child: Text('Cell1')),
                  RandomHeightItem(),
                  RandomHeightItem(),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text('Cell2')),
                  RandomHeightItem(),
                  RandomHeightItem(),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text('Cell3')),
                  RandomHeightItem(),
                  RandomHeightItem(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
