import 'package:app_cuidapet/app/core/ui/components/cuidapet_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        CuidaPetTextFormField(
          label: 'Login',
        ),
        SizedBox(height: 10),
        CuidaPetTextFormField(
          label: 'Senha',
          obscureText: true,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 60,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Entrar'),
          ),
        )
      ],
    );
  }
}
