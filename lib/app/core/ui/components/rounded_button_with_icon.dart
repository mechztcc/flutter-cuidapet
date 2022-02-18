import 'package:app_cuidapet/app/core/ui/extensions/size_screen_extension.dart';
import 'package:flutter/material.dart';

class RoundedButtonWithIcon extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final double width;
  final GestureTapCallback ontap;

  const RoundedButtonWithIcon(
      {Key? key,
      required this.icon,
      required this.title,
      required this.color,
      required this.width,
      required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: width,
        height: 45.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 2),
            child: Icon(
              icon,
              color: Colors.white,
              size: 20.w,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: VerticalDivider(
              color: Colors.white,
              thickness: 2,
            ),
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ]),
        // child: ,
      ),
    );
  }
}
