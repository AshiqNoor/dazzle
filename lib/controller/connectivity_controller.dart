import 'dart:async';
import 'package:dazzle/view/utils/constant/const.dart';
import 'package:dazzle/view/utils/helper/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dazzle/controller/base_controlle.dart';
import 'package:flutter/cupertino.dart';

class ConnectivityController extends BaseControlle {
  late StreamSubscription connectivitySubscription;

  void getConnectivityType(connectivityResult) {
    switch (connectivityResult) {
      case ConnectivityResult.mobile:
        setConnectivity(true);
        update();
        Get.showSnackbar(
          const GetSnackBar(
            backgroundGradient: LinearGradient(
              colors: [lightCyanCOLOR, lightBlueCOLOR],
            ),
            message: mobileConnected,
            duration: Duration(seconds: snakbarDuration),
          ),
        );
        break;
      case ConnectivityResult.wifi:
        setConnectivity(true);
        update();
        Get.showSnackbar(
          const GetSnackBar(
            backgroundGradient: LinearGradient(
              colors: [lightCyanCOLOR, lightBlueCOLOR],
            ),
            message: wifiConnected,
            duration: Duration(seconds: snakbarDuration),
          ),
        );
        break;
      case ConnectivityResult.none:
        setConnectivity(false);
        update();
        Get.showSnackbar(
          const GetSnackBar(
            backgroundGradient: LinearGradient(
              colors: [lightRedCOLOR, redCOLOR],
            ),
            message: noConnection,
            duration: Duration(seconds: snakbarDuration),
          ),
        );
        break;
      default:
        break;
    }
  }

  @override
  void onInit() {
    super.onInit();
    connectivitySubscription =
        Connectivity().onConnectivityChanged.listen(getConnectivityType);
  }
}
