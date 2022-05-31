import 'package:dazzle/controller/wallpaper_controller.dart';
import 'package:dazzle/model/wallpaper.dart';
import 'package:dazzle/view/utils/constant/const.dart';
import 'package:dazzle/view/utils/helper/color_helper.dart';
import 'package:dazzle/view/utils/helper/style_helper.dart';
import 'package:dazzle/model/bottom_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../model/result.dart';

class SetAsButton extends StatelessWidget {
  final Wallpaper? fromhome;
  final Result? fromsearch;
  final bool? isSearch;
  final bool isdownload;
  final WallpaperController wallpaperController;
  const SetAsButton({
    Key? key,
    this.fromhome,
    required this.wallpaperController,
    required this.isdownload,
    this.isSearch,
    this.fromsearch,
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
            setAs,
            style: buttonsText,
          ),
        ),
      ),
      onTap: () {
        if (MediaQuery.of(context).orientation == Orientation.landscape) {
          showBottomSheet(
              backgroundColor: transparentCOLOR,
              context: context,
              builder: (context) => Container(
                    child: ListView(
                      children: BottomList.bottomSheetName.map((val) {
                        return ListTile(
                          trailing: val.name == setScreenAs ? val.icon : null,
                          leading: val.name == setScreenAs ? null : val.icon,
                          title: Text(
                            val.name,
                            style: bottomText,
                          ),
                          onTap: () {
                            wallpaperController.setScreen(
                                url: isSearch!
                                    ? fromsearch!.urls.regular
                                    : fromhome!.urls.regular,
                                name: val.name,
                                imgpath: isSearch!
                                    ? fromsearch!.urls.regular
                                    : fromhome!.urls.regular,
                                download: isdownload);
                            Get.back();
                          },
                        );
                      }).toList(),
                    ),
                    height: Get.height * 0.64,
                    decoration: const BoxDecoration(
                      color: bottomSheetCOLOR,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                  ));
        } else {
          showBottomSheet(
              backgroundColor: transparentCOLOR,
              context: context,
              builder: (context) => Container(
                    child: ListView(
                      children: BottomList.bottomSheetName.map((val) {
                        return ListTile(
                          trailing: val.name == setScreenAs ? val.icon : null,
                          leading: val.name == setScreenAs ? null : val.icon,
                          title: Text(
                            val.name,
                            style: bottomText,
                          ),
                          onTap: () {
                            wallpaperController.setScreen(
                                url: isSearch!
                                    ? fromsearch!.urls.regular
                                    : fromhome!.urls.regular,
                                name: val.name,
                                imgpath: isSearch!
                                    ? fromsearch!.urls.regular
                                    : fromhome!.urls.regular,
                                download: isdownload);
                            Get.back();
                          },
                        );
                      }).toList(),
                    ),
                    height: Get.height * 0.32,
                    decoration: const BoxDecoration(
                      color: bottomSheetCOLOR,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                  ));
        }
      },
    );
  }
}
