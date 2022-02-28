import 'package:app_cuidapet/app/core/ui/components/cuidapet_default_button.dart';
import 'package:app_cuidapet/app/core/ui/components/cuidapet_text_form_field.dart';
import 'package:app_cuidapet/app/core/ui/validators/validators.dart';
import 'package:app_cuidapet/app/modules/auth/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:app_cuidapet/app/core/ui/extensions/size_screen_extension.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState
    extends ModularState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  final loginEC = TextEditingController();
  final passwordEC = TextEditingController();
  final confirmPasswordEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    loginEC.dispose();
    passwordEC.dispose();
    confirmPasswordEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register page'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: 1.sw,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    width: 150.w,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 10),
                  CuidaPetTextFormField(
                    label: 'Login',
                    controller: loginEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Login obrigatório'),
                      Validatorless.email('E-mail inválido'),
                    ]),
                  ),
                  const SizedBox(height: 10),
                  CuidaPetTextFormField(
                    label: 'Senha',
                    controller: passwordEC,
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha obrigatória'),
                      Validatorless.min(
                          6, 'Senha deve contenter no mínimo 6 caracteres'),
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CuidaPetTextFormField(
                    label: 'Confirmar senha',
                    controller: confirmPasswordEC,
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha obrigatória'),
                      Validatorless.min(
                          6, 'Senha deve contenter no mínimo 6 caracteres'),
                      Validators.compare(passwordEC, 'Senhas divergentes')
                    ]),
                  ),
                  CuidapetDefaultButton(
                    height: 60,
                    width: double.infinity,
                    label: 'Cadastrar',
                    padding: 10,
                    onPressed: () {
                      final formValid =
                          _formKey.currentState?.validate() ?? false;
                      if (formValid) {
                        controller.register(loginEC.text, passwordEC.text);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
