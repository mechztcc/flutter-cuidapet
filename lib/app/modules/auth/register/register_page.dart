import 'package:app_cuidapet/app/core/ui/components/cuidapet_default_button.dart';
import 'package:app_cuidapet/app/core/ui/components/cuidapet_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:app_cuidapet/app/core/ui/extensions/size_screen_extension.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                ),
                const SizedBox(height: 10),
                CuidaPetTextFormField(
                  label: 'Senha',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                CuidaPetTextFormField(
                  label: 'Confirmar senha',
                  obscureText: true,
                ),
                CuidapetDefaultButton(
                  height: 60,
                  width: double.infinity,
                  label: 'Cadastrar',
                  padding: 10,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
