import 'dart:developer';
import 'package:dazzle/controller/base_controlle.dart';
import 'package:dazzle/services/ads_service.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class FavrouiteAdsController extends BaseControlle {
  bool isFavoriteAdsLoaded = false;
  late BannerAd favoriteBanner;

  void loadFavoriteAds() async {
    try {
      favoriteBanner = BannerAd(
        adUnitId: AdsService.favoriteAdsId(),
        size: AdSize.banner,
        request: const AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            log("favorite ads loaded");
            isFavoriteAdsLoaded = true;
            update();
          },
          onAdClosed: (ad) {
            ad.dispose();
            isFavoriteAdsLoaded = false;
            update();
          },
          onAdFailedToLoad: (ad, error) {
            log("favorite ads failed to load: $error");
            isFavoriteAdsLoaded = false;
            update();
          },
        ),
      );
      await favoriteBanner.load();
      update();
    } catch (e) {
      //print(e);
    }
  }

  @override
  void onInit() {
    loadFavoriteAds();
    super.onInit();
  }
}
