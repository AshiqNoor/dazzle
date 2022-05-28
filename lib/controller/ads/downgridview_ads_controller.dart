import 'dart:developer';
import 'package:dazzle/controller/base_controlle.dart';
import 'package:dazzle/services/ads_service.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class DownGridViewAdsController extends BaseControlle {
  bool isDownGridViewAdsLoaded = false;
  late NativeAd downGridViewAd;

  void loadDownGridViewAds() async {
    try {
      downGridViewAd = NativeAd(
        request: const AdRequest(),
        adUnitId: AdsService.downGridViewAdsId(),
        factoryId: 'listTile',
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            log("download gridview ads loaded");
            isDownGridViewAdsLoaded = true;
            update();
          },
          onAdClosed: (ad) {
            ad.dispose();
            isDownGridViewAdsLoaded = false;
            update();
          },
          onAdFailedToLoad: (ad, error) {
            log("download gridview ads failed to load: $error");
            isDownGridViewAdsLoaded = false;
            update();
          },
        ),
      );
      await downGridViewAd.load();
      update();
    } catch (e) {
      //print(e);
    }
  }

  @override
  void onInit() {
    loadDownGridViewAds();
    super.onInit();
  }
}
