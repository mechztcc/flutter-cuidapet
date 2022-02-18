import 'package:flutter/material.dart';
import 'package:app_cuidapet/app/core/ui/extensions/theme_extension.dart';

class CuidapetDefaultButton extends StatelessWidget {
  final String label;
  final double height;
  final double width;
  final double padding;
  final VoidCallback? onPressed;

  const CuidapetDefaultButton(
      {Key? key,
      required this.label,
      required this.height,
      required this.width,
      required this.padding,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
          primary: context.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
