import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../utils/colors.dart';

class AppBarIconButton extends StatelessWidget {
  IconData icon;
  VoidCallback onTap;
  AppBarIconButton({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: FaIcon(
        icon,
        size: 2.3.h,
        color: white,
      ),
    );
  }
}
