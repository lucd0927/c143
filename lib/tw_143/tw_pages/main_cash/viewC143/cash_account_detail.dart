import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_pages/main_cash/main_cash_controller.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_gj/countryC143.dart';
import 'package:c143/tw_base/tw_gj/number_extend.dart';
import 'package:c143/tw_views/animated_count.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class CashAccountDetail extends StatefulWidget {
  const CashAccountDetail({super.key});

  @override
  State<CashAccountDetail> createState() => _CashAccountDetailState();
}

class _CashAccountDetailState extends State<CashAccountDetail> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool show = MainCashController.to.showMoneyHeorJson.value;
      double curMonnn = MainTreeController.to.curMoneyyyy.value;
      String? data = MainTreeController.to.guide7CashoutData();
      if (data == null) {
        curMonnn = 0;
      }
      double lfettt = MainTreeController.to.leftMonn1();
      if (MainCashController.to.hasSaveCardIddddC143()) {
        lfettt = MainTreeController.to.leftMonn2();
      }
      bool hasSsss = MainCashController.to.hasSaveCardIddddC143();
      String icon = MainCashController.to.payBgCash();
      return Container(
        width: 320.w,
        height: 176.h,
        child: Stack(
          children: [
            Image.asset(
              icon,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
              gaplessPlayback: true,
            ),
            Positioned.fill(
              child: Column(
                children: [
                  Container(
                    height: 118.h,
                    width: double.infinity,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "My Account",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp,
                            color: hasSsss
                                ? Color(0xffB7905B)
                                : Color(0xff99C2EA),
                          ),
                        ),
                        TwAnimatedCountttt(
                          value: curMonnn,
                          prefix: TwCountryyC143.curCountryyyySymbolC143(),
                          fractionDigits: 2,
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 36.sp,
                            color: hasSsss
                                ? Color(0xffB7905B)
                                : Color(0xffffffff),
                          ),
                        ),

                        // Text(
                        //   "${TwCountryyC143.curCountryyyySymbolC143()}${curMonnn.toStringAsFixed(2)}",
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.w700,
                        //     fontSize: 36.sp,
                        //     color: hasSsss
                        //         ? Color(0xffB7905B)
                        //         : Color(0xffffffff),
                        //   ),
                        // ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 4.h,
                            horizontal: 8.w,
                          ),
                          width: 200.w,
                          decoration: BoxDecoration(
                            color: Color(0xffFFD608),
                            borderRadius: BorderRadius.circular(100.h),
                          ),
                          child: Center(
                            child: Text.rich(
                              TextSpan(
                                text: "Only  ",
                                children: [
                                  WidgetSpan(
                                    child: TwAnimatedCountttt(
                                      value: lfettt,
                                      prefix:
                                          TwCountryyC143.curCountryyyySymbolC143(),
                                      fractionDigits: 2,
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14.sp,
                                        height: 1,
                                        color: hasSsss
                                            ? Color(0xffe30b0b)
                                            : Color(0xffe30b0b),
                                      ),
                                    ),
                                  ),
                                  TextSpan(text: "  Left!"),
                                ],
                              ),
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp,
                                height: 1,
                                color: hasSsss
                                    ? Color(0xffB7905B)
                                    : Color(0xffAA1F00),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.yellow.withValues(alpha: 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Earned",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: hasSsss
                                      ? Color(0xffB7905B)
                                      : Color(0xff99C2EA),
                                ),
                              ),
                              TwAnimatedCountttt(
                                value: curMonnn,
                                prefix:
                                    TwCountryyC143.curCountryyyySymbolC143(),
                                fractionDigits: 2,
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: hasSsss
                                      ? Color(0xffB7905B)
                                      : Color(0xffffffff),
                                ),
                              ),
                              // Text(
                              //   "${TwCountryyC143.curCountryyyySymbolC143()}${curMonnn.toStringAsFixed(2)}",
                              //   style: TextStyle(
                              //     fontWeight: FontWeight.w500,
                              //     fontSize: 16.sp,
                              //     color: hasSsss
                              //         ? Color(0xffB7905B)
                              //         : Color(0xffffffff),
                              //   ),
                              // ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Pending",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: hasSsss
                                      ? Color(0xffB7905B)
                                      : Color(0xff99C2EA),
                                ),
                              ),

                              TwAnimatedCountttt(
                                value: lfettt,
                                prefix:
                                    TwCountryyC143.curCountryyyySymbolC143(),
                                fractionDigits: 2,
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: Color(0xffe30b0b),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
