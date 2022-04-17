import 'package:dazzle/controller/wallpaper_controller.dart';
import 'package:dazzle/model/wallpaper.dart';
import 'package:dazzle/view/utils/constant/const.dart';
import 'package:dazzle/view/utils/helper/color_helper.dart';
import 'package:dazzle/view/utils/helper/style_helper.dart';
import 'package:dazzle/model/bottom_list.dart';
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

  final List<BottomList> bottomSheetName = [
    BottomList(name: setScreenAs, icon: const Icon(Icons.cancel_outlined)),
    BottomList(name: homeScreen, icon: const Icon(Icons.home_filled)),
    BottomList(name: lockScreen, icon: const Icon(Icons.lock_open)),
    BottomList(name: bothScreen, icon: const Icon(Icons.screen_lock_portrait)),
  ];
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
            setAs,
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
                    children: bottomSheetName.map((val) {
                      return ListTile(
                        trailing: val.name == setScreenAs ? val.icon : null,
                        leading: val.name == setScreenAs ? null : val.icon,
                        title: Text(
                          val.name,
                          style: h1,
                        ),
                        onTap: () {
                          wallpaperController.setScreen(
                              wallpaper.urls.regular, val.name);
                          Get.back();
                        },
                      );
                    }).toList(),
                  ),
                  height: Get.height * 0.32,
                  decoration: const BoxDecoration(
                    color: whitecolor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                ));
      },
    );
  }
}
