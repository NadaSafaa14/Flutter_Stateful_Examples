import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String? Function(String?) validator;
  String title;
  IconData icon;
  IconData? suffixIcon;
  TextEditingController? controller;
  VoidCallback? onSuffixPressed; // 1. Added tap callback
  bool obscure;

  CustomTextFormField({
    super.key,
    required this.title,
    required this.icon,
    this.suffixIcon,
    required this.validator,
    this.controller,
    required this.obscure,
    required this.onSuffixPressed
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: title,
        prefixIcon: Icon(icon, color: Colors.purple),
        filled: true,
        fillColor: Colors.purple[100],
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon, color: Colors.purple),
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
