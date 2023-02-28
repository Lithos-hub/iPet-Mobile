import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:ipet_mobile/theme/app_theme.dart';
import 'package:ipet_mobile/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.appBar});
  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> formValues = {
      'email': '',
      'password': '',
    };

    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Column(
                children: [
                  const AuthLogo(),
                  _LoginForm(formValues: formValues),
                ],
              ),
              const SizedBox(height: 50),
              TextButton(
                  onPressed: () => Navigator.pushNamed(context, 'signup'),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Crear una cuenta",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  _LoginForm({
    super.key,
    required this.formValues,
  });

  final Map<String, dynamic> formValues;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: FormBuilder(
        key: _formKey,
        initialValue: const {'email': 'patata', 'password': ''},
        child: CardContainer(
          child: Column(children: [
            CustomInput(
              name: "email",
              hintText: 'email@dominio.com',
              labelText: 'Correo electrónico',
              inputType: 'email',
              formProperty: 'email',
              formValues: formValues,
              suffixIcon: Icons.email,
              autocorrect: false,
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomInput(
              name: "password",
              hintText: '******** (Mínimo 8 caracteres)',
              labelText: 'Contraseña',
              formProperty: 'password',
              inputType: 'password',
              formValues: formValues,
              suffixIcon: Icons.lock,
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(),
                  FormBuilderValidators.match(
                      r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^\w\d\s:])([^\s]){8,}$',
                      errorText: 'Usa [A-Z], [a-z], 0-9, y símbolos'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () => Navigator.pushNamed(context, 'home'),
              color: AppTheme.primary,
              text: "Acceder",
            )
          ]),
        ),
      ),
    );
  }
}
