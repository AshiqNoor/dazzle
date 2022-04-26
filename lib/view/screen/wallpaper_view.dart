import 'dart:io';

import 'package:dazzle/controller/favorite_controller.dart';
import 'package:dazzle/controller/wallpaper_controller.dart';
import 'package:dazzle/model/result.dart';
import 'package:dazzle/model/wallpaper.dart';
import 'package:dazzle/view/widgets/bottom_icon.dart';
import 'package:dazzle/view/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WallpaperView extends StatelessWidget {
  final Wallpaper? wallpaper;
  final Result? wallpaper1;
  final bool? isSearch;
  final bool isdownload;
  const WallpaperView({
    Key? key,
    this.wallpaper,
    this.wallpaper1,
    required this.isdownload,
    this.isSearch = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: _width,
            height: _height,
            child: Hero(
              tag: isSearch!
                  ? wallpaper1!.urls.regular
                  : wallpaper!.urls.regular,
              child: isdownload
                  ? Image.file(
                      File(wallpaper!.urls.regular),
                      fit: BoxFit.cover,
                    )
                  : isSearch!
                      ? Image.network(
                          wallpaper1!.urls.regular,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          wallpaper!.urls.regular,
                          fit: BoxFit.cover,
                        ),
            ),
          ),
          // : SizedBox(
          //     width: _width,
          //     height: _height,
          //     child: Hero(
          //       tag: wallpaper!.urls.regular,
          //       child: Image.network(
          //         wallpaper!.urls.regular,
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //   ),
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
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(Icons.arrow_back_ios)),
                        //Option button
                        BottomIconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_vert)),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                              ? wallpaper1!.urls.regular
                                              : wallpaper!.urls.regular);
                                        },
                                        icon: const Icon(
                                            Icons.file_download_outlined)),
                                  ),
                            //Set AS button
                            // isSearch!
                            //     ?
                            SetAsButton(
                              wallpaper1: isSearch! ? wallpaper1 : null,
                              wallpaper: isSearch! ? null : wallpaper,
                              wallpaperController: c,
                              isdownload: isdownload,
                              isSearch: isSearch! ? true : false,
                            )
                            // : SetAsButton(
                            //     wallpaper: wallpaper,
                            //     wallpaperController: c,
                            //     isdownload: isdownload,
                            //     isSearch: isSearch! ? true : false,
                            //   ),
                            //Favorite button
                            ,
                            isdownload
                                ? Container()
                                : GetBuilder<FavoriteController>(
                                    init: FavoriteController(),
                                    initState: (con) {
                                      Future.delayed(const Duration(seconds: 0))
                                          .then((value) {
                                        con.controller!.inlist(isSearch!
                                            ? wallpaper1!.urls.regular
                                            : wallpaper!.urls.regular);
                                      });
                                    },
                                    builder: (c) {
                                      return CircleAvatar(
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                        child: BottomIconButton(
                                            onPressed: () {
                                              c.favtoggole(isSearch!
                                                  ? wallpaper1!
                                                  : wallpaper!);
                                            },
                                            icon: c.isfav
                                                ? const Icon(Icons.favorite)
                                                : const Icon(
                                                    Icons.favorite_border)),
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
    );
  }
}
