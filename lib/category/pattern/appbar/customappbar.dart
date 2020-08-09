import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 230, 86, 85),
              Color.fromARGB(255, 88, 103, 239),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CircleAvatar(
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 48,
                      height: 48,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  Text(
                    'My songs',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Icon(
                    Icons.add,
                    size: 36,
                    color: Colors.white,
                  )
                ],
              ),
              SizedBox(height: 16),
              Container(
                height: 36,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'sss',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'sss',
                      style: TextStyle(
                        color: Colors.grey.shade300,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'sss',
                      style: TextStyle(
                        color: Colors.grey.shade300,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 148, 60, 70),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 216, 146, 164),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: CircleAvatar(
                                child: Image.asset(
                                  'assets/images/logo.png',
                                  width: 36,
                                  height: 36,
                                ),
                                backgroundColor: Colors.white,
                                radius: 18,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'XuYisheng',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'zhujia',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(flex: 4),
                            Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 36,
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.whatshot,
                                    size: 24,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    '20',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: 6,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
