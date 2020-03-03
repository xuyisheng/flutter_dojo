import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const githubUrl = 'https://github.com/xuyisheng/flutter_dojo';
const emailUrl = 'mailto:xuyisheng89@163.com?subject=Hello';
const messageUrl = 'sms:13641719651';

class AboutMeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Image.asset('images/book1.jpeg'),
                ),
                Container(
                  height: kToolbarHeight,
                  margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  child: BackButton(),
                ),
                Positioned(
                  bottom: 0,
                  left: 16,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/xys.jpg'),
                    ),
                  ),
                ),
                Positioned(
                  right: 24,
                  bottom: 30,
                  child: GestureDetector(
                    onTap: () => _launchURL(githubUrl),
                    child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Text(
                        'Github',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '徐宜生',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Android & Flutter developer',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    Text('《Android群英传》《Android群英传-神兵利器》作者'),
                    SizedBox(height: 16),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.my_location,
                          color: Colors.grey,
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Text(
                          '中国 上海 浦东',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      height: 170,
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 150,
                            child: Column(
                              children: <Widget>[
                                Text('WeChat'),
                                Image.asset('images/wechat.jpeg'),
                              ],
                            ),
                          ),
                          SizedBox(width: 24),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () => _launchURL(emailUrl),
                                child: Text(
                                  'Email Me',
                                  style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => _launchURL(messageUrl),
                                child: Text(
                                  'Message Me',
                                  style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      debugPrint('Could not launch $url');
    }
  }
}
