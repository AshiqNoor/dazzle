import 'package:dazzle/controller/ads/search_ads_controller.dart';
import 'package:dazzle/controller/search_controller.dart';
import 'package:dazzle/view/utils/constant/const.dart';
import 'package:dazzle/view/utils/helper/color_helper.dart';
import 'package:dazzle/view/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../utils/share/progress_indicator.dart';
import '../utils/share/share_grid_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key, required this.isConnectivity}) : super(key: key);
  final bool isConnectivity;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return GetBuilder<SearchController>(
        init: SearchController(),
        builder: (c) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: appBarCOLOR,
                elevation: elevationNo,
                title: SearchBar(
                  width: _width,
                  onSubmit: (String value) {
                    c.getListofSearch();
                  },
                  textcontroller: c.textcontroller,
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          color: bodyCOLOR,
                          child: RefreshIndicator(
                              onRefresh: () async {
                                await c.getListofSearch();
                              },
                              child: isConnectivity
                                  ? c.textcontroller.text.isEmpty
                                      ? Container()
                                      : c.searchlist.isEmpty
                                          ? const Center(
                                              child: Text(searchResult))
                                          : c.state
                                              ? const Center(
                                                  child: ProgIndicator(
                                                  indicator: Indicator
                                                      .ballSpinFadeLoader,
                                                ))
                                              : ShareGridWidget(
                                                  scrollController:
                                                      c.searchcontroller,
                                                  isLoading: c.isloading,
                                                  fromsearch: c.searchlist,
                                                  isSearch: true,
                                                )
                                  : const Center(
                                      child: Text(
                                      noConnection,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: greyCOLOR,
                                      ),
                                    ))),
                        ),
                        // Search Page Ads
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GetBuilder<SearchAdsController>(
                                init: SearchAdsController(),
                                builder: (c) {
                                  if (c.isSearchAdsLoaded) {
                                    return SizedBox(
                                        height: c.searchBanner.size.height
                                            .toDouble(),
                                        //color: bodyCOLOR.withOpacity(0.2),
                                        child: AdWidget(
                                          ad: c.searchBanner,
                                        ));
                                  } else {
                                    return Container(
                                      height: 0,
                                    );
                                  }
                                }),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ));
        });
  }
}
