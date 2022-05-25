import 'package:dazzle/controller/favorite_controller.dart';
import 'package:dazzle/model/wallpaper.dart';
import 'package:dazzle/view/screen/wallpaper_view.dart';
import 'package:dazzle/view/utils/constant/const.dart';

import 'package:dazzle/view/utils/helper/color_helper.dart';
import 'package:dazzle/view/utils/helper/style_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'package:hive_flutter/adapters.dart';

class FavView extends StatelessWidget {
  const FavView({Key? key, required this.isConnectivity}) : super(key: key);
  final bool isConnectivity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            favoriteTitle,
            style: title1,
          ),
          centerTitle: true,
          backgroundColor: topbotomColor,
          elevation: elevationNo,
        ),
        body: Container(
          color: whiteCOLOR,
          padding: const EdgeInsets.all(10),
          child: GetBuilder<FavoriteController>(
            init: FavoriteController(),
            builder: (c) {
              return isConnectivity
                  ? ValueListenableBuilder(
                      valueListenable: c.favbox!.listenable(),
                      builder: (context, Box<Wallpaper> box, child) {
                        final List<String> keys =
                            box.keys.cast<String>().toList();
                        return keys.isEmpty
                            ? const Center(child: Text(emptyText))
                            : StaggeredGridView.countBuilder(
                                physics: const BouncingScrollPhysics(),
                                crossAxisCount: 4,
                                staggeredTileBuilder: (i) =>
                                    StaggeredTile.count(2, i.isEven ? 2.2 : 3),
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                itemCount: keys.length,
                                itemBuilder: (context, index) {
                                  final String key = keys[index];
                                  final Wallpaper? wallpaper = box.get(key);
                                  return Material(
                                      elevation: 5,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(7)),
                                      child: GestureDetector(
                                          onTap: () {
                                            Get.to(() => WallpaperView(
                                                  wallpaper: wallpaper!,
                                                  isdownload: false,
                                                ));
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            child: Hero(
                                              tag: wallpaper!.urls.regular,
                                              child: FadeInImage(
                                                image: NetworkImage(
                                                  wallpaper.urls.regular,
                                                ),
                                                fit: BoxFit.cover,
                                                placeholder: const AssetImage(
                                                    assetTransparen),
                                              ),
                                            ),
                                          )));
                                },
                              );
                      })
                  : const Center(
                      child: Text(
                      "No Internet Connection",
                      style: TextStyle(
                        fontSize: 20,
                        color: greyCOLOR,
                      ),
                    ));
            },
          ),
        ));
  }
}
