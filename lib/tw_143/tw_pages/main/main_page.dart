
import 'package:c143/tw_143/tw_pages/main/views/main_nav.dart';
import 'package:c143/tw_143/tw_pages/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TwMainPage extends StatefulWidget {
  const TwMainPage({super.key});

  @override
  State<TwMainPage> createState() => _TwMainPageState();
}

class _TwMainPageState extends State<TwMainPage> {




  List<Widget> get _mainNavs => [

  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Get.put(MainController());


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: BaseAppBar(title: "title", leftTitle: ""),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: Obx(() {
              int curNacIndex = MainController.to.curMainNavIndex.value;

              return SafeArea(
                bottom: false,
                top: false,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        // Expanded(
                        //   child: IndexedStack(
                        //     index: curNacIndex,
                        //     children: _mainNavs,
                        //   ),
                        // ),
                        // SizedBox(height: bottomNavHeight,),
                      ],
                    ),
                    Positioned(bottom: 0, left: 0, right: 0, child: MainNav()),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
