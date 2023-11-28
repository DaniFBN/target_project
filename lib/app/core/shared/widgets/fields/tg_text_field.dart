import 'package:flutter/material.dart';

typedef FieldValidator = String? Function(String? value);

class TgTextField extends StatelessWidget {
  const TgTextField({
    super.key,
    required this.label,
    required this.controller,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.onSubmit,
  });

  final String label;
  final TextEditingController controller;
  final FieldValidator? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final void Function(String value)? onSubmit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(label, style: theme.primaryTextTheme.bodyMedium),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          onFieldSubmitted: onSubmit,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
