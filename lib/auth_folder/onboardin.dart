
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sport_connect/auth_folder/auth_sign_up.dart';
import 'package:sport_connect/auth_folder/auth_log_in.dart';
import 'package:sport_connect/helpers/designs.dart';

import '../helpers/contents.dart';


class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late PageController _controller;
  int currentIndex = 0;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Designs.scaffoldTheme,
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Expanded(
            child:  PageView.builder(
                controller: _controller,
                onPageChanged: (int index){
                  setState(() {
                    currentIndex = index;
                  });
                },
                scrollBehavior: const ScrollBehavior(
                  androidOverscrollIndicator: AndroidOverscrollIndicator.glow,
                ),
                itemCount: contents.length,
                itemBuilder: (_,i){
                  return Padding(padding: EdgeInsets.all(Designs.onBoardingPadding),
                    child: Column(
                      children: [
                        Image.asset(
                            contents[i].image,
                            height: Designs.onBoardingImageHeight, width: Designs.onBoardingImageWidth,
                        ),
                        Text(
                          contents[i].description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Designs.buttonColor.withOpacity(0.85),
                              fontSize: Designs.onBoardingTextSize,
                          ),),
                        SizedBox(
                            height: Designs.onBoardingSizedBox
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          List.generate(contents.length, (index){
                            return buildDot(index, context);
                          }),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Padding(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.09),
            child: GestureDetector(
              onTap: () {
                if (currentIndex == contents.length - 1){
                  Get.off(const Authentication());
                }
                _controller.nextPage(duration: const Duration(milliseconds: 100),
                    curve: Curves.bounceIn);
              },
              child: Container(
                height: 40,
                width: currentIndex == contents.length -1
                    ? MediaQuery.of(context).size.width * 0.4 : MediaQuery.of(context).size.width * 0.28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Designs.blueColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(currentIndex == contents.length -1
                        ? 'Get Started' : 'Next',
                      style: TextStyle(color: Designs.whiteColor,
                          fontSize: Designs.onBoardingContainerText
                      ),),
                    const Icon(Icons.navigate_next_sharp, color: Designs.whiteColor,),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
              height: Designs.onBoardingContainerBottomHeight),
        ],
      ),
    );
  }

  AnimatedContainer buildDot(int index, BuildContext context) {
    return AnimatedContainer(duration: const Duration(milliseconds: 300),
      height: 5.0,
      width: currentIndex == index ? 10:5,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
      colors: [
        Designs.buttonColor.withOpacity(0.8),
        Designs.blueColor.withOpacity(0.8),
        ]),
      ),
    );
  }
}