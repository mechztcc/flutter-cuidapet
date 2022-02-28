import 'package:app_cuidapet/app/core/ui/components/cuidapet_default_button.dart';
import 'package:app_cuidapet/app/core/ui/components/cuidapet_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final loginEC = TextEditingController();
  final passwordEC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    loginEC.dispose();
    passwordEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 10),
          CuidaPetTextFormField(
            label: 'Login',
            controller: loginEC,
            validator: Validatorless.multiple([
              Validatorless.required('Login Obrigatório.'),
              Validatorless.email('E-mail inválido.'),
            ]),
          ),
          const SizedBox(height: 10),
          CuidaPetTextFormField(
            label: 'Senha',
            controller: passwordEC,
            validator: Validatorless.multiple([
              Validatorless.required('Senha obrigatória.'),
              Validatorless.min(6, 'Senha incorreta'),
            ]),
            obscureText: true,
          ),
          const SizedBox(
            height: 20,
          ),
          CuidapetDefaultButton(
            height: 60,
            width: double.infinity,
            label: 'Entrar',
            padding: 10,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
