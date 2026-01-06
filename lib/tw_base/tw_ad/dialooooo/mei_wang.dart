import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:c143/tw_base/tw_dialoggg/base_dialog.dart';



showMeiwangDialogC143(
  BuildContext context, {
  required VoidCallback onBtn,
  required VoidCallback onClose,
}) {
  return twBaseDialogC143(
    context: context,
    child: MeiwangWidget(
      onClose: () {
        onClose();
      },
      onBtn: () {
        onBtn();
      },
    ),
  );
}

class MeiwangWidget extends StatefulWidget {
  const MeiwangWidget({super.key, required this.onClose, required this.onBtn});

  final VoidCallback onClose;
  final VoidCallback onBtn;

  @override
  State<MeiwangWidget> createState() => _MeiwangWidgetState();
}

class _MeiwangWidgetState extends State<MeiwangWidget> {
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
      width: 330.w,
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
                height: 30.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "No network currently",
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
                    SizedBox(height: 70.h),
                    Stack(
                      children: [
                        Container(
                          width: 120.h,
                          height: 120.h,
                          color: Colors.cyan.withValues(alpha: 0),
                          child: Center(child: Icon(Icons.network_check,size: 120.h,),),
                        ),
                        // Image.asset(
                        //   Assets.tupian.nonet.path,
                        //   width: 288.h,
                        //   height: 232.h,
                        //   fit: BoxFit.contain,
                        // ),
                      ],
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
                          ),
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
