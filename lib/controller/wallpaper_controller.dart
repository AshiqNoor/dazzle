import 'package:dazzle/controller/download_controller.dart';
import 'package:dazzle/view/utils/constant/const.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:get/get.dart';

class WallpaperController extends DownloadController {
  Future<void> downloadWallpaper(String url) async {
    var file = await DefaultCacheManager().getSingleFile(url);
    getimagepath(url: url, path: file.path);
    Get.showSnackbar(
      const GetSnackBar(
        title: 'Download Success',
        message: 'Image Downloaded',
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<File> cacheWallpaper(String url) async {
    var file = await DefaultCacheManager().getSingleFile(url);
    return file;
  }

  Future<void> setScreen(String url, String name) async {
    var filepath = await cacheWallpaper(url);
    switch (name) {
      case homeScreen:
        await setHomeScreen(filepath.path);
        break;
      case lockScreen:
        await setLockScreen(filepath.path);
        break;
      case bothScreen:
        await setBothScreen(filepath.path);
        break;
    }
  }

  Future<void> setHomeScreen(String path) async {
    //print("Home Screen");
    try {
      await WallpaperManager.setWallpaperFromFile(
          path, WallpaperManager.HOME_SCREEN);
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Done',
          message: 'Apply on Home Screen',
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      // print(e);
    }
  }

  Future<void> setLockScreen(String path) async {
    // print("Lock Screen");
    try {
      await WallpaperManager.setWallpaperFromFile(
          path, WallpaperManager.LOCK_SCREEN);
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Done',
          message: 'Apply on Lock Screen',
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      // print(e);
    }
  }

  Future<void> setBothScreen(String path) async {
    //print("Both Screen");
    try {
      await WallpaperManager.setWallpaperFromFile(
          path, WallpaperManager.BOTH_SCREEN);
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Done',
          message: 'Apply on Both Screen',
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      // print(e);
    }
  }
}
