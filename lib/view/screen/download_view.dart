import 'package:dazzle/controller/ads/down_ads_controller.dart';
import 'package:dazzle/controller/ads/downgridview_ads_controller.dart';
import 'package:dazzle/controller/download_controller.dart';
import 'package:dazzle/model/urls.dart';
import 'package:dazzle/model/wallpaper.dart';
import 'package:dazzle/view/screen/wallpaper_view.dart';
import 'package:dazzle/view/utils/constant/const.dart';
import 'dart:io';
import 'package:dazzle/view/utils/helper/color_helper.dart';
import 'package:dazzle/view/utils/helper/style_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DownloadView extends StatelessWidget {
  const DownloadView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          downloadTitle,
          style: title1,
        ),
        // bottomOpacity: 5,
        centerTitle: true,
        backgroundColor: appBarCOLOR,
        elevation: elevationNo,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(children: [
              Container(
                color: bodyCOLOR,
                padding: const EdgeInsets.only(
                    top: 10, left: 10, right: 10, bottom: 0),
                child: GetBuilder<DownloadController>(
                  init: DownloadController(),
                  builder: (c) {
                    return ValueListenableBuilder(
                        valueListenable: c.downloadbox!.listenable(),
                        builder: (context, Box<String> box, child) {
                          final List<String> keys =
                              box.keys.cast<String>().toList();
                          return keys.isEmpty
                              ? const Center(child: Text(emptyText))
                              : StaggeredGridView.countBuilder(
                                  physics: const BouncingScrollPhysics(),
                                  crossAxisCount: 4,
                                  staggeredTileBuilder: (i) =>
                                      StaggeredTile.count(2, i.isEven ? 2 : 3),
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                  itemCount: keys.length,
                                  itemBuilder: (context, index) {
                                    final String key = keys[index];
                                    final String? wallpaper = box.get(key);
                                    File file = File(wallpaper!);

                                    return GetBuilder<
                                        DownGridViewAdsController>(
                                      init: DownGridViewAdsController(),
                                      builder: (c) {
                                        if (c.isDownGridViewAdsLoaded &&
                                            index == nativeAdsCount) {
                                          return Container(
                                            child:
                                                AdWidget(ad: c.downGridViewAd),
                                            alignment: Alignment.center,
                                            height: nativeAdsHEIGHT,
                                            //color: redCOLOR.withOpacity(0.2),
                                          );
                                        } else {
                                          return Material(
                                              elevation: 5,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(7)),
                                              child: GestureDetector(
                                                onTap: () {
                                                  Get.to(() => WallpaperView(
                                                        isdownload: true,
                                                        wallpaper: Wallpaper(
                                                          description: '',
                                                          altDescription: '',
                                                          urls: Urls(
                                                              regular:
                                                                  wallpaper,
                                                              small: ""),
                                                        ),
                                                      ));
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  child: Hero(
                                                    tag: file,
                                                    child: FadeInImage(
                                                      image: FileImage(file),
                                                      fit: BoxFit.cover,
                                                      placeholder:
                                                          const AssetImage(
                                                              assetTransparen),
                                                    ),
                                                  ),
                                                ),
                                              ));
                                        }
                                      },
                                    );
                                  },
                                );
                        });
                  },
                ),
              ),
              // Download Page Ads
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GetBuilder<DownloadAdsController>(
                      init: DownloadAdsController(),
                      builder: (c) {
                        if (c.isDownloadAdsLoaded) {
                          return SizedBox(
                              height: c.downloadBanner.size.height.toDouble(),
                              //color: bodyCOLOR.withOpacity(0.2),
                              child: AdWidget(
                                ad: c.downloadBanner,
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
      ),
    );
  }
}
