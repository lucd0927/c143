import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TwFlaotingC143 {

  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;


  void show({required BuildContext context, required Widget child}) {
    // if (_isShowing) return;
    _overlay = null;
    _overlay = OverlayEntry(
      builder: (context) {
        return _AnimatedScrollFloatingWidgetC143(child: child);
      },
    );
    Overlay.of(context).insert(_overlay!);
    _isShowing = true;
  }

  void close() {
    _isShowing = false;
    _overlay?.remove();
    _overlay = null;
  }
}

class _AnimatedScrollFloatingWidgetC143 extends StatefulWidget {
  const _AnimatedScrollFloatingWidgetC143({super.key, required this.child});

  final Widget child;

  @override
  State<_AnimatedScrollFloatingWidgetC143> createState() =>
      _AnimatedScrollFloatingWidgetC143State();
}

class _AnimatedScrollFloatingWidgetC143State
    extends State<_AnimatedScrollFloatingWidgetC143> {
  late Timer _asdfasftimerC143;
  final double _xTransformScaleC143 = 0.15;
  final double _yTransformScaleC143 = 0.2;
  bool xRightDirectionC143 = true;
  double _widthC143 = 0;
  double _heightC143 = 0;


  // 是否向下移动
  bool yDownDirectionC143 = true;
  int millisecondsC143 = 2000;
  double _topswC143 = 100.h; //悬浮窗距屏幕或父组件顶部的距离
  double _leftswC143 = ScreenUtil().screenWidth - 72.h; //悬浮窗距屏幕或父组件左侧的距离

  // 是否向右移动

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _topswC143 = 50+200.h*Random().nextDouble(); //悬浮窗距屏幕或父组件顶部的距离
    _leftswC143 = 50+(ScreenUtil().screenWidth - 72.h)*Random().nextDouble(); //悬浮窗距屏幕或父组件左侧的距离
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateC143();
      _asdfasftimerC143 = Timer.periodic(Duration(milliseconds: 2000), (timer) {
        _updateC143();
      });
    });
  }

  _updateC143() {
    setState(() {
      if (xRightDirectionC143) {
        _leftswC143 = _widthC143 * _xTransformScaleC143 + _leftswC143;
        if (_leftswC143 >= _widthC143 - 50) {
          _leftswC143 = _widthC143 - 100;

          xRightDirectionC143 = false;
        }
      } else {
        _leftswC143 = _leftswC143 - _widthC143 * _xTransformScaleC143;
        if (_leftswC143 <= 0) {
          _leftswC143 = 0;
          xRightDirectionC143 = true;
        }
      }

      if (yDownDirectionC143) {
        _topswC143 = _heightC143 * _yTransformScaleC143 + _topswC143;

        if (_topswC143 >= _heightC143) {
          _topswC143 = _heightC143 - 100;
          yDownDirectionC143 = false;
        }
      } else {
        _topswC143 = _topswC143 - _heightC143 * _yTransformScaleC143;
        if (_topswC143 <= 0) {
          _topswC143 = 0;
          yDownDirectionC143 = true;
        }
      }
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        double width = constraint.maxWidth;
        double maxHeight = constraint.maxHeight;
        _widthC143 = width;
        _heightC143 = maxHeight;
        return Stack(
          children: [
            AnimatedPositioned(
              left: _leftswC143,
              top: _topswC143,
              duration: Duration(milliseconds: millisecondsC143 + 500),
              curve: Curves.linear,
              child: widget.child,
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _asdfasftimerC143.cancel();
  }
}