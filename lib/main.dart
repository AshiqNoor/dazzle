import 'package:dazzle/model/urls.dart';
import 'package:dazzle/model/wallpaper.dart';
import 'package:dazzle/view/utils/constant/const.dart';
import 'package:dazzle/view/utils/helper/color_helper.dart';
import 'package:dazzle/view/widgets/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  await Hive.initFlutter();
  Hive.registerAdapter(UrlsAdapter());
  Hive.registerAdapter(WallpaperAdapter());
  await Hive.openBox<Wallpaper>(favoriteHiveBox);
  await Hive.openBox<String>(downloadHiveBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dazzle Wallpaper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: purpleCOLOR,
      ),
      home: const BaseView(),
    );
  }
}
