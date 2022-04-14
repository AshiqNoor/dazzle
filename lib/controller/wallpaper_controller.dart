import 'package:dazzle/controller/download_controller.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
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
}
