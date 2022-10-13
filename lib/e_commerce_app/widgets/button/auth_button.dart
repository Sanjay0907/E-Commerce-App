import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../utils/colors.dart';

class AuthButton extends StatelessWidget {
  IconData icon;
  Color backgroundColor;
  VoidCallback onTap;
  AuthButton(
      {Key? key,
      required this.icon,
      required this.backgroundColor,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 7.h,
          width: 7.h,
          alignment: Alignment.center,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
          child: FaIcon(
            icon,
            size: 4.h,
            color: white,
          )),
    );
  }
}
