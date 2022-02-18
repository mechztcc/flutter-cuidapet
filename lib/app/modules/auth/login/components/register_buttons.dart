import 'package:app_cuidapet/app/core/ui/components/rounded_button_with_icon.dart';
import 'package:app_cuidapet/app/core/ui/cuidapet_icons.dart';
import 'package:app_cuidapet/app/core/ui/extensions/size_screen_extension.dart';
import 'package:app_cuidapet/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterButtons extends StatelessWidget {
  const RegisterButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: [
        RoundedButtonWithIcon(
          color: const Color(0xff4267b3),
          icon: Cuidapeticons.facebook,
          title: 'Facebook',
          width: .42.sw,
          ontap: () {},
        ),
        RoundedButtonWithIcon(
          color: const Color(0xffe15031),
          icon: Cuidapeticons.google,
          title: 'Google',
          width: .42.sw,
          ontap: () {},
        ),
        RoundedButtonWithIcon(
          color: context.primaryColorDark,
          icon: Cuidapeticons.apple,
          title: 'Cadastrar',
          width: .42.sw,
          ontap: () {
            Modular.to.pushNamed('/auth/register/');
          },
        ),
      ],
    );
  }
}
