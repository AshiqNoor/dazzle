import 'dart:io';

import 'package:dazzle/controller/ads/fullpage_ads_controller.dart';
import 'package:dazzle/controller/favorite_controller.dart';
import 'package:dazzle/controller/wallpaper_controller.dart';
import 'package:dazzle/model/popup_list.dart';
import 'package:dazzle/model/result.dart';
import 'package:dazzle/model/wallpaper.dart';
import 'package:dazzle/view/utils/helper/color_helper.dart';
import 'package:dazzle/view/utils/helper/style_helper.dart';
import 'package:dazzle/view/widgets/bottom_icon.dart';
import 'package:dazzle/view/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WallpaperView extends StatelessWidget {
  final Wallpaper? fromhome;
  final Result? fromsearch;
  final bool? isSearch;
  final bool isdownload;
  const WallpaperView({
    Key? key,
    this.fromhome,
    this.fromsearch,
    required this.isdownload,
    this.isSearch = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return GetBuilder<FullPageAdsController>(
      init: FullPageAdsController(),
      builder: (c) {
        return WillPopScope(
          onWillPop: () async {
            if (c.isFullPageAdsLoaded) {
              c.fullPageAd.show();
              Get.back();
            }
            return true;
          },
          child: Scaffold(
            body: Stack(
              children: [
                SizedBox(
                  width: _width,
                  height: _height,
                  child: Hero(
                    tag: isSearch!
                        ? fromsearch!.urls.regular
                        : fromhome!.urls.regular,
                    child: isdownload
                        ? Image.file(
                            File(fromhome!.urls.regular),
                            fit: BoxFit.cover,
                          )
                        : isSearch!
                            ? Image.network(
                                fromsearch!.urls.regular,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                fromhome!.urls.regular,
                                fit: BoxFit.cover,
                              ),
                  ),
                ),
                SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Header
                      Container(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //Back button
                              BottomIconButton(
                                onPressed: () async {
                                  if (c.isFullPageAdsLoaded) {
                                    c.fullPageAd.show();
                                    Get.back();
                                  }
                                  return Get.back();
                                },
                                icon: const Icon(Icons.arrow_back_ios),
                              ),

                              //Share button
                              GetBuilder<WallpaperController>(
                                init: WallpaperController(),
                                builder: (cc) {
                                  return PopupMenuButton<PouUpList>(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    color: bodyCOLOR,
                                    icon: const Icon(Icons.more_vert,
                                        color: whiteCOLOR),
                                    itemBuilder: (BuildContext context) {
                                      return PouUpList.itemname.map((item) {
                                        return PopupMenuItem(
                                            value: item,
                                            child: ConstrainedBox(
                                              constraints: const BoxConstraints(
                                                minWidth: double.infinity,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      item.icon as Widget,
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        item.name,
                                                        style: popupText,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ));
                                      }).toList();
                                    },
                                    onSelected: (item) {
                                      cc.shareWallpaper(
                                          isSearch!
                                              ? fromsearch!.urls.regular
                                              : fromhome!.urls.regular,
                                          item.name);
                                    },
                                  );
                                },
                              ),
                            ],
                          )),
                      //Bottom
                      Container(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          margin: const EdgeInsets.only(bottom: 20),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: GetBuilder<WallpaperController>(
                            init: WallpaperController(),
                            builder: (c) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //Download button
                                  isdownload
                                      ? Container()
                                      : CircleAvatar(
                                          backgroundColor:
                                              Theme.of(context).primaryColor,
                                          child: BottomIconButton(
                                              onPressed: () {
                                                c.downloadWallpaper(isSearch!
                                                    ? fromsearch!.urls.regular
                                                    : fromhome!.urls.regular);
                                              },
                                              icon: const Icon(Icons
                                                  .file_download_outlined)),
                                        ),
                                  //Set AS button
                                  SetAsButton(
                                    fromsearch: isSearch! ? fromsearch : null,
                                    fromhome: isSearch! ? null : fromhome,
                                    wallpaperController: c,
                                    isdownload: isdownload,
                                    isSearch: isSearch! ? true : false,
                                  ),
                                  isdownload
                                      ? Container()
                                      : GetBuilder<FavoriteController>(
                                          init: FavoriteController(),
                                          initState: (con) {
                                            Future.delayed(
                                                    const Duration(seconds: 0))
                                                .then((value) {
                                              con.controller!.inlist(isSearch!
                                                  ? fromsearch!.urls.regular
                                                  : fromhome!.urls.regular);
                                            });
                                          },
                                          builder: (c) {
                                            return CircleAvatar(
                                              backgroundColor: Theme.of(context)
                                                  .primaryColor,
                                              child: BottomIconButton(
                                                  onPressed: () {
                                                    c.favtoggole(isSearch!
                                                        ? fromsearch!
                                                        : fromhome!);
                                                  },
                                                  icon: c.isfav
                                                      ? const Icon(
                                                          Icons.favorite)
                                                      : const Icon(Icons
                                                          .favorite_border)),
                                            );
                                          },
                                        ),
                                ],
                              );
                            },
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
