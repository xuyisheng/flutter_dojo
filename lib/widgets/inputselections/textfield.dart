import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';

class TextFieldWidget extends StatefulWidget {
  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  var selection;
  var textInputActionSelection = TextInputAction.done;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('TextField基本用法'),
        TextField(),
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
        MainTitleWidget('选择TextField键盘完成功能'),
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
      ],
    );
  }
}
