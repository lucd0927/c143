import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_pages/guide/guide0_bguide.dart';
import 'package:c143/tw_143/tw_pages/guide/guide10_quiz3.dart';
import 'package:c143/tw_143/tw_pages/guide/guide11_homebonus.dart';
import 'package:c143/tw_143/tw_pages/guide/guide12_homereward.dart';
import 'package:c143/tw_143/tw_pages/guide/guide13_spin.dart';
import 'package:c143/tw_143/tw_pages/guide/guide1_water.dart';
import 'package:c143/tw_143/tw_pages/guide/guide2_coin.dart';
import 'package:c143/tw_143/tw_pages/guide/guide3_adspot.dart';
import 'package:c143/tw_143/tw_pages/guide/guide4_fertilize.dart';
import 'package:c143/tw_143/tw_pages/guide/guide5_adspot.dart';
import 'package:c143/tw_143/tw_pages/guide/guide6_rewarddouble.dart';
import 'package:c143/tw_143/tw_pages/guide/guide7_rank.dart';
import 'package:c143/tw_143/tw_pages/guide/guide8_quiz1.dart';
import 'package:c143/tw_143/tw_pages/guide/guide9_quiz2.dart';
import 'package:c143/tw_143/tw_pages/guide/guide_old.dart';
import 'package:c143/tw_143/tw_pages/main/main_controller.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_143/tw_pages/main_tree/vieee/high_light_tips.dart';
import 'package:c143/tw_143/tw_pages/main_tree/vieee/main_center.dart';
import 'package:c143/tw_143/tw_pages/main_tree/vieee/main_rank.dart';
import 'package:c143/tw_143/tw_pages/main_tree/vieee/main_top_a.dart';
import 'package:c143/tw_base/tw_ad/ads_idddddC143.dart';
import 'package:c143/tw_base/tw_ad/base_ads.dart';
import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_gj/ios_h5.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_base/tw_gj/login_trackC143.dart';
import 'package:c143/tw_base/tw_http/event_report.dart';
import 'package:c143/tw_hive/twhiveC143.dart';
import 'package:c143/tw_notification/android_notification.dart';
import 'package:c143/tw_notification/ios_notification.dart';
import 'package:c143/tw_notification/overlay_notify.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tba_info/flutter_tba_info.dart';

double minPinnedHeight = 200.h;
double maxPinnedHeight = 530.h;
// double maxPinnedHeight = 500.h;

class MainTree extends StatefulWidget {
  const MainTree({super.key});

  @override
  State<MainTree> createState() => _MainTreeState();
}

