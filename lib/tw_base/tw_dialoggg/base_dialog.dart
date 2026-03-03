import 'package:flutter/material.dart';

twBaseDialogC143({
  required Widget child,
  required BuildContext context,
  Color? barrierColor,
}) async {
  return await showDialog(
    context: context,
    useRootNavigator: true,
    useSafeArea: false,
    barrierDismissible: false,
    animationStyle: AnimationStyle(
      duration: Duration(milliseconds: 200),
      reverseDuration: Duration(milliseconds: 200),
    ),
    barrierColor: barrierColor ?? Colors.black.withValues(alpha: 0.81),

    builder: (context) {
      return SafeArea(
        top: false,
        bottom: false,
        child: CannotBackC143(
          child: Material(color: Colors.transparent, child: child),
        ),
      );
    },
  );
}

class CannotBackC143 extends StatelessWidget {
  const CannotBackC143({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return PopScope(canPop: true, child: child);
  }
}
