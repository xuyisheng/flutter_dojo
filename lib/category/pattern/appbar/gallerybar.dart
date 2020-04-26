import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

const Color _mariner = const Color(0xFF3B5F8F);
const Color _mediumPurple = const Color(0xFF8266D4);
const Color _tomato = const Color(0xFFF95B57);
const Color _mySin = const Color(0xFFF3A646);

List<CardSection> allSections = <CardSection>[
  CardSection(title: 'First Page', leftColor: _mediumPurple, rightColor: _mariner, contentWidget: Center(child: Text('Page One'))),
  CardSection(title: 'Second Page', leftColor: _mariner, rightColor: _mySin, contentWidget: Center(child: Text('Page Two'))),
  CardSection(title: 'Third Page', leftColor: _mySin, rightColor: _tomato, contentWidget: Center(child: Text('Page Three'))),
  CardSection(title: 'Forth Page', leftColor: _tomato, rightColor: Colors.blue, contentWidget: Center(child: Text('Page Four'))),
  CardSection(title: 'Fifth Page', leftColor: Colors.blue, rightColor: _mediumPurple, contentWidget: Center(child: Text('Page Five'))),
];

class GalleryBar extends StatefulWidget {
  @override
  _GalleryBarState createState() => _GalleryBarState();
}

class _GalleryBarState extends State<GalleryBar> {
  @override
  Widget build(BuildContext context) {
    return AnimateTabNavigation(
      sectionList: allSections,
    );
  }
}

const Color _kAppBackgroundColor = const Color(0xFF20c2f0);
const Duration _kScrollDuration = const Duration(milliseconds: 400);
const Curve _kScrollCurve = Curves.fastOutSlowIn;

// This app's contents start out at _kHeadingMaxHeight and they function like
// an appbar. Initially the appbar occupies most of the screen and its section
// headings are laid out in a column. By the time its height has been
// reduced to _kAppBarMidHeight, its layout is horizontal, only one section
// heading is visible, and the section's list of details is visible below the
// heading. The appbar's height can be reduced to no more than _kAppBarMinHeight.
const double _kAppBarMinHeight = 60.0;
// The AppBar's max height depends on the screen, see _AnimationDemoHomeState._buildBody()

// Initially occupies the same space as the status bar and gets smaller as
// the primary scrollable scrolls upwards.
// TODO(hansmuller): it would be worth adding something like this to the framework.
class _RenderStatusBarPaddingSliver extends RenderSliver {
  _RenderStatusBarPaddingSliver({
    @required double maxHeight,
    @required double scrollFactor,
  })  : assert(maxHeight != null && maxHeight >= 0.0),
        assert(scrollFactor != null && scrollFactor >= 1.0),
        _maxHeight = maxHeight,
        _scrollFactor = scrollFactor;

  // The height of the status bar
  double get maxHeight => _maxHeight;
  double _maxHeight;

  set maxHeight(double value) {
    assert(maxHeight != null && maxHeight >= 0.0);
    if (_maxHeight == value) return;
    _maxHeight = value;
    markNeedsLayout();
  }

  // That rate at which this renderer's height shrinks when the scroll
  // offset changes.
  double get scrollFactor => _scrollFactor;
  double _scrollFactor;

  set scrollFactor(double value) {
    assert(scrollFactor != null && scrollFactor >= 1.0);
    if (_scrollFactor == value) return;
    _scrollFactor = value;
    markNeedsLayout();
  }

  @override
  void performLayout() {
    final double height = (maxHeight - constraints.scrollOffset / scrollFactor).clamp(0.0, maxHeight);
    geometry = SliverGeometry(
      paintExtent: min(height, constraints.remainingPaintExtent),
      scrollExtent: maxHeight,
      maxPaintExtent: maxHeight,
    );
  }
}

class _StatusBarPaddingSliver extends SingleChildRenderObjectWidget {
  const _StatusBarPaddingSliver({
    Key key,
    @required this.maxHeight,
    this.scrollFactor: 5.0,
  })  : assert(maxHeight != null && maxHeight >= 0.0),
        assert(scrollFactor != null && scrollFactor >= 1.0),
        super(key: key);

