import 'dart:developer';
import 'package:dazzle/controller/base_controlle.dart';
import 'package:dazzle/services/ads_service.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class FavGridViewAdsController extends BaseControlle {
  bool isFavGridViewAdsLoaded = false;
  late NativeAd favGridViewAd;

  void loadFavGridViewAds() async {
    try {
      favGridViewAd = NativeAd(
        request: const AdRequest(),
        adUnitId: AdsService.favGridViewAdsId(),
        factoryId: 'listTile',
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            log("fav gridview ads loaded");
            isFavGridViewAdsLoaded = true;
            update();
          },
          onAdClosed: (ad) {
            ad.dispose();
            isFavGridViewAdsLoaded = false;
            update();
          },
          onAdFailedToLoad: (ad, error) {
            log("fav gridview ads failed to load: $error");
            isFavGridViewAdsLoaded = false;
            update();
          },
        ),
      );
      await favGridViewAd.load();
      update();
    } catch (e) {
      //print(e);
    }
  }

  @override
  void onInit() {
    loadFavGridViewAds();
    super.onInit();
  }
}
