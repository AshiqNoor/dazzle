import 'package:dazzle/view/utils/helper/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

// const List<Color> _kDefaultRainbowColors = [
//   Colors.red,
//   Colors.orange,
//   Colors.yellow,
//   Colors.green,
//   Colors.blue,
//   Colors.indigo,
//   Colors.purple,
// ];

class ProgIndicator extends StatelessWidget {
  final Indicator? indicator;
  const ProgIndicator({
    Key? key,
    this.indicator = Indicator.lineSpinFadeLoader,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: CircleAvatar(
        backgroundColor: transparentCOLOR,
        child: LoadingIndicator(
          indicatorType: indicator!,
          colors: rainbowCOLORS,
        ),
      ),
    );
  }
}
