
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Designs {
  static const primaryColor = Color(0xFF05070A);
  static const whiteColor = Color(0xFFFFFFFF);
  static const descriptionColor = Color(0xFF45505D);
  static const scaffoldTheme = Color(0xFFEFEFF2);
  static const buttonColor = Color(0xFF2B3849);
  static const blueColor = Color(0xFF0629E1);


  static TextStyle primaryFont = const TextStyle(
      color: Color(0xFF05070A),
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal
  );
  static TextStyle whiteFont = const TextStyle(
      color: Color(0xFFFFFFFF),
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal
  );
  static TextStyle hintFont = TextStyle(
      color: const Color(0xFFA5A7AA).withOpacity(0.3),
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal
  );

  //Screen responsiveness using GetX
  //current screen size = 784
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  //splash screen
  static double splashLogo = screenHeight/15.68; //logo height = 50, therefore 784/50 = 15.68
  static double splashText = screenHeight/22.4;
  static double splashPadding = screenHeight/31.36;
  //onBoarding screen
  static double onBoardingPadding = screenHeight/14.25;
  static double onBoardingTextSize = screenHeight/43.55;
  static double onBoardingSizedBox = screenHeight/26.13;
  static double onBoardingImageHeight = screenHeight/2.703;
  static double onBoardingImageWidth = screenHeight/3.408;
  static double onBoardingContainerHeight= screenHeight/19.6;
  static double onBoardingContainerText= screenHeight/46.11;
  static double onBoardingContainerBottomHeight= screenHeight/6.272;
  //sign email
  static double sizedBox30 = screenHeight/26.13;
  static double sizedBox20 = screenHeight/39.2;
  static double leftPadding35 = screenHeight/22.4;
  static double leftPadding175 = screenHeight/4.48;
  static double sizedBox50 = screenHeight/15.68;
  static double radius13 = screenHeight/60.3;
  static double containerHeight53 = screenHeight/14.79;
  static double containerWidth230 = screenHeight/3.408;
  static double radius15 = screenHeight/52.26;
  static double vertical2 = screenHeight/392.0;
  static double vertical7 = screenHeight/112.0;
  static double horizontal15 = screenHeight/52.26;
  static double sizedBox60 = screenHeight/13.06;
  static double font14 = screenHeight/56.0;
  static double font15 = screenHeight/52.26;
  static double padding8 = screenHeight/98.0;
  //select sport
  static double preferSize = screenHeight/11.7;
  static double topPadding = screenHeight/65.3;
  static double bigText = screenHeight/37.3;
  static double smallText = screenHeight/37.3;
  static double verticalPadding10 = screenHeight/18.4;
  static double horizontalPadding23 = screenHeight/34.08;
  static double sizedBox35 = screenHeight/22.4;
  static double sizedBox45 = screenHeight/17.42;
  static double width220 = screenHeight/3.56;
  static double height40 = screenHeight/19.6;
  static double fontSize17 = screenHeight/44.8;
  static double radius35 = screenHeight/22.4;
  static double iconSize23 = screenHeight/34.08;
  //complete reg
  static double rightPadding35 = screenHeight/22.4;
  static double topPadding120 = screenHeight/6.53;
  static double font23 = screenHeight/34.08;
  static double width100 = screenHeight/7.84;
  static double width120 = screenHeight/6.53;
  static double height50 = screenHeight/15.68;
  static double vertical5 = screenHeight/156.8;
  static double sizedBox40 = screenHeight/19.6;
  static double sizedBox70 = screenHeight/11.2;
  //home page
  static double rightPadding15 = screenHeight/50.58;
  static double leftPadding23 = screenHeight/34.08;
  static double topPadding7 = screenHeight/112.0;
  static double radius30 = screenHeight/26.13;
  static double topPadding37 = screenHeight/21.18;
  static double vertical20 = screenHeight/39.2;
  static double horizontal23 = screenHeight/34.08;
  //Ad
  static double height150 = screenHeight/5.226;
  static double width350 = screenHeight/2.24;
  static double radius20 = screenHeight/39.2;
  static double radius25 = screenHeight/31.36;
  static double margin10 = screenHeight/78.4;
  static double padding10 = screenHeight/78.4;
  static double leftPadding130 = screenHeight/6.030;
  static double imageHeight200 = screenHeight/3.92;
  //setting
  static double leftPadding25 = screenHeight/31.36;
  static double topPadding55 = screenHeight/14.25;
  static double sizedBox25 = screenHeight/31.36;
  static double padding20 = screenHeight/39.2;
  static double svg22 = screenHeight/35.63;
}