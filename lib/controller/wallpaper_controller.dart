import 'package:dazzle/controller/download_controller.dart';
import 'package:dazzle/view/utils/constant/const.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:get/get.dart';

class WallpaperController extends DownloadController {
  Future<void> downloadWallpaper(String url) async {
    // Get the file from the url
    var file = await DefaultCacheManager().getSingleFile(url);
    //save the file and url to the Hive or database
    getimagepath(url: url, path: file.path);
    Get.showSnackbar(
      const GetSnackBar(
        title: successMessage,
        message: downloadedMessage,
        duration: Duration(seconds: snakbarDuration),
      ),
    );
  }

  Future<File> cacheWallpaper(String url) async {
    var file = await DefaultCacheManager().getSingleFile(url);
    return file;
  }

  Future<void> setScreen(
      {String? url,
      String? name,
      String? imgpath,
      bool? download,
      bool? search}) async {
    //if i came from download page only need imagepath
    if (download!) {
      switch (name) {
        case homeScreen:
          await setHomeScreen(imgpath!);
          break;
        case lockScreen:
          await setLockScreen(imgpath!);
          break;
        case bothScreen:
          await setBothScreen(imgpath!);
          break;
      }
    }
    //if i came from homepage or fevorite page only need url
    else {
      var filepath = await cacheWallpaper(url!);
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
  }

  Future<void> setHomeScreen(String path) async {
    //print("Home Screen");
    try {
      await WallpaperManager.setWallpaperFromFile(
          path, WallpaperManager.HOME_SCREEN);
      Get.showSnackbar(
        const GetSnackBar(
          title: doneMessage,
          message: homeMessage,
          duration: Duration(seconds: snakbarDuration),
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
          title: doneMessage,
          message: lockMessage,
          duration: Duration(seconds: snakbarDuration),
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
          title: doneMessage,
          message: bothMessage,
          duration: Duration(seconds: snakbarDuration),
        ),
      );
    } catch (e) {
      // print(e);
    }
  }
}
