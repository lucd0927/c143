import 'package:c143/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainCash extends StatefulWidget {
  const MainCash({super.key});

  @override
  State<MainCash> createState() => _MainCashState();
}

class _MainCashState extends State<MainCash> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 100.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffC8DEFF),
                      Color(0xffC9E5FF).withValues(alpha: 0),
                    ],
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
