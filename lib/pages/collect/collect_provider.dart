import 'package:flutter/cupertino.dart';
import 'package:flutter_dojo/common/demo_item.dart';

class CollectProvider extends ChangeNotifier {
  List<DemoItem> _items = <DemoItem>[];

  List<DemoItem> get demos => _items;

  setDemos(List<DemoItem> items) {
    _items = items;
    notifyListeners();
  }
}
