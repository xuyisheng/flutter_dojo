import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';

class VerificationCodeWidget extends StatefulWidget {
  @override
  _VerificationCodeWidgetState createState() => _VerificationCodeWidgetState();
}

class _VerificationCodeWidgetState extends State<VerificationCodeWidget> {
  TextEditingController _controller;
  int count = 4;
  VerificationBoxItemType type = VerificationBoxItemType.box;
  FocusNode _focusNode;
  List codeList = [];

  @override
  void initState() {
    List.generate(count, (index) => codeList.add(''));
    _controller = TextEditingController();
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_focusNode),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              createFakeTextField(),
              Positioned.fill(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    count,
                    (index) => Container(
                      width: 50,
                      height: 50,
                      child: VerificationCodeItem(
                        data: codeList[index],
                        type: type,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          MultiSelectionWidget(
            'title',
            VerificationBoxItemType.values,
            VerificationBoxItemType.values,
            (value) {
              setState(() => type = value);
            },
          ),
        ],
      ),
    );
  }

  createFakeTextField() {
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      decoration: InputDecoration(
        border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
      ),
      cursorWidth: 0,
      autofocus: true,
      showCursor: false,
      maxLength: count,
      buildCounter: (
        BuildContext context, {
        int currentLength,
        int maxLength,
        bool isFocused,
      }) {
        return Text('');
      },
      keyboardType: TextInputType.number,
      style: TextStyle(color: Colors.transparent),
      onChanged: (value) {
        for (int i = 0; i < count; i++) {
          if (i < value.length) {
            codeList[i] = value.substring(i, i + 1);
          } else {
            codeList[i] = '';
          }
        }
        setState(() {
          if (value.length == count) {
            _focusNode.unfocus();
          }
        });
      },
    );
  }
}

enum VerificationBoxItemType {
  underline,
  box,
}

class VerificationCodeItem extends StatelessWidget {
  VerificationCodeItem({
    this.data = '',
    this.type = VerificationBoxItemType.box,
  });

  final String data;
  final VerificationBoxItemType type;

  @override
  Widget build(BuildContext context) {
    var widget;
    if (type == VerificationBoxItemType.box) {
      widget = createBoxStyle();
    } else {
      widget = createUnderLineStyle();
    }
    return widget;
  }

  createBoxStyle() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: Text('$data', style: TextStyle(fontSize: 20)),
    );
  }

  createUnderLineStyle() {
    return Container(
      alignment: Alignment.center,
      decoration: UnderlineTabIndicator(
        borderSide: BorderSide(width: 2, color: Colors.grey),
      ),
      child: Text('$data', style: TextStyle(fontSize: 20)),
    );
  }
}
