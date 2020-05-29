import 'package:flutter/material.dart';
import 'package:flutter_dojo/category/widgets/assetsimageicon/icon.dart';
import 'package:flutter_dojo/category/widgets/assetsimageicon/image.dart';
import 'package:flutter_dojo/category/widgets/informationdisplays/card.dart';
import 'package:flutter_dojo/category/widgets/informationdisplays/chip.dart';
import 'package:flutter_dojo/category/widgets/informationdisplays/circularprogressindicator.dart';
import 'package:flutter_dojo/category/widgets/informationdisplays/datatable.dart';
import 'package:flutter_dojo/category/widgets/informationdisplays/linearprogressindicator.dart';
import 'package:flutter_dojo/category/widgets/informationdisplays/tooltip.dart';
import 'package:flutter_dojo/category/widgets/scrolling/gridview.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';

List<DemoItem> buildInformationDisplaysDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.dialpad,
      title: 'Card',
      subtitle: 'A Material Design card. A card has slightly rounded corners and a shadow.',
      keyword: 'Card',
      documentationUrl: 'https://api.flutter.dev/flutter/material/Card-class.html',
      buildRoute: (context) => BaseWidget('Card', codePath + 'card', CardWidget()),
    ),
    DemoItem(
      icon: Icons.dialpad,
      title: 'Chip',
      subtitle: 'A Material Design chip. Chips represent complex entities in small blocks, such as a contact.',
      keyword: 'Chip',
      documentationUrl: 'https://api.flutter.dev/flutter/material/Chip-class.html',
      buildRoute: (context) => BaseWidget('Chip', codePath + 'chip', ChipWidget()),
    ),
    DemoItem(
      icon: Icons.dialpad,
      title: 'CircularProgressIndicator',
      subtitle: 'A material design circular progress indicator, which spins to indicate that the application is busy.',
      keyword: 'CircularProgressIndicator',
      documentationUrl: 'https://api.flutter.dev/flutter/material/CircularProgressIndicator-class.html',
      buildRoute: (context) => BaseWidget('CircularProgressIndicator', codePath + 'circularprogressindicator', CircularProgressIndicatorWidget()),
    ),
    DemoItem(
      icon: Icons.dialpad,
      title: 'DataTable',
      subtitle:
          'Data tables display sets of raw data. They usually appear in desktop enterprise products. The DataTable widget implements this component.',
      keyword: 'DataTable',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/DataTable-class.html',
      buildRoute: (context) => BaseWidget('DataTable', codePath + 'datatable', DataTableWidget()),
    ),
    DemoItem(
      icon: Icons.dialpad,
      title: 'GridView',
      subtitle:
          'A grid list consists of a repeated pattern of cells arrayed in a vertical and horizontal layout. The GridView widget implements this component.',
      keyword: 'GridView',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/GridView-class.html',
      buildRoute: (context) => BaseWidget('GridView', codePath + 'gridview', GridViewWidget()),
    ),
    DemoItem(
      icon: Icons.dialpad,
      title: 'Icon',
      subtitle: 'A Material Design icon.',
      keyword: 'Icon',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Icon-class.html',
      buildRoute: (context) => BaseWidget('Icon', codePath + 'icon', IconWidget()),
    ),
    DemoItem(
      icon: Icons.dialpad,
      title: 'Image',
      subtitle: 'A widget that displays an image.',
      keyword: 'Image',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Image-class.html',
      buildRoute: (context) => BaseWidget('Image', codePath + 'image', ImageWidget()),
    ),
    DemoItem(
      icon: Icons.dialpad,
      title: 'LinearProgressIndicator',
      subtitle: 'A material design linear progress indicator, also known as a progress bar.',
      keyword: 'LinearProgressIndicator',
      documentationUrl: 'https://api.flutter.dev/flutter/material/LinearProgressIndicator-class.html',
      buildRoute: (context) => BaseWidget('LinearProgressIndicator', codePath + 'linearprogressindicator', LinearProgressIndicatorWidget()),
    ),
    DemoItem(
      icon: Icons.dialpad,
      title: 'Tooltip',
      subtitle: 'Tooltips provide text labels that help explain the function of a button or other user interface action.',
      keyword: 'Tooltip',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Tooltip-class.html',
      buildRoute: (context) => BaseWidget('Tooltip', codePath + 'tooltip', TooltipWidget()),
    )
  ];
}
