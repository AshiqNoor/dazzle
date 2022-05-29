import 'package:dazzle/view/utils/constant/const.dart';
import 'package:flutter/material.dart';

class PouUpList {
  String name;
  Widget? icon;
  PouUpList({required this.name, this.icon});

  static final List<PouUpList> itemname = [
    // PouUpList(
    //     name: settingTEXT, icon: const Icon(Icons.settings_outlined, size: 18)),
    PouUpList(
        name: shareTEXT, icon: const Icon(Icons.share_outlined, size: 18)),
  ];
}
