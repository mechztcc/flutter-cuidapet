import 'package:flutter/material.dart';
import 'package:app_cuidapet/app/core/ui/extensions/theme_extension.dart';

class CuidaPetTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final IconButton? suffixIcon;
  final ValueNotifier<bool> obscureTextVN;

  CuidaPetTextFormField({
    Key? key,
    required this.label,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
  })  : obscureTextVN = ValueNotifier<bool>(obscureText),
        assert(obscureText == true ? suffixIcon == null : true,
            'obscureText não pode ser adicionado junto com o suffixIcon'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: obscureTextVN,
      builder: (_, obscureTextValue, child) {
        return TextFormField(
          cursorColor: Colors.green,
          controller: controller,
          validator: validator,
          obscureText: obscureTextValue,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.green),
            ),
            suffixIcon: obscureText
                ? IconButton(
                    onPressed: () {
                      obscureTextVN.value = !obscureTextValue;
                    },
                    icon: Icon(obscureTextValue ? Icons.lock : Icons.lock_open),
                    color: context.primaryColor,
                  )
                : suffixIcon,
          ),
        );
      },
    );
  }
}
