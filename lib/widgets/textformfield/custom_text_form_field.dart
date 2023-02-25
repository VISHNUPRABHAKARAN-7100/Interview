import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

/// This screen is for making a custom textform
/// field to obtain refacor method and reduce code.
///

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.textInputFormatter,
     this.keyboardType,
    this.suffixIconOnTap,
    this.suffixIcon,
    this.validatorOnTap,
  });

  // Variables for the textformfiel
  final String hintText;
  final TextEditingController controller;
  final List<TextInputFormatter>? textInputFormatter;
  final TextInputType? keyboardType;
  final Function()? suffixIconOnTap;
  final IconData? suffixIcon;
  final Function()? validatorOnTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: suffixIconOnTap,
          icon: Icon(suffixIcon),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: hintText,
      ),
      inputFormatters: textInputFormatter,
      validator: (String? value) {
        return validatorOnTap!();
      },
    );
  }
}
