import 'package:app_cuidapet/app/models/user_model.dart';
import 'package:app_cuidapet/app/modules/core/auth/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../../core/ui/extensions/size_screen_extension.dart';

class AuthHomePage extends StatefulWidget {
  final AuthStore _authstore;

  AuthHomePage({Key? key, required AuthStore authstore})
      : _authstore = authstore,
        super(key: key);

  @override
  State<AuthHomePage> createState() => _AuthHomePageState();
}

class _AuthHomePageState extends State<AuthHomePage> {
  @override
  void initState() {
    super.initState();
    reaction<UserModel?>((_) => widget._authstore.userModel, (userModel) {
      if (userModel != null && userModel.email.isNotEmpty) {
        Modular.to.navigate('/home/');
      } else {
        Modular.to.navigate('/auth/login/');
      }
    });

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      widget._authstore.loadUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 150.w,
          height: 200.w,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
