import 'package:dazzle/model/result.dart';
import 'package:dazzle/view/utils/constant/const.dart';
import 'package:dazzle/view/utils/share/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../screen/wallpaper_view.dart';

class ShareGridWidget1 extends StatelessWidget {
  final List<Result> wallpaper;
  final ScrollController scrollController;
  final bool isLoading;
  const ShareGridWidget1({
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
          StaggeredGridView.countBuilder(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            crossAxisCount: 4,
            staggeredTileBuilder: (i) =>
                StaggeredTile.count(2, i.isOdd ? 2 : 3),
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            itemCount: wallpaper.length,
            itemBuilder: (context, index) {
              String imgpath = wallpaper[index].urls.regular;
              return Material(
                elevation: 5,
                borderRadius: const BorderRadius.all(Radius.circular(7)),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => WallpaperView(
                          wallpaper1: wallpaper[index],
                          isdownload: false,
                          isSearch: true,
                        ));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Hero(
                      tag: imgpath,
                      child: FadeInImage(
                        image: NetworkImage(
                          imgpath,
                        ),
                        fit: BoxFit.cover,
                        placeholder: const AssetImage(assetTransparen),
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
