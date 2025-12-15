// 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.334280
import 'dart:async';

import 'package:flutter/material.dart';

class TwAScale extends StatefulWidget {
  const TwAScale({
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
  State<TwAScale> createState() => _TwAScaleState();

}


class _TwAScaleState extends State<TwAScale> {
  double _sssssscale = 1;

  Timer? _ttttt;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    double minScale = widget.minS ?? 0.9;
    double maxScale = widget.maxS ?? 1;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _sssssscale = minScale;
        });
      }
      _ttttt = Timer.periodic(
        Duration(milliseconds: widget.milliseconds ?? 5000),
        (timer) {
          setState(() {
            if (_sssssscale == maxScale) {
              _sssssscale = minScale;
            } else {
              _sssssscale = maxScale;
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
      scale: _sssssscale,
      duration: Duration(milliseconds: widget.milliseconds ?? 5000),
      child: widget.child,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _ttttt?.cancel();
    super.dispose();

  }
}    
