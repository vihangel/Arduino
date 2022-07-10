import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String title;

  // final VoidCallback? onPressed;

  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String value)? onChanged;
  final bool? obscureText;
  final IconButton? icon;
  final bool? autoFocus;
  const TextFormFieldWidget(
      {Key? key,
      required this.title,
      this.validator,
      this.controller,
      this.onChanged,
      this.obscureText,
      this.icon,
      this.autoFocus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autoFocus ?? false,
      decoration: InputDecoration(
        suffixIcon: icon,
        labelText: title,
      ),
      validator:
          validator ?? Validatorless.required('Este campo é obrigatório'),
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText ?? false,
    );
  }
}
