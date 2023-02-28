import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ipet_mobile/theme/app_theme.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.suffixIcon,
    this.icon,
    this.inputType,
    required this.formProperty,
    this.autocorrect,
    this.validator,
    required this.name,
    this.onChanged,
  });

  final String? hintText;
  final String? labelText;
  final String? helperText;

  final IconData? suffixIcon;
  final IconData? icon;

  final String? inputType;

  final bool? autocorrect;
  final dynamic validator;
  final String name;

  final String formProperty;

  final void Function(String?)? onChanged;

  static Map<String, TextInputType> inputTypeOptions = {
    'email': TextInputType.emailAddress,
    'text': TextInputType.text,
    'number': TextInputType.number,
    'phone': TextInputType.phone,
    'datetime': TextInputType.datetime,
  };

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
        name: name,
        textCapitalization: TextCapitalization.words,
        keyboardType: inputTypeOptions[inputType],
        autocorrect: autocorrect ?? false,
        obscureText: inputType == 'password',
        onChanged: onChanged,
        validator: validator,
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
