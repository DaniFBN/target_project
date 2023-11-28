// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'tg_text_field.dart';

class TgPasswordField extends StatefulWidget {
  const TgPasswordField({
    super.key,
    required this.label,
    required this.controller,
    this.prefixIcon,
    this.validator,
  });

  final String label;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final FieldValidator? validator;

  @override
  State<TgPasswordField> createState() => _TgPasswordFieldState();
}

class _TgPasswordFieldState extends State<TgPasswordField> {
  bool showPassword = false;

  void toggleShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TgTextField(
      label: widget.label,
      controller: widget.controller,
      prefixIcon: widget.prefixIcon,
      obscureText: !showPassword,
      validator: widget.validator,
      suffixIcon: IconButton(
        icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off),
        onPressed: toggleShowPassword,
      ),
    );
  }
}
