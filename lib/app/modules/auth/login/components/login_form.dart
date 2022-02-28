import 'package:app_cuidapet/app/core/ui/components/cuidapet_default_button.dart';
import 'package:app_cuidapet/app/core/ui/components/cuidapet_text_form_field.dart';
import 'package:app_cuidapet/app/modules/auth/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ModularState<LoginForm, LoginController> {
  final _loginEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _loginEC.dispose();
    _passwordEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 10),
          CuidaPetTextFormField(
            label: 'Login',
            controller: _loginEC,
            validator: Validatorless.multiple([
              Validatorless.required('Login Obrigatório.'),
              Validatorless.email('E-mail inválido.'),
            ]),
          ),
          const SizedBox(height: 10),
          CuidaPetTextFormField(
            label: 'Senha',
            controller: _passwordEC,
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
            onPressed: () {
              final formValid = _formKey.currentState?.validate() ?? false;
              if (formValid) {
                controller.login(_loginEC.text, _passwordEC.text);
              }
            },
          )
        ],
      ),
    );
  }
}
