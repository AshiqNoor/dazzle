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
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            wallpaperTitle,
            style: h1,
          ),
          centerTitle: true,
          backgroundColor: whiteCOLOR,
          elevation: 1,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              color: greyCOLOR,
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            indicatorColor: transparentCOLOR,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: greyCOLOR,
            tabs: const [
              Tab(child: Text(todayText, style: links)),
              Tab(child: Text(popularText, style: links)),
              Tab(child: Text(oOldestText, style: links)),
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
                  return c.state
                      ? const Center(
                          child: ProgIndicator(
                          indicator: Indicator.ballSpinFadeLoader,
                        ))
                      : ShareGridWidget(
                          wallpaper: c.todaylist,
                          scrollController: c.todaycontroller,
                          isLoading: c.isloading,
                        );
                }),
            // Popular
            GetBuilder<PopularController>(
                init: PopularController(),
                builder: (c) {
                  return c.state
                      ? const Center(
                          child: ProgIndicator(
                          indicator: Indicator.ballSpinFadeLoader,
                        ))
                      : ShareGridWidget(
                          wallpaper: c.popularlist,
                          scrollController: c.popularcontroller,
                          isLoading: c.isloading,
                        );
                }),
            // Oldest
            GetBuilder<OldestController>(
                init: OldestController(),
                builder: (c) {
                  return c.state
                      ? const Center(
                          child: ProgIndicator(
                          indicator: Indicator.ballSpinFadeLoader,
                        ))
                      : ShareGridWidget(
                          wallpaper: c.oldestlist,
                          scrollController: c.oldestcontroller,
                          isLoading: c.isloading);
                }),
          ],
        ),
      ),
    );
  }
}
