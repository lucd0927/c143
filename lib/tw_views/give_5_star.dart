import 'package:c143/tw_143/tw_common/lottieeee/gesture.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_dialoggg/base_dialog.dart';
import 'package:c143/tw_base/tw_gj/apple_store.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_hive/twhiveC143.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:c143/tw_views/font_gradient_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../../gen/assets.gen.dart';

twShowFeedback(BuildContext context) async {
  return await twBaseDialogC143(
    context: context,
    child: Material(color: Colors.transparent, child: TwGive5Star()),
  );
}

class TwGive5Star extends StatelessWidget {
  const TwGive5Star({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: 50.h,
          child: Row(
            children: [
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context,false);
                },
                child: Image.asset(
                  Assets.twimgB.close2.path,
                  width: 36.h,
                  height: 36.h,
                ),
              ),
              SizedBox(width: 20.w),
            ],
          ),
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 320.w,
              height: 300.h,
              decoration: BoxDecoration(
                // gradient: LinearGradient(
                //   colors: [Color(0xffD9F4DA), Color(0xffffffff)],
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                // ),
                borderRadius: BorderRadius.circular(8.w),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 0,
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Image.asset(
                      Assets.twimgB.give5Ok.path,
                      width: 96.h,
                      height: 96.h,
                    ),
                    SizedBox(height: 28.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text.rich(
                          TextSpan(text: "Thanks For Your Feedback"),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: Color(0xffffffff),
                          ),
                        ),
                        // SizedBox(width: 4.w),
                        // Image.asset(
                        //   Assets.bbb.money.path,
                        //   width: 20.h,
                        //   height: 20.h,
                        // ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context,false);
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: 229.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: Color(0xff1cae1c),
                              borderRadius: BorderRadius.circular(80.w),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            bottom: 0.w,
                            right: 0.w,
                            left: 0,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 4.w),
                                  TwTxtBorderC143(
                                    text: "Ok",
                                    foreground: Color(0xff22431B),
                                    strokeWidth: 2.w,
                                    fontSize: 24.sp,
                                  ),
                                  SizedBox(width: 4.w),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

twShow5Star(BuildContext context) async {
  var box  = TwHive.box;
  String key = "xxxaaa5star";
  var rsult = box.get(key);
  twLooog("=====twShow5Star:$rsult==");
  var result = null;
  if(rsult == null){
    result = await twBaseDialogC143(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.8),
      child: Material(color: Colors.transparent, child: Give5Hp()),
    );
  }


  if (result == true) {
    box.put(key, true);
    MainTreeController.to.onAddMoneyyyy(5);
    await Future.delayed(Duration(milliseconds: 500));
    TwIosStore.to();
  } else  if (result == false) {
    box.put(key, false);
    await Future.delayed(Duration(milliseconds: 300));
    await twShowFeedback(Get.context!);
  }
}

class Give5Hp extends StatefulWidget {
  const Give5Hp({super.key});

  @override
  State<Give5Hp> createState() => _Give5HpState();
}

class _Give5HpState extends State<Give5Hp> {
  bool showGesture = true;
  double star = 4;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: 50.h,
          child: Row(
            children: [
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  Assets.twimgB.close2.path,
                  width: 36.h,
                  height: 36.h,
                ),
              ),
              SizedBox(width: 20.w),
            ],
          ),
        ),
        Container(
          width: 324.w,
          height: 400.h,
          decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   colors: [Color(0xffD9F4DA), Color(0xffffffff)],
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            // ),
            borderRadius: BorderRadius.circular(8.w),
          ),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              TwTxtGraBorderC143(
                text: "Give Us Good Review",
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 30.h),
              Image.asset(
                Assets.twimgB.logo2.path,
                width: 110.h,
                height: 110.h,
              ),
              SizedBox(height: 28.h),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    color: Colors.red.withValues(alpha: 0),
                    child: RatingBar(
                      initialRating: star,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      ratingWidget: RatingWidget(
                        full: _image(Assets.twimgB.give5Star.path),
                        half: _image(Assets.twimgB.give5Star.path),
                        empty: _image(Assets.twimgB.give5StarUn.path),
                      ),
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      onRatingUpdate: (rating) {
                        debugPrint("rating:$rating");
                        star = rating;
                        setState(() {
                          showGesture = false;
                        });
                        onGiveStaraaaa(context);
                      },
                    ),
                  ),
                  if (showGesture)
                    Positioned(
                      right: -50.w,
                      top: 20.h,
                      child: IgnorePointer(child: TwLottieGesture()),
                    ),
                ],
              ),
              SizedBox(height: 14.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Complete Reviews Earn",
                      children: [
                        TextSpan(
                          text: " +\$5",
                          style: TextStyle(color: Color(0xffFFE95E)),
                        ),
                      ],
                    ),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      color: Color(0xffffffff),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Image.asset(
                    Assets.twimgB.money.path,
                    width: 30.h,
                    height: 30.h,
                  ),
                ],
              ),
              SizedBox(height: 14.h),
              InkWell(
                onTap: () {
                  star = 5.0;
                  onGiveStaraaaa(context);
                },
                child: Stack(
                  children: [
                    Container(
                      width: 229.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Color(0xff43B30F),
                        borderRadius: BorderRadius.circular(80.w),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0.w,
                      right: 0.w,
                      left: 0,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 4.w),
                            TwTxtBorderC143(
                              text: "Give 5 stars",
                              foreground: Color(0xff22431B),
                              fontSize: 16.sp,
                            ),
                            SizedBox(width: 4.w),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  onGiveStaraaaa(BuildContext context) async {
    bool give5 = star >= 4;
    Navigator.pop(context, give5);
    // DtController.to.toAppStoreCommitReview();
  }

  Widget _image(String asset) {
    return Image.asset(asset, height: 46.h, width: 46.h);
  }
}
