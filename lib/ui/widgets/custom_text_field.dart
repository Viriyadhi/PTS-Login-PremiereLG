import 'package:flutter/material.dart';
import 'package:flutter_login_practice/common/color_values.dart';
import 'package:flutter_login_practice/common/shared_code.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final bool isPassword;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.textInputType = TextInputType.text,
    this.validator,
    this.prefixIcon,
    this.isPassword = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    dynamic validator = widget.validator;
    validator ?? SharedCode().emptyValidator;

    return TextFormField(
      style: Theme.of(context).textTheme.bodyText1,
      controller: widget.controller,
      keyboardType: widget.textInputType,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: widget.isPassword,
      autocorrect: !widget.isPassword,
      enableSuggestions: !widget.isPassword,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
        label: Text(widget.label.toUpperCase()),
        labelStyle: GoogleFonts.lato(
          color: ColorValues.mediumGrey,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.2,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Icon(widget.prefixIcon, size: 18.0),
        ),
        alignLabelWithHint: true
      ),
    );
  }
}
