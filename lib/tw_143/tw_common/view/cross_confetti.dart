import 'dart:math';
import 'dart:ui' as ui; // 引入ui库以使用更精确的Gradient
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MaterialApp(home: SpaceAnimationPage()));
}

class SpaceAnimationPage extends StatelessWidget {
  const SpaceAnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const MeteorBackground(),
          // 模拟中间的内容
          Center(
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.05),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.2),
                    blurRadius: 30,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: const Center(
                child: Icon(Icons.attach_money, size: 60, color: Colors.green),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MeteorBackground extends StatefulWidget {
  const MeteorBackground({super.key, this.meteorCount = 8});

  final int meteorCount;

  @override
  State<MeteorBackground> createState() => _MeteorBackgroundState();
}

class _MeteorBackgroundState extends State<MeteorBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  List<Star> stars = [];
  List<Meteor> meteors = [];
  final Random _rng = Random();

  int meteorCount = 0;

  @override
  void initState() {
    super.initState();
    meteorCount = widget.meteorCount;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _initParticles(Size size) {
    if (stars.isNotEmpty) return;

    // 生成星星
    for (int i = 0; i < 80; i++) {
      stars.add(
        Star(
          x: _rng.nextDouble() * size.width,
          y: _rng.nextDouble() * size.height,
          size: _rng.nextDouble() * 2 + 3.0,
          baseOpacity: _rng.nextDouble() * 0.6 + 0.2,
        ),
      );
    }

    // 生成流星
    for (int i = 0; i < meteorCount; i++) {
      meteors.add(_createRandomMeteor(size, true));
    }
  }

  Meteor _createRandomMeteor(Size size, [bool randomizeStart = false]) {
    List<Color> colors = [
      const Color(0xFFE040FB), // 紫粉
      const Color(0xFF40C4FF), // 蓝
      Colors.white, // 白
    ];

    double speed = _rng.nextDouble() * 2 + 5;

    // --- 关键修改：角度与位置 ---

    // 角度：135度左右 (3*pi/4)。
    // pi/2 是正下方，pi 是正左方。
    // 设置范围在 110度 ~ 160度之间，即 "左下方向"
    double angle = (pi / 2 + 0.3) + (_rng.nextDouble() * 0.8);

    // 位置：为了让它从"右上"往"左下"飞
    // X轴: 从屏幕中间往右延伸 (0.4 ~ 1.5倍宽)
    double startX = _rng.nextDouble() * size.width * 1.1 + (size.width * 0.4);
    // Y轴: 从屏幕上方开始 (-200 ~ 100)
    double startY = _rng.nextDouble() * 300 - 200;

    if (randomizeStart) {
      // 初始分散在屏幕各处
      startX = _rng.nextDouble() * size.width;
      startY = _rng.nextDouble() * size.height;
    }

    return Meteor(
      x: startX,
      y: startY,
      length: _rng.nextDouble() * 100 + 120,
      headRadius: _rng.nextDouble() * 1.5.w + 1.w,
      // 头大
      speed: speed,
      color: colors[_rng.nextInt(colors.length)],
      angle: angle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // gradient: LinearGradient(
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        //   colors: [Color(0xFF150025).withValues(alpha: 0.0), Color(0xFF0F0015).withValues(alpha: 0.2)],
        // ),
        color: Color(0xFF150025).withValues(alpha: 0.4),
      ),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: SpacePainter(
              stars: stars,
              meteors: meteors,
              onInit: _initParticles,
              onUpdate: (size) {
                for (var star in stars) star.update();
                for (var meteor in meteors) {
                  meteor.update();

                  // 边界检测：因为是向左下飞，所以如果跑太左(x < -length) 或 跑太下(y > height) 就重置
                  if (meteor.x < -meteor.length ||
                      meteor.y > size.height + meteor.length) {
                    var newMeteor = _createRandomMeteor(size);
                    meteor.reset(newMeteor);
                  }
                }
              },
            ),
            size: Size.infinite,
          );
        },
      ),
    );
  }
}

