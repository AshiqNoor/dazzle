import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ShareImageService {
  static shareImageFile(String url) async {
    try {
      var uri = Uri.parse(url);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final byte = response.bodyBytes;
        final temp = await getTemporaryDirectory();
        final path = '${temp.path}/image.jpg';
        File(path).writeAsBytes(byte);
        await Share.shareFiles([path], text: "Check out this wallpaper");
      }
    } catch (e) {
      //print(e);
    }
  }
}
