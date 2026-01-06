// 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.334280
import 'dart:async';

import 'package:flutter/material.dart';

class TwAScaleC143 extends StatefulWidget {
  const TwAScaleC143({
    super.key,
    required this.child,
    this.milliseconds = 1000,
    this.maxS = 1.0,
    this.minS = 0.8,
  });

  final Widget child;
  final int? milliseconds;
  final double? minS;
  final double? maxS;

  @override
  State<TwAScaleC143> createState() => _TwAScaleC143State();

}


class _TwAScaleC143State extends State<TwAScaleC143> {
  double _sssssscaleC143 = 1;

  Timer? _tttttC143;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    double minScaleC143 = widget.minS ?? 0.9;
    double maxScaleC143 = widget.maxS ?? 1;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _sssssscaleC143 = minScaleC143;
        });
      }
      _tttttC143 = Timer.periodic(
        Duration(milliseconds: widget.milliseconds ?? 5000),
        (timer) {
          setState(() {
            if (_sssssscaleC143 == maxScaleC143) {
              _sssssscaleC143 = minScaleC143;
            } else {
              _sssssscaleC143 = maxScaleC143;
            }
          });

        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      curve: Curves.linear,
      scale: _sssssscaleC143,
      duration: Duration(milliseconds: widget.milliseconds ?? 5000),
      child: widget.child,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _tttttC143?.cancel();
    super.dispose();

  }
}    
