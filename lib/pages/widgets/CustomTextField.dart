import 'package:flutter/material.dart';
import 'package:not_app/contsvariable.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.maxlins = 1,
    this.onSaved,
    this.onChanged,
  });

  final String hint;
  final int maxlins;
  final String? Function(String?)? onSaved;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Please fill this field";
        } else {
          return null;
        }
      },
      maxLines: maxlins,
      decoration: InputDecoration(
        focusedBorder: buildOutlineInputBorder(primaryColor),
        hintText: hint,
        hintStyle: TextStyle(color: primaryColor),
        enabledBorder: buildOutlineInputBorder(),
        border: buildOutlineInputBorder(Colors.grey),
      ),
    );
  }
}

OutlineInputBorder buildOutlineInputBorder([Color]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(
      color: Color ?? Colors.white,
      width: 2,
    ),
  );
}
