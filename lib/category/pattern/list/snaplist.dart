import 'package:flutter/material.dart';
import 'package:flutter_dojo/category/pattern/paint/randomcolor.dart';

class SnapListWidget extends StatefulWidget {
  @override
  _SnapListWidgetState createState() => _SnapListWidgetState();
}

class _SnapListWidgetState extends State<SnapListWidget> {
  final _controller = ScrollController();
  ScrollPhysics _physics;
  var itemWidth = 200.0;
  var leadingSpacing = 0.0;
  var _currentPage;
  List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = List.generate(20, (index) {
      return Container(
        height: 200,
        width: itemWidth,
        child: Center(child: Text('$index')),
        color: getRandomColor(),
      );
    });
    _controller.addListener(() {
      if (_controller.position.haveDimensions && _physics == null) {
        setState(() {
          _physics = PagingScrollPhysics(
              itemDimension: itemWidth,
              leadingSpacing: leadingSpacing,
              maxSize: itemWidth * (pages.length - 1) - leadingSpacing,
              parent: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()));
        });
      }
      double test = itemWidth != null ? _controller.offset / (itemWidth + leadingSpacing) : 1;
      int next = test.round();
      if (next < 0) {
        next = 0;
      }
      if (next >= pages.length) {
        next = pages.length - 1;
      }
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: _controller,
        physics: _physics,
        itemCount: pages.length,
        itemBuilder: (context, index) => pages[index],
      ),
    );
  }
}

// 借用PageScrollPhysics的实现方法
class PagingScrollPhysics extends ScrollPhysics {
  final double itemDimension; // ListView children item 固定宽度
  final double leadingSpacing; // 选中 item 离左边缘留白
  final double maxSize; // 最大可滑动区域

  PagingScrollPhysics({this.maxSize, this.leadingSpacing, this.itemDimension, ScrollPhysics parent})
      : super(parent: parent);

  @override
  PagingScrollPhysics applyTo(ScrollPhysics ancestor) {
    return PagingScrollPhysics(
        maxSize: maxSize, itemDimension: itemDimension, leadingSpacing: leadingSpacing, parent: buildParent(ancestor));
  }

  double _getPage(ScrollPosition position, double leading) {
    return (position.pixels + leading) / itemDimension;
  }

  double _getPixels(double page, double leading) {
    return (page * itemDimension) - leading;
  }

  double _getTargetPixels(ScrollPosition position, Tolerance tolerance, double velocity, double leading) {
    double page = _getPage(position, leading);

    if (position.pixels < 0) {
      return 0;
    }

    if (position.pixels >= maxSize) {
      return maxSize;
    }

    if (position.pixels > 0) {
      if (velocity < -tolerance.velocity) {
        page -= 0.5;
      } else if (velocity > tolerance.velocity) {
        page += 0.5;
      }
      return _getPixels(page.roundToDouble(), leading);
    }
    return 0;
  }

  @override
  Simulation createBallisticSimulation(ScrollMetrics position, double velocity) {
    // If we're out of range and not headed back in range, defer to the parent
    // ballistics, which should put us back in range at a page boundary.
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent))
      return super.createBallisticSimulation(position, velocity);

    final Tolerance tolerance = this.tolerance;

    final double target = _getTargetPixels(position, tolerance, velocity, leadingSpacing);
    if (target != position.pixels)
      return ScrollSpringSimulation(spring, position.pixels, target, velocity, tolerance: tolerance);
    return null;
  }

  @override
  bool get allowImplicitScrolling => false;
}