  final double maxHeight;
  final double scrollFactor;

  @override
  _RenderStatusBarPaddingSliver createRenderObject(BuildContext context) {
    return _RenderStatusBarPaddingSliver(
      maxHeight: maxHeight,
      scrollFactor: scrollFactor,
    );
  }

  @override
  void updateRenderObject(BuildContext context, _RenderStatusBarPaddingSliver renderObject) {
    renderObject
      ..maxHeight = maxHeight
      ..scrollFactor = scrollFactor;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(DoubleProperty('maxHeight', maxHeight));
    description.add(DoubleProperty('scrollFactor', scrollFactor));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }

  @override
  String toString() => '_SliverAppBarDelegate';
}

// Arrange the section titles, indicators, and cards. The cards are only included when
// the layout is transitioning between vertical and horizontal. Once the layout is
// horizontal the cards are laid out by a PageView.
//
// The layout of the section cards, titles, and indicators is defined by the
// two 0.0-1.0 "t" parameters, both of which are based on the layout's height:
// - tColumnToRow
//   0.0 when height is maxHeight and the layout is a column
//   1.0 when the height is midHeight and the layout is a row
// - tCollapsed
//   0.0 when height is midHeight and the layout is a row
//   1.0 when height is minHeight and the layout is a (still) row
//
// minHeight < midHeight < maxHeight
//
// The general approach here is to compute the column layout and row size
// and position of each element and then interpolate between them using
// tColumnToRow. Once tColumnToRow reaches 1.0, the layout changes are
// defined by tCollapsed. As tCollapsed increases the titles spread out
// until only one title is visible and the indicators cluster together
// until they're all visible.
class _AllSectionsLayout extends MultiChildLayoutDelegate {
  _AllSectionsLayout({
    this.translation,
    this.tColumnToRow,
    this.cardCount,
    this.selectedIndex,
  });

  final Alignment translation;
  final double tColumnToRow;
  final int cardCount;
  final double selectedIndex;

  Rect _interpolateRect(Rect begin, Rect end) {
    return Rect.lerp(begin, end, tColumnToRow);
  }

  Offset _interpolatePoint(Offset begin, Offset end) {
    return Offset.lerp(begin, end, tColumnToRow);
  }

