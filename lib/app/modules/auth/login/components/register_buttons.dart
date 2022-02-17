import 'package:flutter/material.dart';

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
        Container(
          color: Colors.blue,
          height: 40,
          width: 165,
        ),
        Container(
          color: Colors.green,
          height: 40,
          width: 165,
        ),
        Container(
          color: Colors.red,
          height: 40,
          width: 165,
        ),
      ],
    );
  }
}
