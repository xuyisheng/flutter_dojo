import 'dart:math';

import 'package:flutter/material.dart';

class ItemLayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        WeChatItemWidget(),
        SizedBox(height: 40),
        TaoBaoItemWidget(),
        SizedBox(
          height: 40,
        ),
        TwitterItemWidget(),
      ],
    );
  }
}

class TwitterItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 60),
              Icon(
                Icons.loop,
                size: 16,
                color: Colors.grey.shade500,
              ),
              Text(
                'Eclipse_xu转推了',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(8),
                child: CircleAvatar(
                  child: Image.asset('images/logo.png'),
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Android群英传',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '@xuyisheng·1天',
                                      style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.grey.shade500,
                                    ),
                                  ],
                                ),
                                Text('xxxxxxxxxxxxxxxxxxxxxxx'),
                                AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage('images/widget_bg.png'),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    '999个查看',
                                    style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.chat_bubble,
                                      color: Colors.grey.shade500,
                                      size: 16,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      '99',
                                      style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.rotate_right,
                                      color: Colors.grey.shade500,
                                      size: 16,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      '99',
                                      style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.grey.shade500,
                                      size: 16,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      '99',
                                      style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.share,
                                      color: Colors.grey.shade500,
                                      size: 16,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      '99',
                                      style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                                    ),
                                    SizedBox(width: 30)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class TaoBaoItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 8),
            child: Stack(
              overflow: Overflow.clip,
              children: <Widget>[
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/book.jpg'),
                    ),
                  ),
                ),
                Positioned(
                  top: -32,
                  left: -32,
                  child: Transform.rotate(
                    angle: -pi / 4,
                    child: Container(
                      color: Colors.red,
                      width: 64,
                      height: 64,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          '热卖',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '【正版】《Android群英传》 提高Android技能的最佳途径和最好伙伴',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    '广告' * 20,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 10),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: Text(
                      '包邮',
                      style: TextStyle(
                        fontSize: 8,
                        color: Colors.red.shade300,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.red.shade300),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        '\$ 998',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.red.shade500,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '999人付款',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      Spacer(),
                      Text(
                        '  上海',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Flutter旗舰店>',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.more_horiz,
                        color: Colors.grey.shade600,
                        size: 16,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WeChatItemWidget extends StatelessWidget {
  const WeChatItemWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 8),
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage('images/owl.jpg'),
                  ),
                ),
              ),
              Positioned(
                top: -4,
                right: -4,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
            overflow: Overflow.visible,
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '徐宜生',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '你的小可爱上线了',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '22:00',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                  ),
                ),
                Icon(
                  Icons.remove_red_eye,
                  color: Colors.grey.shade500,
                  size: 16,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
