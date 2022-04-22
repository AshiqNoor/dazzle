import 'package:dazzle/controller/today_controller.dart';
import 'package:dazzle/controller/oldest_controller.dart';
import 'package:dazzle/controller/popular_controller.dart';

import 'package:dazzle/view/utils/helper/color_helper.dart';
import 'package:dazzle/view/utils/helper/style_helper.dart';
import 'package:dazzle/view/utils/share/progress_indicator.dart';

import 'package:flutter/material.dart';
import 'package:dazzle/view/utils/share/share_grid_widget.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Wallpaper',
            style: h1,
          ),
          centerTitle: true,
          backgroundColor: whitecolor,
          elevation: 1,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              color: greyColor,
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.transparent,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: greyColor,
            tabs: const [
              Tab(child: Text('Today', style: links)),
              Tab(child: Text('Popular', style: links)),
              Tab(child: Text('Oldest', style: links)),
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
                      ? const Center(child: MidProgIndicator())
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
                      ? const Center(child: MidProgIndicator())
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
                      ? const Center(child: MidProgIndicator())
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
