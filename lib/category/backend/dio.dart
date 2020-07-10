import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/net/api.dart';

class DioWidget extends StatefulWidget {
  @override
  _DioWidgetState createState() => _DioWidgetState();
}

class _DioWidgetState extends State<DioWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  testRequest() {
    return DioManager().request<TestEntity>(
      Method.POST,
      TEST_URL_PATH,
      params: {"account": "421789838@qq.com", "password": "123456"},
      success: (data) {},
      error: (error) {},
    );
  }
}

class TestEntity {
  static fromJson(json) {}
}
