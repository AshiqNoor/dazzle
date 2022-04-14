import 'package:dazzle/controller/download_controller.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:get/get.dart';

class WallpaperController extends DownloadController {
  Future<void> downloadWallpaper(String url) async {
    var file = await DefaultCacheManager().getSingleFile(url);
    await getimagepath(url: url, path: file.path);
    Get.showSnackbar(
      const GetSnackBar(
        title: 'Download Success',
        message: 'Image Downloaded',
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> setHomeScreen(String url) async {
    var filepath = await cacheWallpaper(url);
    await homeScreen(filepath.path);
    Get.showSnackbar(
      const GetSnackBar(
        title: 'Done',
        message: 'Apply on Home Screen',
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> setLockScreen(String url) async {
    var filepath = await cacheWallpaper(url);
    await lockScreen(filepath.path);
    Get.showSnackbar(
      const GetSnackBar(
        title: 'Done',
        message: 'Apply on Lock Screen',
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> setBothScreen(String url) async {
    var filepath = await cacheWallpaper(url);
    await homeAndlockScreen(filepath.path);
    Get.showSnackbar(
      const GetSnackBar(
        title: 'Done',
        message: 'Apply on Both Screen',
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> homeScreen(String path) async {
    await WallpaperManager.setWallpaperFromFile(
        path, WallpaperManager.HOME_SCREEN);
  }

  Future<void> lockScreen(String path) async {
    await WallpaperManager.setWallpaperFromFile(
        path, WallpaperManager.LOCK_SCREEN);
  }

  Future<void> homeAndlockScreen(String path) async {
    await WallpaperManager.setWallpaperFromFile(
        path, WallpaperManager.BOTH_SCREEN);
  }

  Future<File> cacheWallpaper(String url) async {
    var file = await DefaultCacheManager().getSingleFile(url);
    return file;
  }
}