class SpacePainter extends CustomPainter {
  final List<Star> stars;
  final List<Meteor> meteors;
  final Function(Size) onInit;
  final Function(Size) onUpdate;

  SpacePainter({
    required this.stars,
    required this.meteors,
    required this.onInit,
    required this.onUpdate,
  });

  @override
  void paint(Canvas canvas, Size size) {
    onInit(size);
    onUpdate(size);

    final Paint paint = Paint();

    // 绘制星星
    for (var star in stars) {
      paint.color = Colors.white.withOpacity(star.currentOpacity);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(Offset(star.x, star.y), star.size / 2, paint);
    }

    // 绘制流星
    for (var meteor in meteors) {
      _drawMeteor(canvas, meteor);
    }
  }

  void _drawMeteor(Canvas canvas, Meteor meteor) {
    final Paint paint = Paint();

    // 头部中心 (x,y)
    Offset headCenter = Offset(meteor.x, meteor.y);

    // 尾部坐标 calculation
    // angle 是运动方向 (左下)，尾部在反方向 (右上 -> angle + pi)
    Offset tailTip = Offset(
      meteor.x + cos(meteor.angle + pi) * meteor.length,
      meteor.y + sin(meteor.angle + pi) * meteor.length,
    );

    // --- 几何计算 (锥形) ---
    // 找到头部圆两侧的切点，以形成平滑的"水滴"形状
    // 垂直于运动轴的角度
    double verticalAngle = meteor.angle + pi / 2;

    Offset tangent1 = Offset(
      headCenter.dx + cos(verticalAngle) * meteor.headRadius,
      headCenter.dy + sin(verticalAngle) * meteor.headRadius,
    );

    Offset tangent2 = Offset(
      headCenter.dx + cos(verticalAngle + pi) * meteor.headRadius,
      headCenter.dy + sin(verticalAngle + pi) * meteor.headRadius,
    );

    // 构建路径
    Path path = Path();
    path.moveTo(tangent1.dx, tangent1.dy);
    // 画半圆包住头
    path.arcToPoint(
      tangent2,
      radius: Radius.circular(meteor.headRadius),
      clockwise: false,
    );
    // 连线到尾尖
    path.lineTo(tailTip.dx, tailTip.dy);
    path.close();

    // --- 颜色渐变 ---
    // 使用 ui.Gradient.linear 确保渐变严格沿着 流星轴线 (Head -> Tail)
    paint.shader = ui.Gradient.linear(
      headCenter,
      tailTip,
      [
        Colors.white, // 0.0: 头尖最亮
        meteor.color, // 0.2: 核心颜色
        meteor.color.withOpacity(0), // 1.0: 尾部透明
      ],
      [0.0, 0.2, 1.0],
    );

    canvas.drawPath(path, paint);

    // 头部高亮核心
    canvas.drawCircle(
      headCenter,
      meteor.headRadius * 0.7,
      Paint()..color = Colors.white,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// --- 模型类 ---

class Star {
  double x, y, size, baseOpacity, t = 0;

  Star({
    required this.x,
    required this.y,
    required this.size,
    required this.baseOpacity,
  }) {
    t = Random().nextDouble() * pi * 2;
  }

  double get currentOpacity => (sin(t) + 1) / 2 * (1 - 0.2) + 0.2;

  void update() => t += 0.04;
}

class Meteor {
  double x, y, length, speed, angle, headRadius;
  Color color;

  Meteor({
    required this.x,
    required this.y,
    required this.length,
    required this.speed,
    required this.headRadius,
    required this.angle,
    required this.color,
  });

  void update() {
    // 标准三角函数移动
    // cos(angle): X轴分量 (135度时为负，即向左)
    // sin(angle): Y轴分量 (135度时为正，即向下)
    x += speed * cos(angle);
    y += speed * sin(angle);
  }

  void reset(Meteor newMeteor) {
    x = newMeteor.x;
    y = newMeteor.y;
    length = newMeteor.length;
    speed = newMeteor.speed;
    color = newMeteor.color;
    angle = newMeteor.angle;
    headRadius = newMeteor.headRadius;
  }
}
