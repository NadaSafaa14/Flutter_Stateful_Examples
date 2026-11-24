import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String? Function(String?) validator;
  String title;
  IconData icon;
  IconData? suffixIcon;
  TextEditingController? controller;
  void Function()? onSuffixPressed;
  bool obscure;

  CustomTextFormField({
    super.key,
    required this.title,
    required this.icon,
    this.suffixIcon,
    required this.validator,
    this.controller,
    required this.obscure,
    required this.onSuffixPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: title,
        prefixIcon: Icon(icon, color: Colors.deepPurple),
        filled: true,
        fillColor: Colors.grey[300],
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon, color: Colors.deepPurple),
                onPressed: onSuffixPressed,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
