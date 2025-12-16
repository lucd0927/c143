import 'package:c143/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainRank extends StatefulWidget {
  const MainRank({super.key});

  @override
  State<MainRank> createState() => _MainRankState();
}

class _MainRankState extends State<MainRank> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // clipBehavior: Clip.none,
      width: double.infinity,
      height: 700.h,
      //
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Expanded(
                  child: Container(
                    color: Color(0xff0E226C),
                    child: Column(
                      children: [
                        rankTopWidget(),
                        Expanded(
                          child: CustomScrollView(
                            slivers: [
                              SliverList(
                                delegate: SliverChildBuilderDelegate((
                                  context,
                                  index,
                                ) {
                                  return _itemWidget(index);
                                }),
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
          ),
          Positioned(
            left: 0,
            right: 0,
            top: -0.h,
            child: Image.asset(
              Assets.twimg.mainRankDes.path,
              width: double.infinity,
              height: 52.h,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }

  _itemWidget(int index) {
    return Container(
      width: 336.w,
      height: 72.h,
      child: Stack(
        children: [
          Image.asset(
            Assets.twimg.mainRankBg.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }

  rankTopWidget() {
    return Container(
      width: 344.w,
      height: 208.h,
      child: Stack(
        children: [
          Image.asset(
            Assets.twimg.mainRankTop.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
