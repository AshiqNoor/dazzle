import 'package:dazzle/controller/download_controller.dart';
import 'package:dazzle/model/urls.dart';
import 'package:dazzle/model/wallpaper.dart';
import 'package:dazzle/view/screen/wallpaper_view.dart';
import 'dart:io';
import 'package:dazzle/view/utils/helper/color_helper.dart';
import 'package:dazzle/view/utils/helper/style_helper.dart';
import 'package:flutter/material.dart';
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
            'Download',
            style: title1,
          ),
          // bottomOpacity: 5,
          centerTitle: true,
          backgroundColor: whitecolor,
          elevation: 3,
        ),
        body: Container(
          color: whitecolor,
          padding: const EdgeInsets.all(10),
          child: GetBuilder<DownloadController>(
            init: DownloadController(),
            builder: (c) {
              return ValueListenableBuilder(
                  valueListenable: c.downloadbox!.listenable(),
                  builder: (context, Box<String> box, child) {
                    final List<String> keys = box.keys.cast<String>().toList();
                    return keys.isEmpty
                        ? const Center(child: Text("Empty"))
                        : GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                              childAspectRatio: 2 / 3.03,
                            ),
                            itemCount: keys.length,
                            itemBuilder: (context, index) {
                              final String key = keys[index];
                              final String? wallpaper = box.get(key);
                              File file = File(wallpaper!);
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => WallpaperView(
                                        isdownload: true,
                                        wallpaper: Wallpaper(
                                          description: '',
                                          altDescription: '',
                                          urls: Urls(
                                              regular: wallpaper, small: ""),
                                        ),
                                      ));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: pinkcolor,
                                    ),
                                    child: Hero(
                                      tag: file,
                                      child: Image.file(
                                        file,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                  });
            },
          ),
        ));
  }
}
