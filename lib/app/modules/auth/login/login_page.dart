import 'package:app_cuidapet/app/core/ui/extensions/size_screen_extension.dart';
import 'package:app_cuidapet/app/core/ui/extensions/theme_extension.dart';
import 'package:app_cuidapet/app/modules/auth/login/components/login_form.dart';
import 'package:app_cuidapet/app/modules/auth/login/components/register_buttons.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: 20, vertical: 1.statusBarHeight),
          width: 1.sw,
          height: 1.sh,
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 150.w,
                fit: BoxFit.fill,
              ),
              LoginForm(),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: context.primaryColor,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Ou',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: context.primaryColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: context.primaryColor,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              RegisterButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
