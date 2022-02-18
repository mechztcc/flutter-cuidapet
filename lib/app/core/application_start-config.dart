import 'package:app_cuidapet/app/core/helpers/envitonments.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class ApplicationStartConfig {
  Future<void> configureApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _firebaseConfig();
    await _loadEnvs();
  }

  Future<void> _firebaseConfig() async => Firebase.initializeApp();

  Future<void> _loadEnvs() => Environments.loadEnvs();
}
