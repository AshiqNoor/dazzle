import 'package:dazzle/controller/favorite_controller.dart';
import 'package:dazzle/controller/wallpaper_controller.dart';
import 'package:dazzle/model/wallpaper.dart';

import 'package:dazzle/view/widgets/Wallpaper_icon_button.dart';

import 'package:dazzle/view/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WallpaperView extends StatelessWidget {
  final Wallpaper wallpaper;
  const WallpaperView({Key? key, required this.wallpaper}) : super(key: key);

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
              tag: wallpaper.urls.regular,
              child: Image.network(
                wallpaper.urls.regular,
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
                        WallpaperIconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(Icons.arrow_back_ios)),
                        //Option button
                        WallpaperIconButton(
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
                            CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              child: WallpaperIconButton(
                                  onPressed: () {
                                    c.downloadWallpaper(wallpaper.urls.regular);
                                  },
                                  icon:
                                      const Icon(Icons.file_download_outlined)),
                            ),
                            //Set AS button
                            SetAsButton(
                                wallpaper: wallpaper, wallpaperController: c),
                            //Favorite button
                            GetBuilder<FavoriteController>(
                              init: FavoriteController(),
                              initState: (con) {
                                Future.delayed(const Duration(seconds: 0))
                                    .then((value) {
                                  con.controller!
                                      .inlist(wallpaper.urls.regular);
                                });
                              },
                              builder: (c) {
                                return CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  child: WallpaperIconButton(
                                      onPressed: () {
                                        c.favtoggole(wallpaper);
                                      },
                                      icon: c.isfav
                                          ? const Icon(Icons.favorite)
                                          : const Icon(Icons.favorite_border)),
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
