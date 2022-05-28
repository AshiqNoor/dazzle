import 'dart:developer';
import 'package:dazzle/controller/base_controlle.dart';
import 'package:dazzle/services/ads_service.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GridViewAdsController extends BaseControlle {
  bool isGridViewAdsLoaded = false;
  late NativeAd gridViewAd;

  void loadGridViewAds() async {
    try {
      gridViewAd = NativeAd(
        request: const AdRequest(),
        adUnitId: AdsService.gridViewAdsId(),
        factoryId: 'listTile',
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            log("grid view ads loaded");
            isGridViewAdsLoaded = true;
            update();
          },
          onAdClosed: (ad) {
            ad.dispose();
            isGridViewAdsLoaded = false;
            update();
          },
          onAdFailedToLoad: (ad, error) {
            log("grid view ads failed to load: $error");
            isGridViewAdsLoaded = false;
            update();
          },
        ),
      );
      await gridViewAd.load();
      update();
    } catch (e) {
      //print(e);
    }
  }

  @override
  void onInit() {
    loadGridViewAds();
    super.onInit();
  }
}
