import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_interactive_app/pages/base_page.dart';

import '../../Util/PageViewModel.dart';
import '../../const.dart';
import '../../model/page_model.dart';
import '../../osc/osc.dart';
import '../difficulty_select/difficulty_page.dart';

class TopPage extends BasePage {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _oscModelProvider = ref.watch(oscModelProvider);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: Center(
                child: AnimatedOpacity(
                  // If the Widget should be visible, animate to 1.0 (fully visible). If
                  // the Widget should be hidden, animate to 0.0 (invisible).
                  opacity: 1.0,
                  duration: Duration(milliseconds: 500),
                  // The green box needs to be the child of the AnimatedOpacity
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            width: 1166.w,
                            height: 638.h,
                            child:
                                Image.asset("assets/images/img_title_tab.png")),
                        SizedBox(
                          height: 299.h,
                        ),
                        Text(
                          "タッチしてスタート",
                          style: TextStyle(
                            fontFamily: 'NotoSansMonoCJKjp',
                            fontWeight: FontWeight.w600,
                            fontSize: 70.sp,
                            // color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () {
                pageViewModel.navigateNextPage(Consts.pathDifficulty);
                _oscModelProvider.oscPageSend(PageIndex.difficulty);
              })),
    );
  }
}
