import 'package:dazzle/controller/base_controlle.dart';
import 'package:dazzle/model/result.dart';
import 'package:dazzle/model/wallpaper.dart';
import 'package:dazzle/view/screen/wallpaper_view.dart';
import 'package:dazzle/view/utils/constant/const.dart';
import 'package:dazzle/view/utils/share/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class ShareGridWidget extends StatelessWidget {
  final List<Wallpaper>? wallpaper;
  final List<Result>? wallpaper1;
  final ScrollController scrollController;
  final bool isLoading;
  final bool? isSearch;
  const ShareGridWidget({
    Key? key,
    this.wallpaper,
    required this.scrollController,
    required this.isLoading,
    this.wallpaper1,
    this.isSearch = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BaseControlle>(
      init: BaseControlle(),
      builder: (c) {
        return Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 0),
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
                itemCount: isSearch! ? wallpaper1!.length : wallpaper!.length,
                itemBuilder: (context, index) {
                  String imgpath = isSearch!
                      ? wallpaper1![index].urls.regular
                      : wallpaper![index].urls.regular;
                  return Material(
                    elevation: 5,
                    borderRadius: const BorderRadius.all(Radius.circular(7)),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => WallpaperView(
                              wallpaper1: isSearch! ? wallpaper1![index] : null,
                              wallpaper: isSearch! ? null : wallpaper![index],
                              isdownload: false,
                              isSearch: isSearch!,
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
      },
    );
  }
}
