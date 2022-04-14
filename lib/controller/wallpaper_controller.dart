import 'package:dazzle/controller/base_controlle.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class WallpaperController extends BaseControlle {
  Future<void> downloadWallpaper(String url) async {
    var file = await DefaultCacheManager().getSingleFile(url);
    print(file.path);
  }
}
