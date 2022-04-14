import 'package:dazzle/controller/home_controller.dart';

import 'package:dazzle/view/utils/helper/color_helper.dart';
import 'package:dazzle/view/utils/helper/style_helper.dart';
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
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              color: greyColor,
              onPressed: () {},
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.transparent,
            labelColor: Colors.blue,
            unselectedLabelColor: greyColor,
            tabs: [
              Tab(child: Text('Today', style: links)),
              Tab(child: Text('Popular', style: links)),
              Tab(child: Text('Oldest', style: links)),
            ],
          ),
        ),
        body: GetBuilder<HomeController>(
          init: HomeController(),
          //initState: (_) {},
          builder: (c) {
            return TabBarView(
              physics: const BouncingScrollPhysics(),
              children: [
                c.state
                    ? const Center(child: CircularProgressIndicator())
                    : ShareGridWidget(
                        wallpaper: c.todaylist,
                      ),
                c.state
                    ? const Center(child: CircularProgressIndicator())
                    : ShareGridWidget(
                        wallpaper: c.popularlist,
                      ),
                c.state
                    ? const Center(child: CircularProgressIndicator())
                    : ShareGridWidget(
                        wallpaper: c.oldestlist,
                      ),
              ],
            );
          },
        ),
        // bottomNavigationBar: const TabBar(
        //     indicatorColor: Colors.transparent,
        //     labelColor: Colors.blue,
        //     unselectedLabelColor: greyColor,
        //     tabs: [
        //       Tab(
        //         icon: Icon(Icons.home),
        //         child: Text('Home', style: links),
        //       ),
        //       Tab(
        //         icon: Icon(Icons.search),
        //         child: Text('Today', style: links),
        //       ),
        //       Tab(
        //         icon: Icon(Icons.favorite),
        //         child: Text('Today', style: links),
        //       ),
        //     ]),
      ),
    );
  }
}
