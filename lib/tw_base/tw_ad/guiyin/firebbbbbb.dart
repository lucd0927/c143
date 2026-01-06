// 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.327901
import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';



class TwFirebasC143 {
  // auto patch 391
  static final TwFirebasC143 _instance = TwFirebasC143._();

  TwFirebasC143._();

  factory TwFirebasC143() => _instance;

  final update = StreamController<bool>.broadcast();

  String by({required String name}) =>
      FirebaseRemoteConfig.instance.getString(name);

  Future<void> init() async {
    try {
      twLooog("==TwFirebasC143==initFirebase====");
      FirebaseApp firebaseAppC143 = await Firebase.initializeApp();
      twLooog(
        "==TwFirebasC143==initFirebase===firebaseApp:${firebaseAppC143.toString()}=",
      );
      FlutterError.onError =
          FirebaseCrashlytics.instance.recordFlutterFatalError;
      PlatformDispatcher.instance.onError = (error, stack) {
        // printInDebug(() => "[FiabseUtils]: crash: $error, $stack");
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        return true;
      };
      // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
      FirebaseRemoteConfig.instance.onConfigUpdated.listen((event) async {
        await FirebaseRemoteConfig.instance.activate();
        twLooog(
          "===TwFirebasC143.instance.onConfigUpdated.listen=====$event=",
        );
        // Use the new tw_base/tw_configgg values here.
      });
      await _remote();
    } catch (e) {
      twLooog("==TwFirebasC143==initFirebase===error:$e");
    }
  }

  _remote() async {
    try {
      twLooog("==TwFirebasC143=====remote ensureInitialized");
      await FirebaseRemoteConfig.instance.ensureInitialized();
      // auto patch 99
      twLooog("==TwFirebasC143=====remote fetchAndActivate");
      await FirebaseRemoteConfig.instance.fetchAndActivate();
      // auto patch 393
      // AbaoUtils().runme();
      update.sink.add(true);
    } catch (e) {
      twLooog("==TwFirebasC143=====remote error:$e");
      // FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    }
    twLooog("==TwFirebasC143=====remote end");
  }
}
