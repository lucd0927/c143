import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:c143/tw_base/tw_dialoggg/base_dialog.dart';
import 'package:get/get.dart';

showAdFailedDialogC143(
  BuildContext context, {
  required VoidCallback onBtn,
  required VoidCallback onClose,
}) {

  return _OverlayAdFailed().show(coins: 100, onBtn: (){
    onBtn();
  }, onClose: (){
    onClose();
  });

  // PBMaiDian.ad_fail_pop();
  // return twBaseDialogggg(
  //   context: context,
  //   child: AdFailedWidget(
  //     onClose: () {
  //       onClose();
  //     },
  //     onBtn: () {
  //       onBtn();
  //     },
  //   ),
  // );
}


class _OverlayAdFailed {
  OverlayEntry? _overlayEntry;

  ///是否真正显示
  bool get isShowing => _isShowing;
  bool _isShowing = false;

  void show({
    required double coins,
    required VoidCallback onBtn,
    required VoidCallback onClose,
  }) {
    _overlayEntry = null;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: _AdFailedWidget(
            onClaim: (value) async {
              close();
              onBtn();

            },
            onClose: () async {
              twLooog("=====OverlayGetCoins onClose");
              close();
              onClose();
            },
            coins: coins,
          ),
        );
      },
    );
    Overlay.of(Get.context!).insert(_overlayEntry!);
    _isShowing = true;
  }

  void close() {
    _isShowing = false;
    _overlayEntry?.remove();
  }
}

class _AdFailedWidget extends StatefulWidget {
  const _AdFailedWidget({
    super.key,
    required this.onClose,
    required this.coins,
    required this.onClaim,
  });

  final VoidCallback onClose;
  final ValueChanged<double?> onClaim;
  final double coins;

  @override
  State<_AdFailedWidget> createState() => _AdFailedWidgetState();
}

class _AdFailedWidgetState extends State<_AdFailedWidget> {
  int index = 0;

  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.8;
  double _coins = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          showAnimated = true;
          _coins = widget.coins;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animD,
      color: Colors.black.withValues(alpha: showAnimated ? 0.7 : 0),
      child: AnimatedScale(
        duration: animD,
        scale: showAnimated ? 1.0 : startScale,
        child: SizedBox(
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          child:  Center(child: adContentW2(),),
        ),
      ),
    );
  }


  adContentW2(){
    return  Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        // 1. 主体卡片
        Container(
          width: 300.w,
          padding:  EdgeInsets.fromLTRB(24.w, 50.w, 24.w, 24.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28.w), // 大圆角
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 2. 状态图标
              Container(
                width: 80.w,
                height: 80.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF0F1), // 浅红色背景
                  shape: BoxShape.circle,
                ),
                child:  Center(
                  child: Icon(
                    Icons.wifi_off_rounded,
                    size: 36.sp,
                    color: Color(0xFFFF4757), // 红色图标
                  ),
                ),
              ),
               SizedBox(height: 24.w),

              // 3. 标题
              const Text(
                "Ad Loading Failed",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF2F3542),
                  fontFamily: 'Roboto', // 或者用系统默认
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.w),

              // 4. 副标题/说明文字
              Text(
                "Oops! Something went wrong with the connection. Please check your internet and try again.",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Color(0xFF747D8C),
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.w),

              // 5. 按钮
              SizedBox(
                width: double.infinity,
                height: 56.w,
                child: ElevatedButton(
                  onPressed: () {
                    // 重试逻辑
                    widget.onClaim(null);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 8,
                    shadowColor: const Color(0xFF2ED573).withOpacity(0.4),
                    backgroundColor: Colors.transparent, // 透明以显示渐变
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF2ED573),
                          Color(0xFF26C266),
                        ], // 绿色渐变
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "Try Again",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // 6. 关闭按钮 (右上角)
        Positioned(
          right: 10,
          top: 10,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                widget.onClose();
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F2F6),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close_rounded,
                  size: 20,
                  color: Color(0xFFA4B0BE),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // adContentWidget() {
  //   return Container(
  //     width: 300.w,
  //     height: 360.h,
  //     decoration: BoxDecoration(
  //       color: Color(0xff34992d),
  //       borderRadius: BorderRadius.circular(16.w),
  //     ),
  //     child: Column(
  //       children: [
  //         SizedBox(height: 10.h),
  //         Stack(
  //           children: [
  //             Container(
  //               width: double.infinity,
  //               // color: Colors.amber,
  //               height: 30.h,
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Text(
  //                     "Ad loading failed",
  //                     style: TextStyle(
  //                       fontWeight: FontWeight.w700,
  //                       color: Color(0xffffffff),
  //                       fontSize: 20.sp,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Positioned(
  //               top: 0,
  //               right: 20.w,
  //               bottom: 0,
  //               child: GestureDetector(
  //                 onTap: () {
  //                   // Navigator.pop(context);
  //                   widget.onClose();
  //                 },
  //                 child: Container(
  //                   width: 40.h,
  //                   height: 40.h,
  //                   color: Colors.cyan.withValues(alpha: 0),
  //                   child: Icon(Icons.close,color: Colors.white,),
  //                 ),
  //
  //               ),
  //             ),
  //           ],
  //         ),
  //         Expanded(
  //           child: Center(
  //             child: Container(
  //               width: 300.w,
  //               height: 310.h,
  //               decoration: BoxDecoration(
  //                 color: Color(0xffFBFBFF),
  //                 borderRadius: BorderRadius.circular(16.w),
  //               ),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   SizedBox(height: 80.h),
  //                   Stack(
  //                     children: [
  //                       // Image.asset(
  //                       //   Assets.tupian.noad.path,
  //                       //   width: 288.h,
  //                       //   height: 288.h,
  //                       //   fit: BoxFit.contain,
  //                       // ),
  //                       Container(
  //                         width: 120.h,
  //                         height: 120.h,
  //                         color: Colors.cyan.withValues(alpha: 0),
  //                         child: Center(child: Icon(Icons.network_check,size: 120.h,),),
  //                       ),
  //                     ],
  //                   ),
  //
  //                   Expanded(
  //                     child: Center(
  //                       child: GestureDetector(
  //                         onTap: () {
  //                           // Navigator.pop(context);
  //                           widget.onClaim(null);
  //                         },
  //                         child: Container(
  //                           width: 200.w,
  //                           height: 50.h,
  //                           decoration: BoxDecoration(
  //                             color: Color(0xff2d980f).withValues(alpha: 1),
  //                             borderRadius: BorderRadius.circular(16.w),
  //                             border: Border.all(
  //                               color: Color(0xffbed01e),
  //                               width: 2.w,
  //                             ),
  //                           ),
  //                           child: Stack(
  //                             children: [
  //                               Center(
  //                                 child: Text(
  //                                   "Try Again",
  //                                   style: TextStyle(
  //                                     fontWeight: FontWeight.w700,
  //                                     fontSize: 20.sp,
  //                                     // foreground: Color(0xffD0871E),
  //                                     color: Color(0xffffffff),
  //                                   ),
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }



  void onClaim() {
    widget.onClaim(widget.coins);
  }
}