  @override
  void performLayout(Size size) {
    final double columnCardX = size.width / 5.0;
    final double columnCardWidth = size.width - columnCardX;
    final double columnCardHeight = size.height / cardCount;
    final double rowCardWidth = size.width;
    final double rowCardHeight = size.height;
    final Offset offset = translation.alongSize(size);
    double columnCardY = 0.0;
    double rowCardX = -(selectedIndex * rowCardWidth);

    final double columnTitleX = size.width / 10.0;
    final double rowTitleWidth = size.width / 2.0;
    double rowTitleX = (size.width - rowTitleWidth) / 2.0 - selectedIndex * rowTitleWidth;

    // When tCollapsed > 0, the indicators move closer together
    //final double rowIndicatorWidth = 48.0 + (1.0 - tCollapsed) * (rowTitleWidth - 48.0);
    const double paddedSectionIndicatorWidth = kSectionIndicatorWidth + 8.0;
    double rowIndicatorX = (size.width - paddedSectionIndicatorWidth) / 2.0 - selectedIndex * paddedSectionIndicatorWidth;

    // Compute the size and origin of each card, title, and indicator for the maxHeight
    // "column" layout, and the midHeight "row" layout. The actual layout is just the
    // interpolated value between the column and row layouts for t.
    for (int index = 0; index < cardCount; index++) {
      // Layout the card for index.
      final Rect columnCardRect = Rect.fromLTWH(columnCardX, columnCardY, columnCardWidth, columnCardHeight);
      final Rect rowCardRect = Rect.fromLTWH(rowCardX, 0.0, rowCardWidth, rowCardHeight);
      final Rect cardRect = _interpolateRect(columnCardRect, rowCardRect).shift(offset);
      final String cardId = 'card$index';
      if (hasChild(cardId)) {
        layoutChild(cardId, BoxConstraints.tight(cardRect.size));
        positionChild(cardId, cardRect.topLeft);
      }

      // Layout the title for index.
      final Size titleSize = layoutChild('title$index', BoxConstraints.loose(cardRect.size));
      final double columnTitleY = columnCardRect.centerLeft.dy - titleSize.height / 2.0;
      final double rowTitleY = rowCardRect.centerLeft.dy - titleSize.height / 2.0;
      final double centeredRowTitleX = rowTitleX + (rowTitleWidth - titleSize.width) / 2.0;
      final Offset columnTitleOrigin = Offset(columnTitleX, columnTitleY);
      final Offset rowTitleOrigin = Offset(centeredRowTitleX, rowTitleY);
      final Offset titleOrigin = _interpolatePoint(columnTitleOrigin, rowTitleOrigin);
      positionChild('title$index', titleOrigin + offset);

      // Layout the selection indicator for index.
      final Size indicatorSize = layoutChild('indicator$index', BoxConstraints.loose(cardRect.size));
      final double columnIndicatorX = cardRect.centerRight.dx - indicatorSize.width - 16.0;
      final double columnIndicatorY = cardRect.bottomRight.dy - indicatorSize.height - 16.0;
      final Offset columnIndicatorOrigin = Offset(columnIndicatorX, columnIndicatorY);
      final Rect titleRect = Rect.fromPoints(titleOrigin, titleSize.bottomRight(titleOrigin));
      final double centeredRowIndicatorX = rowIndicatorX + (paddedSectionIndicatorWidth - indicatorSize.width) / 2.0;
      final double rowIndicatorY = titleRect.bottomCenter.dy + 16.0;
      final Offset rowIndicatorOrigin = Offset(centeredRowIndicatorX, rowIndicatorY);
      final Offset indicatorOrigin = _interpolatePoint(columnIndicatorOrigin, rowIndicatorOrigin);
      positionChild('indicator$index', indicatorOrigin + offset);

      columnCardY += columnCardHeight;
      rowCardX += rowCardWidth;
      rowTitleX += rowTitleWidth;
      rowIndicatorX += paddedSectionIndicatorWidth;
    }
  }

  @override
  bool shouldRelayout(_AllSectionsLayout oldDelegate) {
    return tColumnToRow != oldDelegate.tColumnToRow || cardCount != oldDelegate.cardCount || selectedIndex != oldDelegate.selectedIndex;
  }
}

class _AllSectionsView extends AnimatedWidget {
  _AllSectionsView({
    Key key,
    this.sectionIndex,
    @required this.sections,
    @required this.selectedIndex,
    this.minHeight,
    this.maxHeight,
    this.sectionCards: const <Widget>[],
  })  : assert(sections != null),
        assert(sectionCards != null),
        assert(sectionCards.length == sections.length),
        assert(sectionIndex >= 0 && sectionIndex < sections.length),
        assert(selectedIndex != null),
        assert(selectedIndex.value >= 0.0 && selectedIndex.value < sections.length.toDouble()),
        super(key: key, listenable: selectedIndex);

  final int sectionIndex;
  final List<CardSection> sections;
  final ValueNotifier<double> selectedIndex;
  final double minHeight;
  final double maxHeight;
  final List<Widget> sectionCards;

  double _selectedIndexDelta(int index) {
    return (index.toDouble() - selectedIndex.value).abs().clamp(0.0, 1.0);
  }

