import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: ConfettiPage()));
}

class ConfettiPage extends StatelessWidget {
  const ConfettiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1a0b2e), // 深色背景模拟图片环境
      body: Stack(
        children: [
          // 背景文字或其他UI
          const Center(
            child: Text(
              "Flutter Confetti Fade",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          // 烟花特效层
          const Positioned.fill(child: ConfettiWidget()),
        ],
      ),
    );
  }
}

class ConfettiWidget extends StatefulWidget {
  const ConfettiWidget({super.key});

  @override
  State<ConfettiWidget> createState() => _ConfettiWidgetState();
}

class _ConfettiWidgetState extends State<ConfettiWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Particle> _particles = [];
  final Random _random = Random();
  final int _maxParticles = 100; // 屏幕上最大粒子数

  @override
  void initState() {
    super.initState();
    // 创建一个持续运行的动画控制器
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(); // 无限循环

    _controller.addListener(_updateParticles);
  }

  void _updateParticles() {
    final size = MediaQuery.of(context).size;

    // 1. 生成新粒子 (如果数量未满)
    if (_particles.length < _maxParticles) {
      // 每次随机生成几个，避免瞬间爆炸，形成连绵不绝的效果
      if (_random.nextDouble() < 0.15) {
        _particles.add(
          Particle(
            x: _random.nextDouble() * size.width,
            y: -20.0, // 从屏幕上方一点点开始
            color: _getRandomColor(),
            size: _random.nextDouble() * 10 + 5, // 大小 5-15
            rotationSpeed: _random.nextDouble() * 0.2 - 0.1,
            fallSpeed: _random.nextDouble() * 3 + 2, // 下落速度
          ),
        );
      }
    }

    // 2. 更新现有粒子状态
    for (var i = _particles.length - 1; i >= 0; i--) {
      final p = _particles[i];
      p.y += p.fallSpeed; // 下落
      p.rotation += p.rotationSpeed; // 旋转

      // 模拟简单的空气阻力/左右摇摆
      p.x += sin(p.y * 0.05) * 0.5;

      // 3. 移除超出屏幕的粒子
      if (p.y > (size.height / 1.2)) {
        _particles.removeAt(i);
      }
    }

    // 触发重绘
    setState(() {});
  }

  Color _getRandomColor() {
    List<Color> colors = [
      Colors.redAccent,
      Colors.blueAccent,
      Colors.green,
      Colors.yellowAccent,
      Colors.purpleAccent,
      Colors.orange,
    ];
    return colors[_random.nextInt(colors.length)];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      // 确保不拦截点击事件
      child: CustomPaint(
        painter: ConfettiPainter(_particles),
        child: Container(),
      ),
    );
  }
}

// 粒子数据模型
class Particle {
  double x;
  double y;
  Color color;
  double size;
  double rotation;
  double rotationSpeed;
  double fallSpeed;

  Particle({
    required this.x,
    required this.y,
    required this.color,
    required this.size,
    required this.rotationSpeed,
    required this.fallSpeed,
    this.rotation = 0.0,
  });
}

// 核心绘制逻辑
class ConfettiPainter extends CustomPainter {
  final List<Particle> particles;

  ConfettiPainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    for (final p in particles) {
      // ============================================
      // 核心算法：计算透明度
      // 随着 Y 轴位置增加，透明度降低。
      // 例如：当粒子在屏幕顶部时 opacity=1，底部时 opacity=0
      // ============================================
      double progress = p.y / (size.height / 1.2);
      double opacity = (1.0 - progress).clamp(0.0, 1.0);

      // 为了让效果更好，可以加个缓动，让它到底部 3/4 处才开始快速消失，或者全程线性消失
      // 这里使用简单的线性消失

      paint.color = p.color.withOpacity(opacity);

      // 绘制旋转的矩形
      canvas.save();
      canvas.translate(p.x, p.y);
      canvas.rotate(p.rotation);

      // 画一个小矩形 (模拟纸屑)
      canvas.drawRect(
        Rect.fromCenter(
          center: Offset.zero,
          width: p.size,
          height: p.size * 0.6,
        ),
        paint,
      );

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // 因为每帧都在动，所以必须重绘
  }
}