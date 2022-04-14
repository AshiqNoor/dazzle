import 'package:dazzle/controller/wallpaper_controller.dart';
import 'package:dazzle/model/wallpaper.dart';
import 'package:dazzle/view/utils/helper/color_helper.dart';
import 'package:dazzle/view/utils/helper/style_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SetAsButton extends StatelessWidget {
  final Wallpaper wallpaper;
  final WallpaperController wallpaperController;
  SetAsButton({
    Key? key,
    required this.wallpaper,
    required this.wallpaperController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 180,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Theme.of(context).primaryColor,
        ),
        child: const Center(
          child: Text(
            "SET AS",
            style: buttons,
          ),
        ),
      ),
      onTap: () {
        showBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) => Container(
                  child: ListView(
                    children: [
                      ListTile(
                        title: const Text(
                          'Set wallpaper as :',
                          style: h1,
                        ),
                        trailing: const Icon(
                          Icons.cancel_outlined,
                          color: blackgreyColor,
                        ),
                        onTap: () {
                          Get.back();
                        },
                      ),

                      // Home Screen
                      ListTile(
                        leading: const Icon(Icons.home_filled),
                        onTap: () {
                          wallpaperController
                              .setHomeScreen(wallpaper.urls.regular);
                          Get.back();
                        },
                        title: const Text(
                          'Home Screen',
                          style: h1,
                        ),
                      ),
                      // Lock Screen
                      ListTile(
                          leading: const Icon(Icons.lock_open),
                          onTap: () {
                            wallpaperController
                                .setLockScreen(wallpaper.urls.regular);
                            Get.back();
                          },
                          title: const Text(
                            'Lock Screen',
                            style: h1,
                          )),
                      // Both Screen
                      ListTile(
                          leading: const Icon(Icons.screen_lock_portrait),
                          onTap: () {
                            wallpaperController
                                .setBothScreen(wallpaper.urls.regular);
                            Get.back();
                          },
                          title: const Text(
                            'Home & Lock Screen',
                            style: h1,
                          )),
                    ],
                  ),
                  height: Get.height * 0.32,
                  decoration: const BoxDecoration(
                    color: whitecolor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ));
      },
    );
  }
}