  Widget _build(BuildContext context, BoxConstraints constraints) {
    final Size size = constraints.biggest;

    // The layout's progress from from a column to a row. Its value is
    // 0.0 when size.height equals the maxHeight, 1.0 when the size.height
    // equals the minHeight.
    // The layout's progress from from a column to a row. Its value is
    // 0.0 when size.height equals the maxHeight, 1.0 when the size.height
    // equals the minHeight.
    final double tColumnToRow = 1.0 - ((size.height - minHeight) / (maxHeight - minHeight)).clamp(0.0, 1.0);
    double _indicatorOpacity(int index) {
      return 1.0 - _selectedIndexDelta(index) * 0.5;
    }

    double _titleOpacity(int index) {
      return 1.0 - _selectedIndexDelta(index) * tColumnToRow * 0.5;
    }

    double _titleScale(int index) {
      return 1.0 - _selectedIndexDelta(index) * tColumnToRow * 0.15;
    }

    final List<Widget> children = List<Widget>.from(sectionCards);

    for (int index = 0; index < sections.length; index++) {
      final CardSection section = sections[index];
      children.add(LayoutId(
        id: 'title$index',
        child: SectionTitle(
          section: section,
          scale: _titleScale(index),
          opacity: _titleOpacity(index),
        ),
      ));
    }

    for (int index = 0; index < sections.length; index++) {
      children.add(LayoutId(
        id: 'indicator$index',
        child: SectionIndicator(
          opacity: _indicatorOpacity(index),
        ),
      ));
    }

    return CustomMultiChildLayout(
      delegate: _AllSectionsLayout(
        translation: Alignment((selectedIndex.value - sectionIndex) * 2.0 - 1.0, -1.0),
        tColumnToRow: tColumnToRow,
        cardCount: sections.length,
        selectedIndex: selectedIndex.value,
      ),
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: _build);
  }
}

// Support snapping scrolls to the midScrollOffset: the point at which the
// app bar's height is _kAppBarMidHeight and only one section heading is
// visible.
// 决定是展开还是收缩
class _SnappingScrollPhysics extends ClampingScrollPhysics {
  const _SnappingScrollPhysics({
    ScrollPhysics parent,
    @required this.minScrollOffset,
  })  : assert(minScrollOffset != null),
        super(parent: parent);

  final double minScrollOffset;

  @override
  _SnappingScrollPhysics applyTo(ScrollPhysics ancestor) {
    return _SnappingScrollPhysics(parent: buildParent(ancestor), minScrollOffset: minScrollOffset);
  }

  Simulation _toMinScrollOffsetSimulation(double offset, double dragVelocity) {
    final double velocity = max(dragVelocity, minFlingVelocity);
    return ScrollSpringSimulation(spring, offset, minScrollOffset, velocity, tolerance: tolerance);
  }

  Simulation _toZeroScrollOffsetSimulation(double offset, double dragVelocity) {
    final double velocity = max(dragVelocity, minFlingVelocity);
    return ScrollSpringSimulation(spring, offset, 0.0, velocity, tolerance: tolerance);
  }

  @override
  Simulation createBallisticSimulation(ScrollMetrics position, double dragVelocity) {
    final Simulation simulation = super.createBallisticSimulation(position, dragVelocity);
    final double offset = position.pixels;

    if (simulation != null) {
      // The drag ended with sufficient velocity to trigger creating a simulation.
      // If the simulation is headed up towards minScrollOffset but will not reach it,
      // then snap it there. Similarly if the simulation is headed down past
      // minScrollOffset but will not reach zero, then snap it to zero.
      final double simulationEnd = simulation.x(double.infinity);
      if (simulationEnd >= minScrollOffset) return simulation;
      if (dragVelocity > 0.0) return _toMinScrollOffsetSimulation(offset, dragVelocity);
      if (dragVelocity < 0.0) return _toZeroScrollOffsetSimulation(offset, dragVelocity);
    } else {
      // The user ended the drag with little or no velocity. If they
      // didn't leave the offset above minScrollOffset, then
      // snap to minScrollOffset if they're more than halfway there,
      // otherwise snap to zero.
      final double snapThreshold = minScrollOffset / 2.0;
      if (offset >= snapThreshold && offset < minScrollOffset) return _toMinScrollOffsetSimulation(offset, dragVelocity);
      if (offset > 0.0 && offset < snapThreshold) return _toZeroScrollOffsetSimulation(offset, dragVelocity);
    }
    return simulation;
  }
}

class AnimateTabNavigation extends StatefulWidget {
  const AnimateTabNavigation({Key key, @required this.sectionList}) : super(key: key);
  final List<CardSection> sectionList;
  static const String routeName = '/animation';

  @override
  _AnimateTabNavigationState createState() => _AnimateTabNavigationState(sectionList: sectionList);
}

class _AnimateTabNavigationState extends State<AnimateTabNavigation> {
  _AnimateTabNavigationState({Key key, @required this.sectionList});

