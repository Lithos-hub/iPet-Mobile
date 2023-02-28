import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AuthProvider extends ChangeNotifier {
  GlobalKey<FormBuilderState> loginFormKey = GlobalKey<FormBuilderState>();

  String email = '';
  String password = '';

  bool _isSubmitting = false;
  bool get isSubmitting => _isSubmitting;
  set isSubmitting(bool value) {
    _isSubmitting = value;
    notifyListeners();
  }

  bool isValidForm() => loginFormKey.currentState?.validate() ?? false;
}
