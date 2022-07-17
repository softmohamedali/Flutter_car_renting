import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextFailed extends StatelessWidget {

  Widget icon ;
  Null Function(String) onValueChange;
  String label;
  FormFieldValidator<String>? validator;
  MyTextFailed({
    required this.onValueChange,
    required this.icon,
    required this.label,
    required this.validator
  }) {
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      onChanged: (value) {
        onValueChange(value);
      },
      validator:validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon:icon,
        border: OutlineInputBorder(),
      ),
    );
  }
}
