import 'package:flutter/material.dart';

class Login1Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            width: 80,
            margin: EdgeInsets.only(top: 50),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Logo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              '帐号登录',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 30,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: '手机/邮箱/帐号',
                labelText: '帐号',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 30,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: '请输入您的帐号密码',
                labelText: '密码',
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 30,
            ),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '登录',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.redAccent,
              onPressed: () {},
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 30,
            ),
            child: Row(
              children: <Widget>[
                Expanded(flex: 1, child: Text('忘记密码')),
                Expanded(flex: 0, child: Text('注册帐号')),
              ],
            ),
          ),
          Expanded(flex: 1, child: Container()),
          Container(
            margin: EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                Text('快速登录'),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 30,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
