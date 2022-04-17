import 'package:get/get.dart';

class BaseControlle extends GetxController {
  bool _state = false;
  bool get state => _state;
  void setstate(bool value) {
    _state = value;
    update();
  }

  int currentIndex = 0;
  void setCurrentIndex(int val) {
    currentIndex = val;
    update();
  }
}
