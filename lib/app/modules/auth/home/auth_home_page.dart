import 'package:flutter/material.dart';
import '../../../core/ui/extensions/size_screen_extension.dart';

class AuthHomePage extends StatefulWidget {
  AuthHomePage({Key? key}) : super(key: key);

  @override
  State<AuthHomePage> createState() => _AuthHomePageState();
}

class _AuthHomePageState extends State<AuthHomePage> {
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
