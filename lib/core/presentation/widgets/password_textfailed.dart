import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyPasswordTextField extends StatelessWidget {
  var isShow;
  Null Function(String) onValueChange;
  Null Function() onVisionPasswordClick;
  String label;
  FormFieldValidator<String>? validator;

  MyPasswordTextField({
    required this.onValueChange,
    required this.label,
    required this.isShow,
    required this.onVisionPasswordClick,
    this.validator
  }) {}

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      onChanged: (value) {
        onValueChange(value);
      },
      validator:validator,
      obscureText: isShow,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          onPressed: () {
            onVisionPasswordClick();
          },
          icon: Icon(Icons.remove_red_eye),
        ),
        border: OutlineInputBorder(),
      ),
    );
  }
}


// Widget myPasswordTextField(Null Function(String) onValueChange,) {
//   var isShow = false;
//   return TextFormField(
//     keyboardType: TextInputType.visiblePassword,
//     onChanged: (value) {
//       onValueChange(value);
//     },
//     validator: (value) {
//       if (value!.isEmpty) {
//         return "required";
//       }
//       return null;
//     },
//     obscureText: isShow,
//     decoration: InputDecoration(
//       labelText: "Phone Number",
//       prefixIcon: Icon(Icons.lock),
//       suffixIcon: IconButton(
//         onPressed: () {},
//         icon: Icon(Icons.remove_red_eye),
//       ),
//       border: OutlineInputBorder(),
//     ),
//   );
// }