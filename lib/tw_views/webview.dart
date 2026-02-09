import 'package:c143/tw_base/tw_http/event_report.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TwWvC143 extends StatefulWidget {
  const TwWvC143({super.key, required this.url});

  final String url;

  @override
  State<TwWvC143> createState() => _TwWvC143State();
}

class _TwWvC143State extends State<TwWvC143> {
  late WebViewController controllerC143;
  bool initCompleteddddC143 = false;

  initControllerC143() {
    controllerC143 = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint("加载进度: $progress%");
            if (progress == 100) {
              setState(() {
                initCompleteddddC143 = true;
              });
            } else {
              setState(() {
                initCompleteddddC143 = false;
              });
            }
          },
          onPageStarted: (String url) {
            debugPrint("开始加载: $url");
          },
          onPageFinished: (String url) {
            debugPrint("加载完成: $url");
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint("加载错误: $error");
          },
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  void initState() {
    super.initState();
    initControllerC143();

    // PBMaiDian.h5_page();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [

              Expanded(
                child: Stack(
                  children: [
                    WebViewWidget(controller: controllerC143),
                    if (!initCompleteddddC143)
                      Positioned.fill(child: loading()),
                  ],
                ),
              ),
            ],
          ),
          topBackC143(),
        ],
      ),
    );
  }

  loading() {
    return CupertinoActivityIndicator();
  }

  topBackC143() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: double.infinity,
        height: ScreenUtil().statusBarHeight + 50.h,
        color: Color(0xff06A000).withValues(alpha: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ScreenUtil().statusBarHeight),
            backC143(),
          ],
        ),
      ),
    );
  }

  backC143() {
    return Row(
      children: [
        SizedBox(width: 16.w,),
        Container(
          width: 40.h,
          height: 40.h,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(40.h),
          ),

          child: Icon(Icons.arrow_back_ios_new_rounded, size: 24.h, color: Colors.white),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
