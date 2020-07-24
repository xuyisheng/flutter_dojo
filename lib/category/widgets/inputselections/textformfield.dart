import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  final GlobalKey<FormFieldState<String>> _passwordFieldKey = GlobalKey<FormFieldState<String>>();

  String _password;

  String _validateName(String value) {
    if (value.isEmpty) return 'Name is required.';
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value)) return 'Please enter only alphabetical characters.';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 24.0),
        // "Name" form.
        TextFormField(
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            filled: true,
            icon: Icon(Icons.person),
            hintText: 'What do people call you?',
            labelText: 'Name *',
          ),
          onSaved: (String value) {
          },
          validator: _validateName,
        ),
        SizedBox(height: 24.0),
        // "Phone number" form.
        TextFormField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            filled: true,
            icon: Icon(Icons.phone),
            hintText: 'Where can we reach you?',
            labelText: 'Phone Number *',
            prefixText: '+86',
          ),
          keyboardType: TextInputType.phone,
          onSaved: (String value) {
          },
          // TextInputFormatters are applied in sequence.
          inputFormatters: <TextInputFormatter>[
            WhitelistingTextInputFormatter.digitsOnly, //WhitelistingTextInputFormatter(RegExp("[0-9]"))
          ],
        ),
        SizedBox(height: 24.0),
        // "Email" form.
        TextFormField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            filled: true,
            icon: Icon(Icons.email),
            hintText: 'Your email address',
            labelText: 'E-mail',
          ),
          keyboardType: TextInputType.emailAddress,
          onSaved: (String value) {
          },
        ),
        SizedBox(height: 24.0),
        // "Life story" form.
        TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Tell us about yourself',
            helperText: 'Keep it short, this is just a demo.',
            labelText: 'Life story',
          ),
          maxLines: 3,
        ),
        SizedBox(height: 24.0),
        // "Salary" form.
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'Salary', prefixText: '\$', suffixText: 'USD', suffixStyle: TextStyle(color: Colors.green)),
          maxLines: 1,
        ),
        SizedBox(height: 24.0),
        // "Password" form.
        PasswordField(
          fieldKey: _passwordFieldKey,
          helperText: 'No more than 8 characters.',
          labelText: 'Password *',
          onFieldSubmitted: (String value) {
            setState(() {
              this._password = value;
            });
          },
        ),
        SizedBox(height: 24.0),
        // "Re-type password" form.
        TextFormField(
          enabled: this._password != null && this._password.isNotEmpty,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            filled: true,
            labelText: 'Re-type password',
          ),
          maxLength: 8,
          obscureText: true,
        ),
      ],
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
  });

  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      maxLength: 8,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        filled: true,
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }
}
