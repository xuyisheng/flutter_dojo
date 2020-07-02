import 'package:flutter/material.dart';

class SliderPanelWidget extends StatefulWidget {
  @override
  _SliderPanelWidgetState createState() => _SliderPanelWidgetState();
}

class _SliderPanelWidgetState extends State<SliderPanelWidget> with TickerProviderStateMixin {
  final drawerWidth = 250.0;
  ScrollController scrollController;
  AnimationController iconAnimationController;

  @override
  void initState() {
    iconAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 0),
    );
    iconAnimationController
      ..animateTo(
        1.0,
        duration: const Duration(milliseconds: 0),
        curve: Curves.fastOutSlowIn,
      );
    scrollController = ScrollController(initialScrollOffset: drawerWidth);
    scrollController
      ..addListener(() {
        if (scrollController.offset <= 0) {
          iconAnimationController.animateTo(
            0.0,
            duration: const Duration(milliseconds: 0),
            curve: Curves.fastOutSlowIn,
          );
        } else if (scrollController.offset > 0 && scrollController.offset < drawerWidth) {
          iconAnimationController.animateTo(
            (scrollController.offset * 100 / (drawerWidth)) / 100,
            duration: const Duration(milliseconds: 0),
            curve: Curves.fastOutSlowIn,
          );
        } else if (scrollController.offset <= drawerWidth) {
          iconAnimationController.animateTo(
            1.0,
            duration: const Duration(milliseconds: 0),
            curve: Curves.fastOutSlowIn,
          );
        }
      });
    WidgetsBinding.instance.addPostFrameCallback((_) => getInitState());
    super.initState();
  }

  Future<bool> getInitState() async {
    scrollController.jumpTo(drawerWidth);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      physics: const PageScrollPhysics(parent: ClampingScrollPhysics()),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width + drawerWidth - 64,
        child: Row(
          children: <Widget>[
            Container(
              color: Colors.grey.shade200,
              width: drawerWidth,
              height: MediaQuery.of(context).size.height,
              child: AnimatedBuilder(
                animation: iconAnimationController,
                builder: (BuildContext context, Widget child) {
                  return Transform(
                    transform: Matrix4.translationValues(scrollController.offset, 0.0, 0.0),
                    child: Align(alignment: Alignment.centerLeft, child: Text('侧边栏区域')),
                  );
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 64,
              height: MediaQuery.of(context).size.height,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(color: Colors.grey.withOpacity(0.6), blurRadius: 24),
                  ],
                ),
                child: Stack(
                  children: <Widget>[
                    Center(child: Text('展示区')),
                    Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 8, left: 8),
                      child: SizedBox(
                        width: AppBar().preferredSize.height - 8,
                        height: AppBar().preferredSize.height - 8,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(AppBar().preferredSize.height),
                            child: Center(
                              child: AnimatedIcon(icon: AnimatedIcons.arrow_menu, progress: iconAnimationController),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
