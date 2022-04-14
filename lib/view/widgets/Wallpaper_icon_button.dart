import 'package:dazzle/view/utils/helper/color_helper.dart';
import 'package:flutter/material.dart';

class WallpaperIconButton extends StatelessWidget {
  final Function onPressed;
  final Color? color;
  final Widget icon;

  const WallpaperIconButton(
      {Key? key,
      required this.onPressed,
      this.color = whitecolor,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          onPressed();
        },
        icon: icon,
        color: color);
  }
}
