import 'package:flutter/material.dart';

class TestAnim2Widget extends StatefulWidget {
  @override
  _TestAnim2WidgetState createState() => _TestAnim2WidgetState();
}

class _TestAnim2WidgetState extends State<TestAnim2Widget> with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 1))..forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        AnimatedItem(
          startDelayFraction: 0.00,
          controller: controller,
          child: AnimCategoryContainer(
            CategoryBean(
              Icons.desktop_mac,
              'Catefory1',
              [
                CategoryBean(Icons.repeat, 'Item1', [], () {}),
                CategoryBean(Icons.repeat, 'Item2', [], () {}),
                CategoryBean(Icons.repeat, 'Item3', [], () {}),
              ],
              () {},
            ),
          ),
        ),
        SizedBox(height: 24),
        AnimatedItem(
          startDelayFraction: 0.1,
          controller: controller,
          child: AnimCategoryContainer(
            CategoryBean(
              Icons.dashboard,
              'Catefory2',
              [
                CategoryBean(Icons.repeat, 'Item1', [], () {}),
                CategoryBean(Icons.repeat, 'Item2', [], () {}),
                CategoryBean(Icons.repeat, 'Item3', [], () {}),
              ],
              () {},
            ),
          ),
        ),
        SizedBox(height: 24),
        AnimatedItem(
          startDelayFraction: 0.2,
          controller: controller,
          child: AnimCategoryContainer(
            CategoryBean(
              Icons.chat,
              'Catefory3',
              [
                CategoryBean(Icons.repeat, 'Item1', [], () {}),
                CategoryBean(Icons.repeat, 'Item2', [], () {}),
                CategoryBean(Icons.repeat, 'Item3', [], () {}),
              ],
              () {},
            ),
          ),
        ),
      ],
    );
  }
}

class AnimatedItem extends StatelessWidget {
  AnimatedItem({
    Key key,
    double startDelayFraction,
    @required this.controller,
    @required this.child,
  })  : topPaddingAnimation = Tween(
          begin: 60.0,
          end: 0.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.000 + startDelayFraction,
              0.400 + startDelayFraction,
              curve: Curves.ease,
            ),
          ),
        ),
        super(key: key);

  final Widget child;
  final AnimationController controller;
  final Animation<double> topPaddingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Padding(
          padding: EdgeInsets.only(top: topPaddingAnimation.value),
          child: child,
        );
      },
      child: child,
    );
  }
}

class AnimCategoryContainer extends StatefulWidget {
  final CategoryBean categoryBean;

  AnimCategoryContainer(this.categoryBean);

  @override
  _AnimCategoryContainerState createState() => _AnimCategoryContainerState();
}

class _AnimCategoryContainerState extends State<AnimCategoryContainer> with SingleTickerProviderStateMixin {
  bool isExpanded;
  AnimationController controller;
  Animation<EdgeInsetsGeometry> marginAnim;
  Animation<BorderRadius> radiusAnim;

  @override
  void initState() {
    super.initState();
    isExpanded = false;
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    marginAnim = Tween(
      begin: EdgeInsets.symmetric(horizontal: 16),
      end: EdgeInsets.zero,
    ).animate(controller);
    radiusAnim = BorderRadiusTween(
      begin: BorderRadius.circular(16),
      end: BorderRadius.zero,
    ).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          margin: marginAnim.value,
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: radiusAnim.value,
            ),
            color: Colors.cyan.shade700,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => onTap(),
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 80,
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 24),
                          child: Icon(
                            widget.categoryBean.icon,
                            size: 48,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            widget.categoryBean.title,
                            style: TextStyle(color: Colors.white, fontSize: 30),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ClipRect(
                    child: Align(
                      heightFactor: controller.value,
                      child: child,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: isExpanded || controller.isDismissed
          ? Column(
              children: [
                for (final demo in widget.categoryBean.categoryItems) AnimCategoryItem(demo),
                const SizedBox(height: 12),
              ],
            )
          : null,
    );
  }

  void onTap() {
    isExpanded = !isExpanded;
    if (isExpanded) {
      controller.forward();
      setState(() {});
    } else {
      controller.reverse().then<void>((value) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    }
  }
}

class AnimCategoryItem extends StatefulWidget {
  final CategoryBean categoryBeanItem;

  AnimCategoryItem(this.categoryBeanItem);

  @override
  _AnimCategoryItemState createState() => _AnimCategoryItemState();
}

class _AnimCategoryItemState extends State<AnimCategoryItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.categoryBeanItem.onTap,
      title: Text(
        widget.categoryBeanItem.title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class CategoryBean {
  IconData icon;
  String title;
  List<CategoryBean> categoryItems;
  var onTap;

  CategoryBean(this.icon, this.title, this.categoryItems, this.onTap);
}
