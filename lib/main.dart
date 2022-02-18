import 'package:app_cuidapet/app/app_module.dart';
import 'package:app_cuidapet/app/app_widget.dart';
import 'package:app_cuidapet/app/core/application_start-config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  await ApplicationStartConfig().configureApp();
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
