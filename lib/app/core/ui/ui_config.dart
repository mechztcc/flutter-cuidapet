import 'package:flutter/material.dart';

class UiConfig {
  UiConfig._();

  static String get title => 'Cuidapet';
  static ThemeData get theme => ThemeData(
        primaryColor: const Color(0xffA8CE4B),
        primaryColorDark: const Color(0xff689F38),
        primaryColorLight: const Color(0xffDDEDC7),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xff4CAF50)),
      );
}
