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
  const ProgIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 7),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: LoadingIndicator(
          indicatorType: Indicator.lineSpinFadeLoader,
          colors: rainbowColors,
        ),
      ),
    );
  }
}

class MidProgIndicator extends StatelessWidget {
  const MidProgIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Colors.transparent,
      child: LoadingIndicator(
        indicatorType: Indicator.ballSpinFadeLoader,
        colors: rainbowColors,
      ),
    );
  }
}
