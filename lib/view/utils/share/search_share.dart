import 'package:dazzle/model/result.dart';
import 'package:dazzle/view/utils/helper/color_helper.dart';
import 'package:dazzle/view/utils/share/progress_indicator.dart';
import 'package:flutter/material.dart';

class ShareGridWidget1 extends StatelessWidget {
  final List<Result> wallpaper;
  final ScrollController scrollController;
  final bool isLoading;
  ShareGridWidget1({
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
                  // Get.to(() => WallpaperView(
                  //       wallpaper: wall[index],
                  //       isdownload: false,
                  //     ));
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
