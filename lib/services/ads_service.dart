import 'dart:io';

class AdsService {
  static String homepageAdsId() {
    if (Platform.isAndroid) {
      return "ca-app-pub-3576454111268862/6676498456";
    } else {
      return "";
    }
  }

  static String downloaAdsId() {
    if (Platform.isAndroid) {
      return "ca-app-pub-3576454111268862/4962578647";
    } else {
      return "";
    }
  }

  static String favoriteAdsId() {
    if (Platform.isAndroid) {
      return "ca-app-pub-3576454111268862/4405558331";
    } else {
      return "";
    }
  }

  static String searchAdsId() {
    if (Platform.isAndroid) {
      return "ca-app-pub-3576454111268862/6840149987";
    } else {
      return "";
    }
  }

  static String gridViewAdsId() {
    if (Platform.isAndroid) {
      return "ca-app-pub-3576454111268862/1738800886";
    } else {
      return "";
    }
  }

  static String downGridViewAdsId() {
    if (Platform.isAndroid) {
      return "ca-app-pub-3576454111268862/9653019733";
    } else {
      return "";
    }
  }

  static String favGridViewAdsId() {
    if (Platform.isAndroid) {
      return "ca-app-pub-3576454111268862/4143325144";
    } else {
      return "";
    }
  }

  static String fullPageAdsId() {
    if (Platform.isAndroid) {
      return "ca-app-pub-3576454111268862/6648578299";
    } else {
      return "";
    }
  }
}
