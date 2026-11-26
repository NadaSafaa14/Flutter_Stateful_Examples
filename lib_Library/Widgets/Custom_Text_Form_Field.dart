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
        prefixIcon: Icon(icon, color: const Color.fromARGB(255, 114, 114, 114)),
        filled: true,
        fillColor: Colors.grey[200],
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(
                  suffixIcon,
                  color: Color.fromARGB(255, 114, 114, 114),
                ),
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
