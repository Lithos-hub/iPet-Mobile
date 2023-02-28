import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ipet_mobile/theme/app_theme.dart';
import 'package:ipet_mobile/widgets/widgets.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> formValues = {
      'email': '',
      'password': '',
      'repeat_password': '',
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
                  _SignupForm(formValues: formValues),
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
  _SignupForm({
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
        initialValue: const {
          'email': '',
          'password': '',
          'repeat_password': ''
        },
        child: CardContainer(
          child: Column(children: [
            CustomInput(
              name: 'email',
              hintText: 'Escribe tu correo electrónico',
              labelText: 'Correo electrónico',
              formProperty: 'email',
              inputType: 'email',
              formValues: formValues,
              suffixIcon: Icons.email,
            ),
            const SizedBox(height: 20),
            CustomInput(
              name: 'password',
              hintText: '******************',
              labelText: 'Contraseña',
              formProperty: 'password',
              inputType: 'password',
              formValues: formValues,
              suffixIcon: Icons.lock,
            ),
            const SizedBox(height: 20),
            CustomInput(
              name: 'repeat_password',
              hintText: '******************',
              labelText: 'Repite la contraseña',
              formProperty: 'repeat_password',
              inputType: 'password',
              formValues: formValues,
              suffixIcon: Icons.lock,
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () => Navigator.pushNamed(context, 'home'),
              color: AppTheme.primary,
              text: "Crear una cuenta",
            )
          ]),
        ),
      ),
    );
  }
}
