import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_pages/main_tree/vieee/main_center.dart';
import 'package:c143/tw_143/tw_pages/main_tree/vieee/main_top_a.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainTree extends StatefulWidget {
  const MainTree({super.key});

  @override
  State<MainTree> createState() => _MainTreeState();
}

class _MainTreeState extends State<MainTree> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Assets.twimg.mainBg.path,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Positioned.fill(
          child: Column(
            children: [
              SizedBox(height: 40.h),
              MainTopA(),
              MainCenter(),
            ],
          ),
        ),
      ],
    );
  }
}
