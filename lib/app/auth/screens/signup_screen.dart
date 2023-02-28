import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:ipet_mobile/providers/auth_provider.dart';
import 'package:ipet_mobile/theme/app_theme.dart';
import 'package:ipet_mobile/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                    child: const _SignupForm(),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppTheme.secondary,
          elevation: 0,
          child: const Icon(Icons.chevron_left),
          onPressed: () => Navigator.pop(context)),
    );
  }
}

class _SignupForm extends StatelessWidget {
  const _SignupForm();

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<AuthProvider>(context);
    loginForm.email = '';
    loginForm.password = '';
    return Container(
      margin: const EdgeInsets.all(20),
      child: FormBuilder(
        key: loginForm.loginFormKey,
        initialValue: const {
          'email': '',
          'password': '',
          'repeat_password': ''
        },
        child: CardContainer(
          child: Column(children: [
            CustomInput(
              name: 'email',
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
                      errorText: 'El email es obligatorio'),
                  FormBuilderValidators.email(
                      errorText: 'Introduce un email válido'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomInput(
              name: 'password',
              hintText: '******** (Mínimo 8 caracteres)',
              labelText: 'Contraseña',
              formProperty: 'password',
              inputType: 'password',
              suffixIcon: Icons.lock,
              onChanged: (value) => loginForm.password = value as String,
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(
                      errorText: 'La contraseña es obligatorio'),
                  FormBuilderValidators.match(
                      r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^\w\d\s:])([^\s]){8,}$',
                      errorText: 'Usa [A-Z], [a-z], 0-9, y símbolos'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomInput(
              name: 'repeat_password',
              hintText: '******** (Mínimo 8 caracteres)',
              labelText: 'Repite la contraseña',
              formProperty: 'password',
              inputType: 'password',
              suffixIcon: Icons.lock,
              onChanged: (value) {
                print(loginForm.password);
              },
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(
                      errorText: 'La contraseña es obligatoria'),
                  FormBuilderValidators.equal(loginForm.password)
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () => {
                if (loginForm.isValidForm())
                  {Navigator.pushNamed(context, 'home')}
              },
              color: AppTheme.primary,
              text: 'Crear una cuenta',
            )
          ]),
        ),
      ),
    );
  }
}
