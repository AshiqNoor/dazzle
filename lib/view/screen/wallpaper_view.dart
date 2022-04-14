import 'package:dazzle/model/wallpaper.dart';
import 'package:dazzle/view/utils/helper/color_helper.dart';
import 'package:dazzle/view/utils/helper/style_helper.dart';
import 'package:dazzle/view/utils/share/Wallpaper_icon_button.dart';
import 'package:dazzle/view/utils/share/bottom_sheet.dart';
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
                        WallpaperIconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(Icons.arrow_back_ios)),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Download
                        CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          child: WallpaperIconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(Icons.file_download_outlined)),
                        ),
                        //Set AS
                        const SetAsButton(),
                        //Favorite
                        CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          child: WallpaperIconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.favorite_border,
                              )),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
