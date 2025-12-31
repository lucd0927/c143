import 'dart:async';

import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_views/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainHighLightTips extends StatefulWidget {
  const MainHighLightTips({super.key});

  @override
  State<MainHighLightTips> createState() => _MainHighLightTipsState();
}

class _MainHighLightTipsState extends State<MainHighLightTips> {
  Offset _offset = Offset(0, -360.h);
  List<String> txts = [
    "HIGH-EARNING WINDOW ONLY 12 MINUTES LEFT! ⏰💸",
    "High-Reward Window Ends in 12 Mins!",
    "You’re Racing for Today’s Earnings Leaderboard!",
    "Ad Rewards +150% This Session!",
    "Tree-Planting with 14345 Players!",
    "Stably Running for 896 Days!",
    "2,000 New Winners Every Week!",
  ];

  Timer? _timer;

  initTimer(){
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: 3000), (){
      _timer?.cancel();
      MainTreeController.to.overlayPortalController.hide();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    txts.shuffle();
    _offset = Offset(0, 1);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _offset = Offset.zero;
        });
      }
    });
    initTimer();
  }




  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          bottom: 120.h,
          child: GestureDetector(
            onTap: () {
              MainTreeController.to.overlayPortalController.hide();
            },
            child: Center(
              child: AnimatedSlide(
                offset: _offset,
                duration: Duration(milliseconds: 500),
                child: Center(
                  child: Container(
                    width: 284.w,
                    height: 68.h,
                    color: Colors.red.withValues(alpha: 0),
                    child: Stack(
                      children: [
                        ShiningEffect(
                          duration: Duration(milliseconds: 2000),
                          shineColor: Color(0xffffffff),
                          opacity: 1,
                          angle: -0.1,
                          topLeft: false,
                          child: Image.asset(
                            Assets.twimg.mainLuckytips.path,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),

                        Center(
                          child: Text(
                            txts[0],
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff5B2108),
                            ),
                            textAlign:TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
  }
}
