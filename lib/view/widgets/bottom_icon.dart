import 'package:dazzle/view/utils/helper/color_helper.dart';
import 'package:flutter/material.dart';

class BottomIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? color;
  final Widget icon;

  const BottomIconButton(
      {Key? key,
      required this.onPressed,
      this.color = whiteCOLOR,
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
