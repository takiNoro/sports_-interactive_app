import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_interactive_app/model/page_model.dart';
import 'package:sports_interactive_app/pages/ranking/ranking_model.dart';
import 'package:sports_interactive_app/pages/ranking/ranking_view_model.dart';
import 'package:sports_interactive_app/pages/top/top_page.dart';

import '../../Extension/ExtensionCustomClipper.dart';
import '../../Util/PageViewModel.dart';
import '../../Util/util.dart';
import '../../asset.dart';
import '../../const.dart';
import '../../customColor.dart';
import '../../osc/osc.dart';
import '../base_page.dart';
import '../score/score_page.dart';

class RankingPage extends ConsumerStatefulWidget {
  @override
  RankingPageState createState() => RankingPageState();
}

class RankingPageState extends ConsumerState<RankingPage> {
  Util util = Util();
  PageViewModel pageViewModel = PageViewModel();

  @override
  void initState() {
    super.initState();
    ref.read(rankingProvider).timerSet();
    ref.read(rankingProvider).getRanking();
  }

  @override
  Widget build(BuildContext context) {
    final _rankingProvider = ref.watch(rankingProvider);
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            body: GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Container(
                  color: Colors.lightBlueAccent,
                  child: Row(children: [
                    Container(
                      alignment: Alignment.center,
                      width: 240.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 90.h),
                          Text(
                            "TIME",
                            style: TextStyle(
                                fontFamily: "DINNextLTPro",
                                fontWeight: FontWeight.w300,
                                fontSize: 50.sp,
                                color: Colors.white),
                          ),
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white, width: 5.sp),
                              shape: BoxShape.circle,
                            ),
                            width: 150.w,
                            height: 150.w,
                            child: Text(
                              _rankingProvider.timer.toString(),
                              style: TextStyle(
                                fontFamily: "DINNextLTPro",
                                fontWeight: FontWeight.w600,
                                fontSize: 80.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    _rankingProvider.data.isNotEmpty
                        ? Expanded(
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: 90.h, bottom: 90.h, right: 240.w),
                              color: CustomColor.blackBack,
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 10.h, right: 110.w, left: 110.w),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Text(
                                          "RANKING",
                                          style: TextStyle(
                                            fontFamily: "DINNextLTPro",
                                            fontWeight: FontWeight.w300,
                                            fontSize: 90.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child:
                                            createRank(_rankingProvider.data),
                                        // child: Column(
                                        //   children: [
                                        //     createRank(
                                        //         "1", "SS", "000,000,000"),
                                        //     createRank("2", "S", "000,000,000"),
                                        //     createRank("3", "A", "000,000,000"),
                                        //     createRank("4", "B", "000,000,000"),
                                        //     createRank("5", "C", "000,000,000"),
                                        //   ],
                                        // ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.bottomCenter,
                                          child: ClipPath(
                                              clipper: ParallelogramClipper(
                                                  1020.w,
                                                  347.h,
                                                  util.parallelogramOffset(
                                                      347.h, 30)),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () {
                                                  pageViewModel
                                                      .navigateNextPage(
                                                          Consts.pathTop);
                                                  _rankingProvider.oscPageSend(
                                                      PageIndex.top);
                                                },
                                                child: Container(
                                                  width: 1020.w,
                                                  height: 347.h,
                                                  child: Image.asset(
                                                    Asset.imagePath(
                                                        "btn_newgame_tab.png"),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ]),
                ))));
  }

  Widget createRank(List<RankingData> data) {
    List<Widget> column = [];
    data.asMap().forEach((int i, RankingData value) {
      print("${i},${value.rank},${value.score},");
      column.add(createRankColumn((i+1).toString(), value.rank, value.score));
    });
    return Column(
      children: column,
    );
  }

  Widget createRankColumn(String ranknum, String rank, String score) {
    return Container(
      padding: EdgeInsets.only(top: 50.h, bottom: 10.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white,
            width: 3.h,
          ),
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            ranknum,
            style: TextStyle(
              fontFamily: "DINNextLTPro",
              fontWeight: FontWeight.w300,
              fontSize: 135.sp,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 200.w,
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            rank,
            style: TextStyle(
              fontFamily: "DINNextLTPro",
              fontWeight: FontWeight.w300,
              fontSize: 100.sp,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 200.w,
        ),
        Expanded(
            child: Container(
          alignment: Alignment.centerRight,
          child: Text(
            score,
            style: TextStyle(
              fontFamily: "DINNextLTPro",
              fontWeight: FontWeight.w300,
              fontSize: 110.sp,
              color: Colors.white,
            ),
          ),
        )),
      ]),
    );
  }
}
