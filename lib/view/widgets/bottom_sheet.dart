import 'package:dazzle/view/utils/helper/color_helper.dart';
import 'package:dazzle/view/utils/helper/style_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SetAsButton extends StatelessWidget {
  const SetAsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 180,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Theme.of(context).primaryColor,
        ),
        child: const Center(
          child: Text(
            "SET AS",
            style: buttons,
          ),
        ),
      ),
      onTap: () {
        showBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) => Container(
                  child: ListView(
                    children: [
                      ListTile(
                        title: const Text(
                          'Set wallpaper as :',
                          style: h1,
                        ),
                        trailing: const Icon(
                          Icons.cancel_outlined,
                          color: blackgreyColor,
                        ),
                        onTap: () {
                          Get.back();
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.home_filled),
                        onTap: () {},
                        title: const Text(
                          'Home Screen',
                          style: h1,
                        ),
                      ),
                      ListTile(
                          leading: const Icon(Icons.lock_open),
                          onTap: () {},
                          title: const Text(
                            'Lock Screen',
                            style: h1,
                          )),
                      ListTile(
                          leading: const Icon(Icons.screen_lock_portrait),
                          onTap: () {},
                          title: const Text(
                            'Home & Lock Screen',
                            style: h1,
                          )),
                    ],
                  ),
                  height: Get.height * 0.32,
                  decoration: const BoxDecoration(
                    color: whitecolor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ));
      },
    );
  }
}
