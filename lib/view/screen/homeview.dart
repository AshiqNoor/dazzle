import 'package:dazzle/controller/today_controller.dart';
import 'package:dazzle/controller/oldest_controller.dart';
import 'package:dazzle/controller/popular_controller.dart';
import 'package:dazzle/view/utils/constant/const.dart';

import 'package:dazzle/view/utils/helper/color_helper.dart';
import 'package:dazzle/view/utils/helper/style_helper.dart';
import 'package:dazzle/view/utils/share/progress_indicator.dart';

import 'package:flutter/material.dart';
import 'package:dazzle/view/utils/share/share_grid_widget.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

class HomeView extends StatelessWidget {
  final bool isConnectivity;
  const HomeView({Key? key, required this.isConnectivity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: topbotomColor,
          elevation: elevationNo,
          title: TabBar(
            indicatorColor: transparentCOLOR,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: greyCOLOR,
            tabs: const [
              Tab(child: Text(todayText, style: tabText)),
              Tab(child: Text(popularText, style: tabText)),
              Tab(child: Text(oOldestText, style: tabText)),
            ],
          ),
        ),
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          children: [
            // Today
            GetBuilder<TodayController>(
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
                                  wallpaper: c.todaylist,
                                  scrollController: c.todaycontroller,
                                  isLoading: c.isloading,
                                )
                          : const Center(
                              child: Text(
                              "No Internet Connection",
                              style: TextStyle(
                                fontSize: 20,
                                color: greyCOLOR,
                              ),
                            )));
                }),
            // Popular
            GetBuilder<PopularController>(
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
                                  wallpaper: c.popularlist,
                                  scrollController: c.popularcontroller,
                                  isLoading: c.isloading,
                                )
                          : const Center(
                              child: Text(
                              "No Internet Connection",
                              style: TextStyle(
                                fontSize: 20,
                                color: greyCOLOR,
                              ),
                            )));
                }),
            // Oldest
            GetBuilder<OldestController>(
                init: OldestController(),
                builder: (c) {
                  return RefreshIndicator(
                      onRefresh: () async {
                        await c.getListofOldest();
                      },
                      child: isConnectivity
                          ? c.state
                              ? const Center(
                                  child: ProgIndicator(
                                  indicator: Indicator.ballSpinFadeLoader,
                                ))
                              : ShareGridWidget(
                                  wallpaper: c.oldestlist,
                                  scrollController: c.oldestcontroller,
                                  isLoading: c.isloading)
                          : const Center(
                              child: Text(
                              "No Internet Connection",
                              style: TextStyle(
                                fontSize: 20,
                                color: greyCOLOR,
                              ),
                            )));
                }),
          ],
        ),
      ),
    );
  }
}
