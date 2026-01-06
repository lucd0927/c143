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
      color: Colors.black.withValues(alpha: showAnimated ? 0.8 : 0),
      child: AnimatedScale(
        duration: animD,
        scale: showAnimated ? 1.0 : startScale,
        child: SizedBox(
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          child:  Center(child: adContentWidget(),),
        ),
      ),
    );
  }

  adContentWidget() {
    return Container(
      width: 330.w,
      height: 360.h,
      decoration: BoxDecoration(
        color: Color(0xff34992d),
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
                      "Ad loading failed",
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
                    // Navigator.pop(context);
                    widget.onClose();
                  },
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
                width: 300.w,
                height: 310.h,
                decoration: BoxDecoration(
                  color: Color(0xffFBFBFF),
                  borderRadius: BorderRadius.circular(16.w),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 80.h),
                    Stack(
                      children: [
                        // Image.asset(
                        //   Assets.tupian.noad.path,
                        //   width: 288.h,
                        //   height: 288.h,
                        //   fit: BoxFit.contain,
                        // ),
                        Container(
                          width: 120.h,
                          height: 120.h,
                          color: Colors.cyan.withValues(alpha: 0),
                          child: Center(child: Icon(Icons.network_check,size: 120.h,),),
                        ),
                      ],
                    ),

                    Expanded(
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.pop(context);
                            widget.onClaim(null);
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



  void onClaim() {
    widget.onClaim(widget.coins);
  }
}


//
// class AdFailedWidget extends StatefulWidget {
//   const AdFailedWidget({super.key, required this.onClose, required this.onBtn});
//
//   final VoidCallback onClose;
//   final VoidCallback onBtn;
//
//   @override
//   State<AdFailedWidget> createState() => _AdFailedWidgetState();
// }
//
// class _AdFailedWidgetState extends State<AdFailedWidget> {
//   int index = 0;
//   bool showStep2 = false;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: ScreenUtil().screenWidth,
//       height: ScreenUtil().screenHeight,
//       child: IndexedStack(
//         index: index,
//         children: [
//           GestureDetector(
//             onTap: () {},
//             child: Stack(
//               children: [
//                 Container(
//                   // color: Colors.amber,
//                   width: double.infinity,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       // SizedBox(height: 200.h),
//                       content(),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   content() {
//     return Container(
//       width: 330.w,
//       height: 360.h,
//       decoration: BoxDecoration(
//         color: Color(0xff34992d),
//         borderRadius: BorderRadius.circular(16.w),
//       ),
//       child: Column(
//         children: [
//           SizedBox(height: 10.h),
//           Stack(
//             children: [
//               Container(
//                 width: double.infinity,
//                 // color: Colors.amber,
//                 height: 30.h,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Ad loading failed",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w700,
//                         color: Color(0xffffffff),
//                         fontSize: 20.sp,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Positioned(
//                 top: 0,
//                 right: 20.w,
//                 bottom: 0,
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                     widget.onClose();
//                   },
//                   child: Container(
//                     width: 40.h,
//                     height: 40.h,
//                     color: Colors.cyan.withValues(alpha: 0),
//                     child: Icon(Icons.close,color: Colors.white,),
//                   ),
//                   // child: Image.asset(
//                   //   Assets.tupian.guide12Close.path,
//                   //   width: 40.h,
//                   //   height: 40.h,
//                   //   color: Color(0xffffffff),
//                   // ),
//                 ),
//               ),
//             ],
//           ),
//           Expanded(
//             child: Center(
//               child: Container(
//                 width: 300.w,
//                 height: 310.h,
//                 decoration: BoxDecoration(
//                   color: Color(0xffFBFBFF),
//                   borderRadius: BorderRadius.circular(16.w),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(height: 80.h),
//                     Stack(
//                       children: [
//                         // Image.asset(
//                         //   Assets.tupian.noad.path,
//                         //   width: 288.h,
//                         //   height: 288.h,
//                         //   fit: BoxFit.contain,
//                         // ),
//                         Container(
//                           width: 120.h,
//                           height: 120.h,
//                           color: Colors.cyan.withValues(alpha: 0),
//                           child: Center(child: Icon(Icons.network_check,size: 120.h,),),
//                         ),
//                       ],
//                     ),
//
//                     Expanded(
//                       child: Center(
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.pop(context);
//                             widget.onBtn();
//                           },
//                           child: Container(
//                             width: 200.w,
//                             height: 50.h,
//                             decoration: BoxDecoration(
//                               color: Color(0xff2d980f).withValues(alpha: 1),
//                               borderRadius: BorderRadius.circular(16.w),
//                               border: Border.all(
//                                 color: Color(0xffbed01e),
//                                 width: 2.w,
//                               ),
//                             ),
//                             child: Stack(
//                               children: [
//                                 Center(
//                                   child: Text(
//                                     "Try Again",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w700,
//                                       fontSize: 20.sp,
//                                       // foreground: Color(0xffD0871E),
//                                       color: Color(0xffffffff),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