class _MainTreeState extends State<MainTree> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initScroller();
    MainTreeController.initComposition();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      TwIosH5C143().initH5(context);
      TwMaiDiannnn.home_view(MainTreeController.to.curLevel.value.toString());
      // var idfa = await FlutterTbaInfo.instance.getIdfa();
      String? data = MainTreeController.to.guideIndexData();
      twLooog("======data:$data");
      // data = null;
      // data = MainTreeController.guide4;
      if (data == null) {
        if (TwPackageABC143.isPackageB()) {
          OverlayGuide0BGuide().show(coins: 5, onBtn: (value) {});
        } else {
          OverlayGuide1Water().show();
        }
      } else if (data == MainTreeController.guide0) {
        OverlayGuide1Water().show();
      } else if (data == MainTreeController.guide1) {
        OverlayGuide2Coin().show();
      } else if (data == MainTreeController.guide2) {
        OverlayGuide3AdSpot().show(coins: 10);
      } else if (data == MainTreeController.guide3) {
        OverlayGuide4Fertilize().show();
      } else if (data == MainTreeController.guide4) {
        OverlayGuide5AdSpot().show(coins: 10);
      } else if (data == MainTreeController.guide5) {
        OverlayGuide6RewardDouble().show(coins: 10);
      } else if (data == MainTreeController.guide6) {
        OverlayGuide7Rank().show();
      } else if (data == MainTreeController.guide7) {
        MainController.to.resetIndex(MainController.quizIndex);
        // OverlayGuide8Quiz1().show(coins: 10, onBtn: (value) {  });
      } else if (data == MainTreeController.guide8) {
        MainController.to.resetIndex(MainController.quizIndex);
        OverlayGuide9Quiz2().show(coins: 10, onBtn: (value) {});
      } else if (data == MainTreeController.guide9) {
        MainController.to.resetIndex(MainController.quizIndex);
        OverlayGuide10Quiz3().show(coins: 10, onBtn: (value) {});
      } else if (data == MainTreeController.guide10) {
        // MainController.to.resetIndex(MainController.quizIndex);
        OverlayGuide11HomeBonus().show(
          coins: TwPackageABC143.isPackageB() ? 5 : 10,
        );
      } else if (data == MainTreeController.guide11) {
        OverlayGuide12HomeReward().show(coins: 10, onBtn: (value) {});
      } else if (data == MainTreeController.guide12) {
        OverlayGuide13Spin().show();
      }

      if (TwLoginnnTrackC143.isFirstLoginToday &&
          TwLoginnnTrackC143.qidongduoshaoDay() > 1) {
        OverlayGuideOld().show(
          coins: TwPackageABC143.isPackageB() ? 10 : 100,
          onBtn: (v) {},
        );
      }
      initInterAd();
      initTz();
    });
  }

  initInterAd() async {
    if (TwLoginnnTrackC143.qidongduoshaoDay() <= 1 ||
        !TwPackageABC143.isPackageB()) {
      return;
    }

    int load = 1;
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      bool hasFirstIntLoaded = TwCommonAds.hasFirstIntLoaded;
      if (!hasFirstIntLoaded) {
        TwCommonAds().showInterstitialAd(
          adPosId: TwAdsPosId.cuvxv_launch,
          ignored_hasDisplayAd: true,
          canTryAgain: false,
        );
        break;
      } else {
        load = load + 1;
        if (load >= 30) {
          break;
        }
      }
    }
    bool hasLoadSucc = load < 30;
    TwMaiDiannnn.event_launch_non_first(hasLoadSucc ? "1" : "0");
  }

  final ScrollController _extendScrollController = ScrollController();
  late VoidCallback _extendScrollEvent;
  bool firstAttachMaxDistance = false;

  initScroller() {
    _extendScrollEvent = () {
      double offset = _extendScrollController.offset;

      double maxDistance = _extendScrollController.position.maxScrollExtent;
      // twLooog("====offset:$offset=maxDistance:$maxDistance");
      if (offset == maxDistance && !firstAttachMaxDistance) {
        firstAttachMaxDistance = true;
        twLooog(
          "====offset:$offset=maxDistance:$maxDistance firstAttachMaxDistance:$firstAttachMaxDistance",
        );
        TwMaiDiannnn.leaderboard_view();
      }
    };

    _extendScrollController.addListener(_extendScrollEvent);
  }

  initTz() async {
    await TwNotificationIosC143().initC143();
    if (TwPackageABC143.isPackageB() && TwLoginnnTrackC143.qiduoCishu() > 1) {
      bool showTz = await TwNotificationnn().requestNotificationPermission();
      twLooog("===OverlayGuide3BTrust==showTz:$showTz");
      if (!showTz) {
        OverlayTzNotify().show(onEnd: () {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: MainTreeController.to.overlayPortalController,
      overlayChildBuilder: (BuildContext context) {
        return MainHighLightTips();
      },
      child: Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            Image.asset(
              Assets.twimg.mainBg.path,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
              gaplessPlayback: true,
            ),
            StarryBeamScene(),
            Positioned.fill(child: _buildExtendNestedScrollerView()),
          ],
        ),
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
              Column(children: [MainTopA(), MainCenter()]),
            ],
          ),
        ),
      ),
    );
  }

  _buildExtendNestedScrollerView() {
    return NotificationListener(
      child: ExtendedNestedScrollView(
        headerSliverBuilder: headerSliverBuilder,
        onlyOneScrollInBody: false,
        controller: _extendScrollController,
        body: ExtendedVisibilityDetector(
          uniqueKey: ValueKey("MainRank00000"),
          child: MainRank(),
        ),
        pinnedHeaderSliverHeightBuilder: () {
          return minPinnedHeight;
        },
      ),
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _extendScrollController.removeListener(_extendScrollEvent);
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
