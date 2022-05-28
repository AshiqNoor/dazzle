import 'dart:developer';
import 'package:dazzle/controller/base_controlle.dart';
import 'package:dazzle/services/ads_service.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class DownloadAdsController extends BaseControlle {
  bool isDownloadAdsLoaded = false;
  late BannerAd downloadBanner;

  void loadDownloadAds() async {
    try {
      downloadBanner = BannerAd(
        adUnitId: AdsService.downloaAdsId(),
        size: AdSize.banner,
        request: const AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            log("download ads loaded");
            isDownloadAdsLoaded = true;
            update();
          },
          onAdClosed: (ad) {
            ad.dispose();
            isDownloadAdsLoaded = false;
            update();
          },
          onAdFailedToLoad: (ad, error) {
            log("download ads failed to load: $error");
            isDownloadAdsLoaded = false;
            update();
          },
        ),
      );
      await downloadBanner.load();
      update();
    } catch (e) {
      //print(e);
    }
  }

  @override
  void onInit() {
    loadDownloadAds();
    super.onInit();
  }
}
