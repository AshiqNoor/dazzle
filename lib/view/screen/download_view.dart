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
          backgroundColor: whiteCOLOR,
          elevation: 3,
        ),
        body: Container(
          color: whiteCOLOR,
          padding: const EdgeInsets.all(10),
          child: GetBuilder<DownloadController>(
            init: DownloadController(),
            builder: (c) {
              return ValueListenableBuilder(
                  valueListenable: c.downloadbox!.listenable(),
                  builder: (context, Box<String> box, child) {
                    final List<String> keys = box.keys.cast<String>().toList();
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
                              return Material(
                                  elevation: 5,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(7)),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(() => WallpaperView(
                                            isdownload: true,
                                            wallpaper: Wallpaper(
                                              description: '',
                                              altDescription: '',
                                              urls: Urls(
                                                  regular: wallpaper,
                                                  small: ""),
                                            ),
                                          ));
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(7),
                                      child: Hero(
                                        tag: file,
                                        child: FadeInImage(
                                          image: FileImage(file),
                                          fit: BoxFit.cover,
                                          placeholder:
                                              const AssetImage(assetTransparen),
                                        ),
                                      ),
                                    ),
                                  ));
                            },
                          );
                  });
            },
          ),
        ));
  }
}
