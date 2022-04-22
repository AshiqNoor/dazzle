import 'package:dazzle/model/wallpaper.dart';
import 'package:dazzle/view/screen/wallpaper_view.dart';
import 'package:dazzle/view/utils/helper/color_helper.dart';
import 'package:dazzle/view/utils/share/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShareGridWidget extends StatelessWidget {
  final List<Wallpaper> wallpaper;
  final ScrollController scrollController;
  final bool isLoading;
  const ShareGridWidget({
    Key? key,
    required this.wallpaper,
    required this.scrollController,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GridView.builder(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 2 / 3.03,
            ),
            itemCount: wallpaper.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(() => WallpaperView(
                        wallpaper: wallpaper[index],
                        isdownload: false,
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
          isLoading ? const ProgIndicator() : Container(),
        ],
      ),
    );
  }
}
