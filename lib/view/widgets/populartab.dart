import 'package:dazzle/view/utils/helper/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../controller/popular_controller.dart';

import '../utils/constant/const.dart';
import '../utils/share/progress_indicator.dart';
import '../utils/share/share_grid_widget.dart';

class PopularTab extends StatelessWidget {
  const PopularTab({Key? key, required this.isConnectivity}) : super(key: key);
  final bool isConnectivity;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularController>(
        init: PopularController(),
        builder: (c) {
          return RefreshIndicator(
              onRefresh: () async {
                await c.getListofPopular();
              },
              child: isConnectivity
                  ? c.state
                      ? const Center(
                          child: ProgIndicator(
                          indicator: Indicator.ballSpinFadeLoader,
                        ))
                      : ShareGridWidget(
                          fromhome: c.popularlist,
                          scrollController: c.popularcontroller,
                          isLoading: c.isloading,
                        )
                  : const Center(
                      child: Text(
                      noConnection,
                      style: TextStyle(
                        fontSize: 20,
                        color: greyCOLOR,
                      ),
                    )));
        });
  }
}
