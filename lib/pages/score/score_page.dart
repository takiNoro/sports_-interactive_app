import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_interactive_app/model/page_model.dart';
import 'package:sports_interactive_app/pages/score/score_view_model.dart';

import '../../Extension/ExtensionCustomClipper.dart';
import '../../Util/PageViewModel.dart';
import '../../Util/util.dart';
import '../../asset.dart';
import '../../const.dart';
import '../../customColor.dart';
import '../../osc/osc.dart';
import '../base_page.dart';
import '../ranking/ranking_page.dart';

class ScorePage extends ConsumerStatefulWidget {
  @override
  ScorePageState createState() => ScorePageState();
}

class ScorePageState extends ConsumerState<ScorePage> {
  Util util = Util();
  PageViewModel pageViewModel = PageViewModel();

  @override
  void initState() {
    super.initState();
    ref.read(scoreProvider).getScore();
    ref.read(scoreProvider).timerSet();
  }

  @override
  Widget build(BuildContext context) {
    final _scoreProvider = ref.watch(scoreProvider);
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: Container(
            color: Colors.lightBlueAccent,
            child: Row(
              children: [
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
                          border: Border.all(color: Colors.white, width: 5.sp),
                          shape: BoxShape.circle,
                        ),
                        width: 150.w,
                        height: 150.w,
                        child: Text(
                          _scoreProvider.timer.toString(),
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
                _scoreProvider.data != null
                    ? Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                              top: 90.h, bottom: 90.h, right: 240.w),
                          color: CustomColor.blackBack,
                          child: Center(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      top: 100.h, bottom: 100.h),
                                  child: Text(
                                    "SCORE",
                                    style: TextStyle(
                                        fontFamily: "DINNextLTPro",
                                        fontWeight: FontWeight.w300,
                                        fontSize: 88.sp,
                                        color: Colors.white),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      right: 200.w, left: 200.w),
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 5.sp),
                                        ),
                                        width: 500.w,
                                        height: 500.h,
                                        alignment: Alignment.center,
                                        child: Container(
                                          padding: EdgeInsets.only(top: 10.h),
                                          child: Image.asset(
                                            Asset.imagePath(
                                                _scoreProvider.data!.rankImage),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(left: 100.w),
                                        child: Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                _scoreProvider.data!.score,
                                                style: TextStyle(
                                                  fontFamily: "DINNextLTPro",
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 140.sp,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 70.h, bottom: 70.h),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "COMBO",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "DINNextLTPro",
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 66.sp,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 50.w,
                                                  ),
                                                  Text(
                                                    _scoreProvider.data!.combo,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "DINNextLTPro",
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 66.sp,
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "STRIKE",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "DINNextLTPro",
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 54.sp,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Text(
                                                        "CRITICAL",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "DINNextLTPro",
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 54.sp,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      _scoreProvider
                                                          .data!.strike,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "DINNextLTPro",
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 54.sp,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      _scoreProvider
                                                          .data!.critical,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "DINNextLTPro",
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 54.sp,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 80.w,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "BALL",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "DINNextLTPro",
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 54.sp,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      _scoreProvider.data!.ball,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "DINNextLTPro",
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 54.sp,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )),
                                          ],
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(left: 200.w, top: 130.h),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "パーフェクトです！次回はより難しいモードにチャレンジしてみましょう。",
                                    style: TextStyle(
                                      fontFamily: "NotoSansMonoCJKjp",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 44.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(bottom: 50.h),
                                    alignment: Alignment.bottomCenter,
                                    child: ClipPath(
                                        clipper: ParallelogramClipper(
                                            1020.w,
                                            347.h,
                                            util.parallelogramOffset(
                                                347.h, 30)),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () {
                                            pageViewModel.navigateNextPage(
                                                Consts.pathRank);
                                            _scoreProvider
                                                .oscPageSend(PageIndex.rank);
                                          },
                                          child: Container(
                                            width: 1020.w,
                                            height: 347.h,
                                            child: Image.asset(
                                              Asset.imagePath(
                                                  "btn_rank_tab.png"),
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
                      )
                    : Container(),
              ],
            ),
          ),
        ));
  }
}
