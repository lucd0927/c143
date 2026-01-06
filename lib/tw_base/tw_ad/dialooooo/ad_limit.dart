import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:c143/tw_base/tw_dialoggg/base_dialog.dart';


showAdLimitDialog(
  BuildContext context, {
  required VoidCallback onBtn,
  required VoidCallback onClose,
}) {
  // PBMaiDian.ad_limit_pop();
  return twBaseDialogC143(
    context: context,
    child: AdCishuLimit(
      onClose: () {
        onClose();
      },
      onBtn: () {
        onBtn();
      },
    ),
  );
}

class AdCishuLimit extends StatefulWidget {
  const AdCishuLimit({super.key, required this.onClose, required this.onBtn});

  final VoidCallback onClose;
  final VoidCallback onBtn;

  @override
  State<AdCishuLimit> createState() => _AdCishuLimitState();
}

class _AdCishuLimitState extends State<AdCishuLimit> {
  int index = 0;
  bool showStep2 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
      child: IndexedStack(
        index: index,
        children: [
          GestureDetector(
            onTap: () {},
            child: Stack(
              children: [
                Container(
                  // color: Colors.amber,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(height: 200.h),
                      content(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  content() {
    return Container(
      width: 340.w,
      height: 380.h,
      decoration: BoxDecoration(
        color: Color(0xff992D2E),
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.h),
          Stack(
            children: [
              Container(
                width: double.infinity,
                // color: Colors.amber,
                height: 60.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ad Limit reached",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xffffffff),
                        fontSize: 20.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 20.w,
                bottom: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    widget.onClose();
                  },
                  // child: Image.asset(
                  //   Assets.tupian.guide12Close.path,
                  //   width: 40.h,
                  //   height: 40.h,
                  //   color: Color(0xffffffff),
                  // ),
                  child: Container(
                    width: 40.h,
                    height: 40.h,
                    color: Colors.cyan.withValues(alpha: 0),
                    child: Icon(Icons.close,color: Colors.white,),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Container(
                width: 320.w,
                height: 330.h,
                decoration: BoxDecoration(
                  color: Color(0xffFBFBFF),
                  borderRadius: BorderRadius.circular(16.w),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 40.h),
                    Stack(
                      children: [
                        Container(
                          width: 120.h,
                          height: 120.h,
                          color: Colors.cyan.withValues(alpha: 0),
                          child: Center(child: Icon(Icons.production_quantity_limits,size: 120.h,),),
                        ),
                        // Image.asset(
                        //   Assets.tupian.adLimit.path,
                        //   width: 288.h,
                        //   height: 288.h,
                        //   fit: BoxFit.contain,
                        // ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Center(
                      child: Text(
                        "You've watched all available ads for today. Try again tomorrow.",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          color: Color(0xff992D2D),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            widget.onBtn();
                          },
                          child: Container(
                            width: 200.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: Color(0xff2d980f).withValues(alpha: 1),
                              borderRadius: BorderRadius.circular(16.w),
                              border: Border.all(
                                color: Color(0xffbed01e),
                                width: 2.w,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Text(
                                    "Try Again",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20.sp,
                                      // foreground: Color(0xffD0871E),
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
