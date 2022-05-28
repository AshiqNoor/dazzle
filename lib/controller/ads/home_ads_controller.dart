import 'dart:developer';
import 'package:dazzle/controller/base_controlle.dart';
import 'package:dazzle/services/ads_service.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomePageAdsController extends BaseControlle {
  bool isHomepageAdsLoaded = false;
  late BannerAd homepageBanner;

  void loadHomepageAds() async {
    try {
      homepageBanner = BannerAd(
        adUnitId: AdsService.homepageAdsId(),
        size: AdSize.banner,
        request: const AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            log("homepage ads loaded");
            isHomepageAdsLoaded = true;
            update();
          },
          onAdClosed: (ad) {
            ad.dispose();
            isHomepageAdsLoaded = false;
            update();
          },
          onAdFailedToLoad: (ad, error) {
            log("homepage ads failed to load: $error");
            isHomepageAdsLoaded = false;
            update();
          },
        ),
      );
      await homepageBanner.load();
      update();
    } catch (e) {
      //print(e);
    }
  }

  @override
  void onInit() {
    loadHomepageAds();

    super.onInit();
  }
}
