import 'package:e_commerce_app/e_commerce_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BottomNavigationBarButton extends StatelessWidget {
  Color color;
  VoidCallback onTap;
  String text;
  Color textColor;
  BottomNavigationBarButton(
      {Key? key,
      required this.color,
      required this.onTap,
      required this.text,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 6.h,
        width: 45.w,
        alignment: Alignment.center,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(2), color: color),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: textColor),
        ),
      ),
    );
  }
}