  final List<CardSection> sectionList;
  final ScrollController _scrollController = ScrollController();
  final PageController _headingPageController = PageController();
  final PageController _detailsPageController = PageController();
  ScrollPhysics _headingScrollPhysics = const NeverScrollableScrollPhysics();
  ValueNotifier<double> selectedIndex = ValueNotifier<double>(0.0);
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _kAppBackgroundColor,
      body: Builder(
        // Insert an element so that _buildBody can find the PrimaryScrollController.
        builder: _buildBody,
      ),
    );
  }

  void _handleBackButton(double midScrollOffset) {
    if (_scrollController.offset >= midScrollOffset)
      _scrollController.animateTo(0.0, curve: _kScrollCurve, duration: _kScrollDuration);
    else
      Navigator.maybePop(context);
  }

  // Only enable paging for the heading when the user has scrolled to midScrollOffset.
  // Paging is enabled/disabled by setting the heading's PageView scroll physics.
  bool _handleScrollNotification(ScrollNotification notification, double minScrollOffset) {
    if (notification is ScrollUpdateNotification) {
      _expanded = _scrollController.position.pixels >= minScrollOffset;
      final ScrollPhysics physics = _expanded ? const PageScrollPhysics() : const NeverScrollableScrollPhysics();
      if (physics != _headingScrollPhysics) {
        setState(() {
          _headingScrollPhysics = physics;
        });
      }
    }
    return false;
  }

  void _maybeScroll(double minScrollOffset, int pageIndex, double xOffset, int totalPageCount) {
    if (_scrollController.offset < minScrollOffset) {
      // Scroll the overall list to the point where only one section card shows.
      // At the same time scroll the PageViews to the page at pageIndex.
      _headingPageController.animateToPage(pageIndex, curve: _kScrollCurve, duration: _kScrollDuration);
      _scrollController.animateTo(minScrollOffset, curve: _kScrollCurve, duration: _kScrollDuration);
    } else {
      // One one section card is showing: scroll one page forward or back.
      final double centerX = _headingPageController.position.viewportDimension / 2.0;

      int PageIndex = pageIndex;
      if (xOffset - centerX > 40 && pageIndex < totalPageCount - 1) {
        PageIndex++;
      } else if (centerX - xOffset > 40 && pageIndex > 0) {
        PageIndex--;
      }
      _headingPageController.animateToPage(PageIndex, curve: _kScrollCurve, duration: _kScrollDuration);
    }
  }

  bool _handlePageNotification(ScrollNotification notification, PageController leader, PageController follower) {
    if (notification.depth == 0 && notification is ScrollUpdateNotification) {
      selectedIndex.value = leader.page;
      if (follower.position.pixels != leader.position.pixels) {
        follower.position.jumpToWithoutSettling(leader.position.pixels); // ignore: deprecated_member_use
      }
    }
    return false;
  }

  Iterable<Widget> _allHeadingItems(double maxHeight, double minHeight, double minScrollOffset) {
    final List<Widget> sectionCards = <Widget>[];
    for (int index = 0; index < sectionList.length; index++) {
      sectionCards.add(LayoutId(
        id: 'card$index',
        child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: SectionCard(section: sectionList[index]),
            onTapUp: (TapUpDetails details) {
              final double xOffset = details.globalPosition.dx;
              setState(() {
                _maybeScroll(minScrollOffset, index, xOffset, sectionList.length);
              });
            }),
      ));
    }

    final List<Widget> headings = <Widget>[];
    for (int index = 0; index < sectionList.length; index++) {
      headings.add(Container(
        color: _kAppBackgroundColor,
        child: ClipRect(
          child: _AllSectionsView(
            sectionIndex: index,
            sections: sectionList,
            selectedIndex: selectedIndex,
            minHeight: minHeight,
            maxHeight: maxHeight,
            sectionCards: sectionCards,
          ),
        ),
      ));
    }
    return headings;
  }

  Widget _buildBody(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double statusBarHeight = mediaQueryData.padding.top;
    final double screenHeight = mediaQueryData.size.height;
    final double appBarMaxHeight = screenHeight - statusBarHeight;

    // The scroll offset that reveals the appBarMinHeight appbar.
    final double appBarMinScrollOffset = appBarMaxHeight - _kAppBarMinHeight;
    final double appBodyHeight = appBarMinScrollOffset;

    return SizedBox.expand(
      child: Stack(
        children: <Widget>[
          NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              return _handleScrollNotification(notification, appBarMinScrollOffset);
            },
            child: CustomScrollView(
              controller: _scrollController,
              physics: _SnappingScrollPhysics(minScrollOffset: appBarMinScrollOffset),
              slivers: <Widget>[
                // Start out below the status bar, gradually move to the top of the screen.
                _StatusBarPaddingSliver(
                  maxHeight: statusBarHeight,
                  scrollFactor: 7.0,
                ),
                // Section Headings
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(
                    minHeight: _kAppBarMinHeight,
                    maxHeight: appBarMaxHeight,
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (ScrollNotification notification) {
                        return _handlePageNotification(notification, _headingPageController, _detailsPageController);
                      },
                      child: PageView(
                        physics: _headingScrollPhysics,
                        controller: _headingPageController,
                        children: _allHeadingItems(appBarMaxHeight, _kAppBarMinHeight + statusBarHeight, appBarMinScrollOffset),
                      ),
                    ),
                  ),
                ),
                // Details
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: appBodyHeight,
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (ScrollNotification notification) {
                        return _handlePageNotification(notification, _detailsPageController, _headingPageController);
                      },
                      child: PageView(
                        controller: _detailsPageController,
                        children: sectionList.map((CardSection section) {
                          return Container(
//                            color: Colors.green,
                              child: section.contentWidget);
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: statusBarHeight,
            left: 0.0,
            child: IconTheme(
              data: const IconThemeData(color: Colors.white),
              child: SafeArea(
                top: false,
                bottom: false,
                child: IconButton(
                    icon: _expanded ? Icon(Icons.list) : Icon(Icons.ac_unit),
                    tooltip: 'Back',
                    onPressed: () {
                      _handleBackButton(appBarMinScrollOffset);
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardSection {
  CardSection({this.title, this.leftColor, this.rightColor, this.contentWidget});

  final String title;
  final Color leftColor;
  final Color rightColor;
  final Widget contentWidget;

  @override
  bool operator ==(Object other) {
    if (other is! CardSection) return false;
    final CardSection otherSection = other;
    return title == otherSection.title;
  }

  @override
  int get hashCode => title.hashCode;
}

const double kSectionIndicatorWidth = 32.0;

// The card for a single section. Displays the section's gradient and background image.
class SectionCard extends StatelessWidget {
  const SectionCard({Key key, @required this.section})
      : assert(section != null),
        super(key: key);

  final CardSection section;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: section.title,
      button: true,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              section.leftColor,
              section.rightColor,
            ],
          ),
        ),
      ),
    );
  }
}

// The title is rendered with two overlapping text widgets that are vertically
// offset a little. It's supposed to look sort-of 3D.
class SectionTitle extends StatelessWidget {
  static const TextStyle sectionTitleStyle = const TextStyle(
    fontFamily: 'Raleway',
    inherit: false,
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    textBaseline: TextBaseline.alphabetic,
  );

  static final TextStyle sectionTitleShadowStyle = sectionTitleStyle.copyWith(
    color: const Color(0x19000000),
  );

  const SectionTitle({
    Key key,
    @required this.section,
    @required this.scale,
    @required this.opacity,
  })  : assert(section != null),
        assert(scale != null),
        assert(opacity != null && opacity >= 0.0 && opacity <= 1.0),
        super(key: key);

  final CardSection section;
  final double scale;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Opacity(
        opacity: opacity,
        child: Transform(
          transform: Matrix4.identity()..scale(scale),
          alignment: Alignment.center,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 4.0,
                child: Text(section.title, style: sectionTitleShadowStyle),
              ),
              Text(section.title, style: sectionTitleStyle),
            ],
          ),
        ),
      ),
    );
  }
}

// Small horizontal bar that indicates the selected section.
class SectionIndicator extends StatelessWidget {
  const SectionIndicator({Key key, this.opacity: 1.0}) : super(key: key);

  final double opacity;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: kSectionIndicatorWidth,
        height: 3.0,
        color: Colors.white.withOpacity(opacity),
      ),
    );
  }
}
