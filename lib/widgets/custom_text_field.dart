import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.keyboardType,
    this.style,
    this.readOnly = false,
    this.obscureText = false,
    this.validator,
    this.maxLines = 1,
    this.inputFormatters,
    this.hint,
    this.suffixIcon,
    this.onchanged,
    this.isSearchField = false,
    this.contentPadding,
    this.fillColor,
    this.filled,
  });
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final bool readOnly;
  final bool obscureText;
  final String? Function(String?)? validator;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final String? hint;
  final Widget? suffixIcon;
  final Function(String)? onchanged;
  final bool isSearchField;
  final EdgeInsets? contentPadding;
  final Color? fillColor;
  final bool? filled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: style,
      readOnly: readOnly,
      obscureText: obscureText,
      validator: validator,
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      onChanged: onchanged,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        isDense: true,
        fillColor: fillColor,
        filled: filled,
        hintText: hint,
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
