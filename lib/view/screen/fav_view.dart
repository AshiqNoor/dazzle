import 'package:dazzle/controller/favorite_controller.dart';
import 'package:dazzle/model/wallpaper.dart';
import 'package:dazzle/view/screen/wallpaper_view.dart';

import 'package:dazzle/view/utils/helper/color_helper.dart';
import 'package:dazzle/view/utils/helper/style_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hive_flutter/adapters.dart';

class FavView extends StatelessWidget {
  const FavView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Favourite',
            style: title1,
          ),
          centerTitle: true,
          backgroundColor: whitecolor,
          elevation: 0,
        ),
        body: Container(
          color: whitecolor,
          padding: const EdgeInsets.all(20),
          child: GetBuilder<FavoriteController>(
            init: FavoriteController(),
            builder: (c) {
              return ValueListenableBuilder(
                  valueListenable: c.favbox!.listenable(),
                  builder: (context, Box<Wallpaper> box, child) {
                    final List<String> keys = box.keys.cast<String>().toList();
                    return keys.isEmpty
                        ? const Center(child: Text("Empty"))
                        : GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 15,
                              childAspectRatio: 2 / 3.2,
                            ),
                            itemCount: keys.length,
                            itemBuilder: (context, index) {
                              final String key = keys[index];
                              final Wallpaper? wallpaper = box.get(key);
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() =>
                                      WallpaperView(wallpaper: wallpaper!));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(3),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: pinkcolor,
                                    ),
                                    child: Hero(
                                      tag: wallpaper!.urls.regular,
                                      child: Image.network(
                                        wallpaper.urls.regular,
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
