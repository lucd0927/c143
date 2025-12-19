import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_pages/main_tree/vieee/main_center.dart';
import 'package:c143/tw_143/tw_pages/main_tree/vieee/main_rank.dart';
import 'package:c143/tw_143/tw_pages/main_tree/vieee/main_top_a.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double minPinnedHeight = 180.h;
// double maxPinnedHeight = 540.h;
double maxPinnedHeight = 500.h;

class MainTree extends StatefulWidget {
  const MainTree({super.key});

  @override
  State<MainTree> createState() => _MainTreeState();
}

class _MainTreeState extends State<MainTree> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Stack(
        children: [
          Image.asset(
            Assets.twimg.mainBg.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Positioned.fill(child: _buildExtendNestedScrollerView()),
        ],
      ),
    );
  }

  _topWidget() {
    // double maxPinnedHeight = 550.h;
    return ClipRect(
      child: OverflowBox(
        alignment: Alignment.topCenter,
        minHeight: maxPinnedHeight,
        maxHeight: maxPinnedHeight,
        child: Container(
          color: Colors.red.withValues(alpha: 0),
          height: maxPinnedHeight,
          child: Stack(
            children: [
              Column(
                children: [

                  MainTopA(),
                  MainCenter(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildExtendNestedScrollerView() {
    return ExtendedNestedScrollView(
      headerSliverBuilder: headerSliverBuilder,
      onlyOneScrollInBody: false,
      body: ExtendedVisibilityDetector(
        uniqueKey: ValueKey("MainRank00000"),
        child: MainRank(),
      ),
      pinnedHeaderSliverHeightBuilder: () {
        return minPinnedHeight;
      },
    );
  }

  List<Widget> headerSliverBuilder(
    BuildContext context,
    bool innerBoxIsScrolled,
  ) {
    final List<Widget> widget = [];
    widget.add(
      SliverPersistentHeader(
        delegate: _TabBarDelegate(child: _topWidget()),
        pinned: true,
      ),
    );

    return widget;
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  const _TabBarDelegate({required this.child});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    // TODO: implement build
    return child;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxPinnedHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => 0.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }
}
