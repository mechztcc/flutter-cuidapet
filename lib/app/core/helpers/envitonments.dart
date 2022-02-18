import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environments {
  Environments._();

  static String? param(String paramName) {
    if (kReleaseMode) {
      FirebaseRemoteConfig firebaseRemoteConfig = FirebaseRemoteConfig.instance;
      firebaseRemoteConfig.fetchAndActivate();
      return firebaseRemoteConfig.getString(paramName);
    } else {
      return dotenv.env[paramName];
    }
  }

  static Future<void> loadEnvs() async {
    if (kReleaseMode) {
      FirebaseRemoteConfig firebaseRemoteConfig = FirebaseRemoteConfig.instance;
      firebaseRemoteConfig.fetchAndActivate();
    } else {
      await dotenv.load();
    }
  }
}
