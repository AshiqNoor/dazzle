import 'package:dazzle/controller/ads/gridview_ads_controller.dart';
import 'package:dazzle/model/result.dart';
import 'package:dazzle/model/wallpaper.dart';
import 'package:dazzle/view/screen/wallpaper_view.dart';
import 'package:dazzle/view/utils/constant/const.dart';
import 'package:dazzle/view/utils/share/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

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
    return GetBuilder<GridViewAdsController>(
      init: GridViewAdsController(),
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
                  //Native ads
                  if (c.isGridViewAdsLoaded && index == nativeAdsCount) {
                    return Container(
                      child: AdWidget(ad: c.gridViewAd),
                      alignment: Alignment.center,
                      height: nativeAdsHEIGHT,
                      //color: redCOLOR.withOpacity(0.2),
                    );
                  } else {
                    return Material(
                      elevation: 5,
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => WallpaperView(
                                wallpaper1:
                                    isSearch! ? wallpaper1![index] : null,
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
                  }
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
