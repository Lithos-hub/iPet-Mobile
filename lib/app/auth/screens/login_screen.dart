import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:ipet_mobile/providers/auth_provider.dart';

import 'package:ipet_mobile/theme/app_theme.dart';
import 'package:ipet_mobile/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.appBar});
  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
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
                  ChangeNotifierProvider(
                    create: (_) => AuthProvider(),
                    child: const _LoginForm(),
                  ),
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
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<AuthProvider>(context);
    loginForm.email = '';
    loginForm.password = '';
    return Container(
      margin: const EdgeInsets.all(20),
      child: FormBuilder(
        key: loginForm.loginFormKey,
        initialValue: const {'email': '', 'password': ''},
        child: CardContainer(
          child: Column(children: [
            CustomInput(
              name: "email",
              hintText: 'email@dominio.com',
              labelText: 'Correo electrónico',
              inputType: 'email',
              formProperty: 'email',
              suffixIcon: Icons.email,
              autocorrect: false,
              onChanged: (value) => loginForm.email = value as String,
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(
                      errorText: "El email es obligatorio"),
                  FormBuilderValidators.email(
                      errorText: "Introduce un email válido"),
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
              suffixIcon: Icons.lock,
              onChanged: (value) => loginForm.password = value as String,
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(
                      errorText: "La contraseña es obligatorio"),
                  FormBuilderValidators.match(
                      r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^\w\d\s:])([^\s]){8,}$',
                      errorText: 'Usa [A-Z], [a-z], 0-9, y símbolos'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: loginForm
                      .isSubmitting // => Disable the button if is submitting
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus(); // => Remove keyboard
                      Navigator.pushNamed(context, 'home');

                      if (!loginForm.isValidForm()) return;
                      loginForm.isSubmitting = true;

                      // If error: isSubmitting = false
                      // else: redirects to 'home'

                      Navigator.pushNamed(context, 'home');
                      loginForm.isSubmitting = false;
                    },
              color: AppTheme.primary,
              text: loginForm.isSubmitting ? 'Validando...' : 'Acceder',
            )
          ]),
        ),
      ),
    );
  }
}
