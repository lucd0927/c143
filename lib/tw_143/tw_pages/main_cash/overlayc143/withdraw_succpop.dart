import 'dart:async';
import 'dart:math';
import 'package:c143/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// ==========================================
// 核心管理类：负责控制 Overlay 的显示、隐藏和数据循环
// ==========================================
class TopNotificationManager {
  // 单例模式
  TopNotificationManager._privateConstructor();

  static final TopNotificationManager instance =
      TopNotificationManager._privateConstructor();

  OverlayEntry? _overlayEntry;
  bool _isLooping = false;
  Timer? _timer;

  final Random _rng = Random();

  /// 开始循环显示
  void startLoop(BuildContext context) {
    if (_isLooping) return;
    _isLooping = true;
    _scheduleNext(context);
  }

  /// 停止循环
  void stopLoop() {
    _isLooping = false;
    _timer?.cancel();
    _removeOverlay();
  }

  void _scheduleNext(BuildContext context) async {
    if (!_isLooping) return;

    // 2. 停留时间 (例如显示 4 秒)
    // 注意：这里的时间 = 动画进入时间 + 停留时间 + 动画退出时间
    // 实际逻辑在 Widget 内部的 AnimationController 控制了
    // 我们只需要保证 Timer 的间隔大于 Widget 自身的生命周期
    _timer = Timer.periodic(const Duration(seconds: 60), (_) {
      // 1. 显示弹窗
      _show(context);

      // 3. 间隔时间 (消失后等几秒再出现，例如 2 秒)
      if (_isLooping) {
        Timer(const Duration(seconds:5), () {
          _removeOverlay();
        });
      }
    });
  }

  // --- 核心修改：在这里动态生成随机数据 ---
  void _show(BuildContext context) {
    _removeOverlay(); // 确保上一个已被移除

    // 1. 随机生成手机号 (Prefix + **** + Suffix)
    final prefixes = [
      '135',
      '136',
      '137',
      '138',
      '139',
      '150',
      '158',
      '186',
      '188',
      '199',
    ];
    String randomPre = "qwertyuiopasdfghjklzxcvbnm123456789";
    const zifuc = '0123456789abcdefghijklmnopqrstuvwxyz';

    final rand1 = zifuc[Random().nextInt(zifuc.length)];
    final rand2 = zifuc[Random().nextInt(zifuc.length)];
    final rand3 = zifuc[Random().nextInt(zifuc.length)];
    final rand4 = zifuc[Random().nextInt(zifuc.length)];
    String prefix = "$rand1$rand2";
    // 生成 1000 到 9999 的随机数作为尾号
    // String suffix = (_rng.nextInt(9000) + 1000).toString();
    String suffix = "$rand3$rand4";
    String randomUser = "$prefix****$suffix";

    // 2. 随机生成金额 (例如 $10 到 $500，且是 5 的倍数)
    // _rng.nextInt(99) 生成 0-98，+2 变成 2-100，再乘以 5 -> 10-500
    int amountVal = (_rng.nextInt(99) + 2) * 5;
    String randomAmount = "\$$amountVal";

    // 3. 随机生成头像 URL
    // pravatar 支持 img 参数 1-70
    int avatarId = _rng.nextInt(70) + 1;
    String randomAvatar = Random().nextInt(100) > 50
        ? Assets.twimgB.txCashappMaintop.path
        : Assets.twimgB.txPaypalMaintop.path;

    OverlayState? overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => TopSlideToast(
        username: randomUser,
        amount: "\$1000",
        avatarUrl: randomAvatar,
        // 这里的 duration 控制动画停留时长，要比 _scheduleNext 里的 Timer 稍微短一点点
        displayDuration: const Duration(seconds: 4),
        onDismissed: () {
          // 动画播放完毕的回调
        },
      ),
    );

    overlayState.insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

// ==========================================
// 弹窗组件：处理 UI 和 进出场动画
// ==========================================
class TopSlideToast extends StatefulWidget {
  final String username;
  final String amount;
  final String avatarUrl;
  final Duration displayDuration;
  final VoidCallback? onDismissed;

  const TopSlideToast({
    super.key,
    required this.username,
    required this.amount,
    required this.avatarUrl,
    this.displayDuration = const Duration(seconds: 3),
    this.onDismissed,
  });

  @override
  State<TopSlideToast> createState() => _TopSlideToastState();
}

class _TopSlideToastState extends State<TopSlideToast>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600), // 进出场动画时长
      vsync: this,
    );

    // 从上方 (-1.0) 滑动到原始位置 (0.0)
    _offsetAnimation =
        Tween<Offset>(
          begin: const Offset(0.0, -1.5), // -1.5 保证完全滑出屏幕外
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOutBack, // 带有回弹效果，比较生动
            reverseCurve: Curves.easeIn,
          ),
        );

    // 启动动画流程
    _startAnimationSequence();
  }

  void _startAnimationSequence() async {
    // 1. 滑入
    await _controller.forward();

    // 2. 停留
    // 减去进出动画的时间，大致计算停留时间
    await Future.delayed(
      widget.displayDuration - const Duration(milliseconds: 1200),
    );

    if (!mounted) return;

    // // 3. 滑出
    // await _controller.reverse();

    widget.onDismissed?.call();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 使用 Positioned 确保 Overlay 不会填满全屏，只在顶部
    // 并且 SafeArea 确保不被刘海屏遮挡
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: SlideTransition(
          position: _offsetAnimation,
          child: Material(
            color: Colors.transparent, // 必须透明，否则会有默认白色背景
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.0),
              child: _buildContent(),
            ),
          ),
        ),
      ),
    );
  }

  // 构建具体的 UI 样式（仿照截图）
  Widget _buildContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            offset: const Offset(0, 4),
            blurRadius: 16.w,
          ),
        ],
      ),
      child: Row(
        children: [
          // 头像
          Container(
            width: 40.w,
            height: 40.w,
            child: Center(child: Image.asset(widget.avatarUrl)),
          ),
          SizedBox(width: 12.w),
          // 文字区域
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 14.sp,
                  fontFamily: 'Roboto',
                  height: 1.3,
                ),
                children: [
                  const TextSpan(text: "Congratulations To User "),
                  TextSpan(
                    text: widget.username,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(text: "\nOn Successfully Withdrawing "),
                  TextSpan(
                    text: "${widget.amount}!",
                    style: TextStyle(
                      color: Color(0xFFFF5252), // 红色高亮
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
