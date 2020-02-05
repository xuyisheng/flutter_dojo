import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Profile1Widget extends StatefulWidget {
  @override
  _Profile1WidgetState createState() => _Profile1WidgetState();
}

class _Profile1WidgetState extends State<Profile1Widget> {
  var barKey = GlobalKey();
  var cardHeadKey = GlobalKey();
  var adKey = GlobalKey();
  var itemKey = GlobalKey();
  var gridKey = GlobalKey();

  var barHeight = .0;
  var cardHeadHeight = .0;
  var adHeight = .0;
  var itemHeight = .0;
  var gridHeight = .0;

  var padding = 16.0;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.endOfFrame.then((value) {
      barHeight = getHeightOfWidget(barKey);
      cardHeadHeight = getHeightOfWidget(cardHeadKey);
      adHeight = getHeightOfWidget(adKey);
      gridHeight = getHeightOfWidget(gridKey);
      itemHeight = getHeightOfWidget(itemKey);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: SizedBox(
          height: barHeight + cardHeadHeight + adHeight + gridHeight + itemHeight,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: barHeight + padding * 2,
                left: padding,
                right: padding,
                child: ProfileCardHead(cardHeadKey),
              ),
              Positioned(
                top: barHeight + cardHeadHeight + padding,
                left: padding,
                right: padding,
                child: ProfileAD(adKey),
              ),
              Positioned(
                top: barHeight + cardHeadHeight + adHeight,
                left: 0,
                right: 0,
                child: ProfileGrid(gridKey),
              ),
              Positioned(
                top: padding,
                left: 0,
                right: 0,
                child: ProfileBar(barKey),
              ),
              Positioned(
                top: barHeight + cardHeadHeight + adHeight + gridHeight,
                left: 0,
                right: 0,
                child: ProfileItems(itemKey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double getHeightOfWidget(GlobalKey key) {
    RenderBox renderBox = key.currentContext.findRenderObject();
    return renderBox.size.height;
  }
}

class ProfileBar extends StatelessWidget {
  final GlobalKey sizeKey;

  ProfileBar(this.sizeKey);

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: sizeKey,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: <Widget>[
          Icon(Icons.repeat, size: 20),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: <Widget>[
                Icon(Icons.wb_sunny, size: 16),
                Text(
                  '日间',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
          SizedBox(width: 12),
          Icon(Icons.mail_outline, size: 20)
        ],
      ),
    );
  }
}

class ProfileCardHead extends StatelessWidget {
  final GlobalKey sizeKey;

  ProfileCardHead(this.sizeKey);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: sizeKey,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage('images/book.jpg'),
              ),
              SizedBox(width: 14),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'eclipse_xu',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.ac_unit,
                        color: Colors.green,
                        size: 12,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Lv.5',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(width: 16),
                      Icon(
                        Icons.stars,
                        color: Colors.orange,
                        size: 12,
                      ),
                      SizedBox(width: 4),
                      Text(
                        '普通用户',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.keyboard_arrow_right, size: 16),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '99',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '推荐票',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    )
                  ],
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '999',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '月票',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    )
                  ],
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '9999',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '我的账户',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    )
                  ],
                ),
                Spacer(),
                ButtonTheme(
                  minWidth: 50,
                  height: 25,
                  child: RaisedButton(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {},
                    child: Text(
                      '充值',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProfileAD extends StatelessWidget {
  final GlobalKey sizeKey;

  ProfileAD(this.sizeKey);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: sizeKey,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.star,
                color: Colors.orangeAccent,
              ),
              Text(
                '开通畅享卡',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.orangeAccent,
                ),
              ),
              Spacer(),
              Text(
                '享免费书库等10项福利',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.orangeAccent,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: Colors.orangeAccent,
                size: 14,
              ),
            ],
          ),
          SizedBox(height: 4),
          SizedBox(
            height: 1,
            child: Container(
              color: Colors.orangeAccent,
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

class ProfileADGridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.near_me,
            size: 24,
            color: Colors.black,
          ),
          SizedBox(height: 12),
          Text(
            '特权',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileItems extends StatelessWidget {
  final GlobalKey sizeKey;

  ProfileItems(this.sizeKey);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: sizeKey,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(8, (index) {
          return ListTile(
            leading: Icon(Icons.book),
            title: Text('积分商城'),
          );
        })
          ..insert(
            0,
            Container(
              height: 10,
              color: Colors.grey.shade200,
            ),
          ),
      ),
    );
  }
}

class ProfileGrid extends StatelessWidget {
  final GlobalKey sizeKey;

  ProfileGrid(this.sizeKey);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: sizeKey,
      color: Colors.white,
      height: 180,
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        children: List.generate(8, (index) {
          return ProfileADGridItem();
        }),
      ),
    );
  }
}
