import 'dart:developer';

import 'package:dazzle/controller/base_controlle.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../services/ads_service.dart';

class FullPageAdsController extends BaseControlle {
  bool isFullPageAdsLoaded = false;

  late InterstitialAd fullPageAd;

  void loadFullPageAds() async {
    try {
      await InterstitialAd.load(
        adUnitId: AdsService.fullPageAdsId(),
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            log("full page ads loaded");
            fullPageAd = ad;
            isFullPageAdsLoaded = true;
            update();
            fullPageAd.fullScreenContentCallback = FullScreenContentCallback(
              onAdDismissedFullScreenContent: (ad) {
                fullPageAd.dispose();
              },
              onAdFailedToShowFullScreenContent: (ad, error) {
                fullPageAd.dispose();
              },
            );
          },
          onAdFailedToLoad: (error) {
            log("full page ads failed to load: $error");
            isFullPageAdsLoaded = false;
            update();
          },
        ),
      );
      update();
    } catch (e) {
      //print(e);
    }
  }

  @override
  void onInit() {
    loadFullPageAds();
    super.onInit();
  }
}
