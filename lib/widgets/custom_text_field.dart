import 'package:flutter/material.dart';

class CustomTextFieldContainer extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final int maxLines;
  final Widget? suffixIcon;

  const CustomTextFieldContainer({
    super.key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.maxLines = 1,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            border: InputBorder.none,
            suffixIcon: suffixIcon,
          ),
          validator: validator,
          maxLines: maxLines,
        ),
      ),
    );
  }
}
