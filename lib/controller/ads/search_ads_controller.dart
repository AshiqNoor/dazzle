import 'dart:developer';
import 'package:dazzle/controller/base_controlle.dart';
import 'package:dazzle/services/ads_service.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SearchAdsController extends BaseControlle {
  bool isSearchAdsLoaded = false;

  late BannerAd searchBanner;

  void loadSearchAds() async {
    try {
      searchBanner = BannerAd(
        adUnitId: AdsService.searchAdsId(),
        size: AdSize.banner,
        request: const AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            log("search ads loaded");
            isSearchAdsLoaded = true;
            update();
          },
          onAdClosed: (ad) {
            ad.dispose();
            isSearchAdsLoaded = false;
            update();
          },
          onAdFailedToLoad: (ad, error) {
            log("search ads failed to load: $error");
            isSearchAdsLoaded = false;
            update();
          },
        ),
      );
      await searchBanner.load();
      update();
    } catch (e) {
      //print(e);
    }
  }

  @override
  void onInit() {
    loadSearchAds();

    super.onInit();
  }
}
