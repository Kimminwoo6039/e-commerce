import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/theme/constant/app_icons.dart';

class SvgIconButton extends StatelessWidget {
  const SvgIconButton(
      {required this.icon, required this.color, this.padding = 4.0, super.key});

  final double padding;
  final String icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:  EdgeInsets.all(padding),
        child: SvgPicture.asset(icon,
            colorFilter: ColorFilter.mode(
                color,
                BlendMode.srcIn)));
  }
}
