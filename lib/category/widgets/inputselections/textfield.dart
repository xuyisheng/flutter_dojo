import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class TextFieldWidget extends StatefulWidget {
  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  var selection;
  var textInputActionSelection = TextInputAction.done;
  var controller = TextEditingController();
  var controller1 = TextEditingController();
  var input = '';
  var input2 = '';
  var input3 = '';
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;
  var isFocus = '';

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      setState(() => input3 = controller.text);
    });
    controller1.text = "XuYisheng";
    controller1.selection = TextSelection(
      baseOffset: 2,
      extentOffset: controller1.text.length - 2,
    );
    focusNode1.addListener(() {
      setState(() => isFocus = focusNode1.hasFocus ? 'true' : 'false');
    });

    return ListView(
      children: <Widget>[
        MainTitleWidget('TextField基本用法'),
        TextField(),
        MainTitleWidget('设置TextField可输入最大行数'),
        Container(
          constraints: BoxConstraints(maxHeight: 80),
          child: TextField(
            maxLines: null,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),
        MainTitleWidget('选择TextField输入模式'),
        MultiSelectionWidget(
          'Type',
          [
            TextInputType.number,
            TextInputType.text,
            TextInputType.emailAddress,
          ],
          [
            'number',
            'text',
            'emailAddress',
          ],
          (value) {
            setState(() {
              selection = value;
            });
          },
        ),
        TextField(
          keyboardType: selection,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            icon: Icon(Icons.text_fields),
            labelText: 'labelText',
            helperText: 'helperText',
          ),
          onChanged: (value) {},
          autofocus: false,
        ),
        MainTitleWidget('设置边框'),
        TextField(
          keyboardType: selection,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onChanged: (value) {},
          autofocus: false,
        ),
        MainTitleWidget('设置背景'),
        SizedBox(height: 20),
        TextField(
          maxLength: 20,
          style: TextStyle(fontSize: 20.0, color: Theme.of(context).primaryColor),
          keyboardType: TextInputType.number,
          cursorColor: Colors.green,
          // cursorRadius: Radius.circular(20),
          // cursorWidth: 40,
          decoration: InputDecoration(
            hintText: 'input',
            hintStyle: TextStyle(color: Colors.white),
            helperText: 'number',
            filled: true,
            fillColor: Colors.blue,
            prefixIcon: Icon(Icons.label),
            suffixIcon: Icon(Icons.list),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
        SubtitleWidget('下划线模式'),
        TextField(
          decoration: InputDecoration(
            labelText: "Input",
            prefixIcon: Icon(Icons.keyboard),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
        ),
        MainTitleWidget('选择TextField键盘完成键的功能'),
        MultiSelectionWidget(
          'TextInputAction',
          TextInputAction.values,
          TextInputAction.values.map((value) {
            return value.toString().split('.')[1];
          }).toList(),
          (value) {
            setState(() => textInputActionSelection = value);
          },
        ),
        TextField(textInputAction: textInputActionSelection),
        MainTitleWidget('获取输入内容'),
        TextField(
          autofocus: true,
          controller: controller,
        ),
        Row(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() => input = controller.text);
              },
              child: Text('Get'),
            ),
            Spacer(),
            Text(input),
          ],
        ),
        MainTitleWidget('监听输入数据'),
        SubtitleWidget('通过onChange实现'),
        TextField(
          autofocus: true,
          onChanged: (v) {
            setState(() => input2 = v);
          },
        ),
        Text(input2),
        SubtitleWidget('通过controller addListener'),
        TextField(
          autofocus: true,
          controller: controller,
        ),
        Text(input3),
        MainTitleWidget('通过controller控制TextField'),
        TextField(controller: controller1),
        MainTitleWidget('控制焦点'),
        TextField(
          focusNode: focusNode1,
          decoration: InputDecoration(hintText: 'TextNode1'),
        ),
        TextField(
          focusNode: focusNode2,
          decoration: InputDecoration(hintText: 'TextNode2'),
        ),
        Row(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                if (focusScopeNode == null) {
                  focusScopeNode = FocusScope.of(context);
                }
                focusScopeNode.requestFocus(focusNode2);
              },
              child: Text('移动焦点'),
            ),
            RaisedButton(
              onPressed: () {
                focusNode1.unfocus();
                focusNode2.unfocus();
              },
              child: Text('取消全部焦点'),
            )
          ],
        ),
        SubtitleWidget('焦点的监听'),
        Text('TextNode1焦点 $isFocus'),
        SizedBox(height: 50),
      ],
    );
  }
}
