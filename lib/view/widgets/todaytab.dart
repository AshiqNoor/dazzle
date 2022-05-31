import 'package:dazzle/view/utils/helper/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../controller/today_controller.dart';
import '../utils/constant/const.dart';
import '../utils/share/progress_indicator.dart';
import '../utils/share/share_grid_widget.dart';

class TodayTab extends StatelessWidget {
  const TodayTab({Key? key, required this.isConnectivity}) : super(key: key);
  final bool isConnectivity;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodayController>(
        init: TodayController(),
        builder: (c) {
          return RefreshIndicator(
              onRefresh: () async {
                await c.getListofToday();
              },
              child: isConnectivity
                  ? c.state
                      ? const Center(
                          child: ProgIndicator(
                          indicator: Indicator.ballSpinFadeLoader,
                        ))
                      : ShareGridWidget(
                          fromhome: c.todaylist,
                          scrollController: c.todaycontroller,
                          isLoading: c.isloading,
                        )
                  : const Center(
                      child: Text(
                        noConnection,
                        style: TextStyle(
                          fontSize: 20,
                          color: greyCOLOR,
                        ),
                      ),
                    ));
        });
  }
}
