import 'package:dazzle/view/utils/helper/color_helper.dart';
import 'package:dazzle/view/utils/helper/style_helper.dart';
import 'package:flutter/material.dart';

class DownloadView extends StatelessWidget {
  const DownloadView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Download',
          style: title1,
        ),
        centerTitle: true,
        backgroundColor: whitecolor,
        elevation: 0,
      ),
      body: const Center(child: Text("Empty List")),
    );
  }
}
