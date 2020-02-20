import 'package:flutter/material.dart';

class GuideWidget extends StatefulWidget {
  @override
  _GuideWidgetState createState() => _GuideWidgetState();
}

class _GuideWidgetState extends State<GuideWidget> with TickerProviderStateMixin {
  PageController _controller;
  int currentPage = 0;
  bool lastPage = false;
  AnimationController animationController;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: currentPage,
    );
    animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween(begin: 0.6, end: 1.0).animate(animationController);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0xFF485563), Color(0xFF29323C)],
            tileMode: TileMode.clamp,
            begin: Alignment.topCenter,
            stops: [0.0, 1.0],
            end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            PageView.builder(
              itemCount: pageList.length,
              controller: _controller,
              onPageChanged: (index) {
                setState(
                  () {
                    currentPage = index;
                    if (currentPage == pageList.length - 1) {
                      lastPage = true;
                      animationController.forward();
                    } else {
                      lastPage = false;
                      animationController.reset();
                    }
                  },
                );
              },
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    var page = pageList[index];
                    var delta;
                    var y = 1.0;

                    if (_controller.position.haveDimensions) {
                      delta = _controller.page - index;
                      y = 1 - delta.abs().clamp(0.0, 1.0);
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(page.imageUrl),
                        Container(
                          margin: EdgeInsets.only(left: 12.0),
                          height: 100.0,
                          child: Stack(
                            children: <Widget>[
                              Opacity(
                                opacity: .10,
                                child: Text(
                                  page.title,
                                  style: TextStyle(
                                    fontSize: 100.0,
                                    letterSpacing: 1.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 30.0, left: 22.0),
                                child: Text(
                                  page.title,
                                  style: TextStyle(
                                    fontSize: 70.0,
                                    fontFamily: "Montserrat-Black",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 34.0, top: 12.0),
                          child: Transform(
                            transform: Matrix4.translationValues(0, 50.0 * (1 - y), 0),
                            child: Text(
                              page.body,
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Color(0xFF9B9B9B),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                );
              },
            ),
            Positioned(
              left: 30.0,
              bottom: 55.0,
              child: Container(
                width: 160.0,
                child: PageIndicator(currentPage, pageList.length),
              ),
            ),
            Positioned(
              right: 30.0,
              bottom: 30.0,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: lastPage
                    ? FloatingActionButton(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      )
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

var pageList = [
  PageModel(
    imageUrl: "images/owl.jpg",
    title: "MUSIC",
    body: "EXPERIENCE WICKED",
    titleGradient: gradients[0],
  ),
  PageModel(
    imageUrl: "images/owl.jpg",
    title: "SPA",
    body: "FEEL THE MAGIC OF WELLNESS",
    titleGradient: gradients[1],
  ),
  PageModel(
    imageUrl: "images/owl.jpg",
    title: "TRAVEL",
    body: "LET'S HIKE UP",
    titleGradient: gradients[2],
  ),
];

List<List<Color>> gradients = [
  [Color(0xFF9708CC), Color(0xFF43CBFF)],
  [Color(0xFFE2859F), Color(0xFFFCCF31)],
  [Color(0xFF5EFCE8), Color(0xFF736EFE)],
];

class PageModel {
  var imageUrl;
  var title;
  var body;
  List<Color> titleGradient = [];

  PageModel({this.imageUrl, this.title, this.body, this.titleGradient});
}

class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int pageCount;

  PageIndicator(this.currentIndex, this.pageCount);

  _indicator(bool isActive) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        child: Container(
          height: 4.0,
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Color(0xFF3E4750),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 2.0),
                blurRadius: 2.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildPageIndicators() {
    List<Widget> indicatorList = [];
    for (int i = 0; i < pageCount; i++) {
      indicatorList.add(i == currentIndex ? _indicator(true) : _indicator(false));
    }
    return indicatorList;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildPageIndicators(),
    );
  }
}
