import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ipet_mobile/theme/app_theme.dart';

class BuilderInput extends FormBuilderTextField {
  BuilderInput({
    super.key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.suffixIcon,
    this.icon,
    this.inputType,
    required this.formProperty,
    required this.formValues,
    // this.autocorrect,
    // this.validator,
    required super.name,
  });

  final String? hintText;
  final String? labelText;
  final String? helperText;

  final IconData? suffixIcon;
  final IconData? icon;

  final String? inputType;

  // final bool? autocorrect;
  // final String? Function(String?)? validator;

  final String formProperty;
  final Map<String, dynamic> formValues;

  static Map<String, TextInputType> inputTypeOptions = {
    'email': TextInputType.emailAddress,
    'text': TextInputType.text,
    'number': TextInputType.number,
    'phone': TextInputType.phone,
    'datetime': TextInputType.datetime,
  };

  Widget build(BuildContext context) {
    return TextFormField(
        textCapitalization: TextCapitalization.words,
        keyboardType: inputTypeOptions[inputType],
        // autocorrect: autocorrect ?? false,
        onChanged: (value) => formValues[formProperty] = value,
        validator: validator,
        obscureText: inputType == 'password',
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppTheme.primarySoft)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppTheme.primary, width: 2)),
          // filled: true,
          // iconColor: Colors.white,
          fillColor: Colors.white,
          hintText: hintText,
          labelText: labelText,
          helperText: helperText,
          suffixIcon: suffixIcon == null
              ? null
              : Icon(suffixIcon, color: AppTheme.primarySoft),
          icon: icon == null ? null : Icon(icon, color: AppTheme.primarySoft),
        ));
  }
}
