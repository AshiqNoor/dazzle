import 'package:dazzle/model/wallpaper.dart';
import 'package:dazzle/view/screen/wallpaper_view.dart';
import 'package:dazzle/view/utils/helper/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShareGridWidget extends StatelessWidget {
  final List<Wallpaper> wallpaper;
  const ShareGridWidget({
    Key? key,
    required this.wallpaper,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 2 / 3.2,
        ),
        itemCount: wallpaper.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(() => WallpaperView(wallpaper: wallpaper[index]));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: pinkcolor,
                ),
                child: Hero(
                  tag: wallpaper[index].urls.regular,
                  child: Image.network(
                    wallpaper[index].urls.regular,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
