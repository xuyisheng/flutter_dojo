import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  var name;
  var tel;
  var email;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('Form基本使用'),
        Form(
          onWillPop: willPop,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
        MainTitleWidget('Form AutoValidate'),
        Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (value) => name = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Tel'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value.length != 11)
                    return 'Tel Number must be 11 digit';
                  else
                    return null;
                },
                onSaved: (value) => tel = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  Pattern pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regex = RegExp(pattern);
                  if (!regex.hasMatch(value))
                    return 'Not Valid Email';
                  else
                    return null;
                },
                onSaved: (value) => email = value,
              ),
              SizedBox(height: 10),
              RaisedButton(
                onPressed: validateInputs,
                child: Text('Validate'),
              )
            ],
          ),
        )
      ],
    );
  }

  void validateInputs() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
    } else {
      // 输入后再开启自动检查
      setState(() => autovalidateMode = AutovalidateMode.always);
    }
  }

  Future<bool> willPop() {
    return showDialog(
      builder: (context) => AlertDialog(
        title: Text('Exit the page?'),
        actions: <Widget>[
          FlatButton(
            child: Text('No'),
            onPressed: () => Navigator.pop(context, false),
          ),
          FlatButton(
            child: Text('Yes'),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
      context: context,
    );
  }
}
