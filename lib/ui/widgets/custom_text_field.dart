import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/color_values.dart';
import '../../common/shared_code.dart';

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
  final FocusNode _focusNode = FocusNode();
  TextStyle? _textStyle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _focusNode.addListener(() {
      setState(() {
        if (_focusNode.hasFocus) {
          _textStyle = GoogleFonts.lato(fontSize: 14.0, fontWeight: FontWeight.w600, color: ColorValues.primaryGreen);
        } else {
          _textStyle = Theme.of(context).textTheme.bodyText1;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    dynamic validator = widget.validator;
    validator ??= SharedCode().emptyValidator;

    return TextFormField(
      focusNode: _focusNode,
      style: _textStyle ?? Theme.of(context).textTheme.bodyText1,
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
        alignLabelWithHint: true,
        label: Text(widget.label.toUpperCase()),
        labelStyle: GoogleFonts.lato(
          color: ColorValues.mediumGrey,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Icon(widget.prefixIcon),
        ),
      ),
    );
  }
}
