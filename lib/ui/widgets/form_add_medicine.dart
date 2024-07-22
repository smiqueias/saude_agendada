import 'package:flutter/material.dart';
import 'package:scheduled_health/utils/extensions/theme_extension.dart';

final class FormAddMedicine extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChange;
  final TextInputType? keyboardType;
  final Icon? iconForm;

  const FormAddMedicine(
      {super.key,
      required this.hintText,
      this.validator,
      this.iconForm,
      this.controller,
      this.onChange,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      onChanged: onChange,
      controller: controller,
      validator: validator,
      style: context.typography.input,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: context.colors.gray200,
        prefixIcon: iconForm,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black26),
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
      ),
    );
  }
}
