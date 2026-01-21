import 'package:flutter/material.dart';

class OverlayManager {
  static final Map<String,OverlayEntry> _kHashCode_vOverlay= {};

  static String show({
    required BuildContext context,required Widget child,
}) {
    final entry = OverlayEntry(builder: (_) => child);
    String key = entry.hashCode.toString();
    Overlay.of(context).insert(entry);
    _kHashCode_vOverlay[key] = entry;
    return key;
  }

  static void clearOverlayEntry(String key){
    _kHashCode_vOverlay[key]?.remove();
    _kHashCode_vOverlay.remove(key);
  }

  static void clearAll() {
    for (var overlayEntry in _kHashCode_vOverlay.values) {
      overlayEntry.remove();
    }
    _kHashCode_vOverlay.clear();
  }
}