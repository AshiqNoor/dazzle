import 'package:dazzle/controller/ads/home_ads_controller.dart';
import 'package:dazzle/view/utils/constant/const.dart';

import 'package:dazzle/view/utils/helper/color_helper.dart';
import 'package:dazzle/view/utils/helper/style_helper.dart';
import 'package:dazzle/view/widgets/oldesttab.dart';
import 'package:dazzle/view/widgets/populartab.dart';
import 'package:dazzle/view/widgets/todaytab.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeView extends StatelessWidget {
  final bool isConnectivity;
  const HomeView({Key? key, required this.isConnectivity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: appBarCOLOR,
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
          body: Column(
            children: [
              Expanded(
                child: Stack(children: [
                  Container(
                    color: bodyCOLOR,
                    child: TabBarView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        // Today
                        TodayTab(isConnectivity: isConnectivity),
                        // Popular
                        PopularTab(isConnectivity: isConnectivity),
                        // Oldest
                        OldestTab(isConnectivity: isConnectivity),
                      ],
                    ),
                  ),
                  // Home Page Ads
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GetBuilder<HomePageAdsController>(
                          init: HomePageAdsController(),
                          builder: (c) {
                            if (c.isHomepageAdsLoaded) {
                              return Container(
                                  alignment: Alignment.center,
                                  height:
                                      c.homepageBanner.size.height.toDouble(),
                                  //color: bodyCOLOR.withOpacity(0.2),
                                  child: AdWidget(
                                    ad: c.homepageBanner,
                                  ));
                            } else {
                              return Container(
                                height: 0,
                              );
                            }
                          }),
                    ],
                  )
                ]),
              )
            ],
          )),
    );
  }
}
