import 'package:dazzle/controller/base_controlle.dart';
import 'package:dazzle/model/wallpaper.dart';
import 'package:dazzle/services/rest_api.dart';
import 'package:dazzle/view/utils/constant/const.dart';

class HomeController extends BaseControlle {
  final _restobj = RestApi();
  List<Wallpaper> todaylist = [];
  List<Wallpaper> popularlist = [];
  List<Wallpaper> oldestlist = [];

  getListofToday() async {
    todaylist = await _restobj
        .convertJsonToObject(api + "&page=${1}" + "&order_by=latest");
  }

  Future<void> getListofPopular() async {
    popularlist = await _restobj
        .convertJsonToObject(api + "&page=${1}" + "&order_by=popular");
  }

  Future<void> getListofOldest() async {
    oldestlist =
        await _restobj.convertJsonToObject(api + "&page=${1}&order_by=oldest");
  }

  void getList() async {
    setstate(true);
    await getListofToday();
    await getListofPopular();
    await getListofOldest();
    setstate(false);
  }

  @override
  void onInit() {
    getList();
    {
      super.onInit();
    }
  }
}
