import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

twToast({String text = "", Alignment locatin = Alignment.topCenter}) {
  toastification.show(
    context: Get.context, // optional if you use ToastificationWrapper
    title: Text(
      text,
      style: TextStyle(
        fontSize: 12.sp,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
    ),
    backgroundColor:Colors.black.withValues(alpha: 0.8),
    alignment: locatin,
    autoCloseDuration: const Duration(seconds: 4),
  );
}
