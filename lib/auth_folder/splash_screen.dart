

import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:sport_connect/auth_folder/onboardin.dart';
import 'package:sport_connect/helpers/designs.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}
class _SplashState extends State<Splash> {
  @override
  void initState() {

    super.initState();
    Timer(const Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(
                builder: (context)=>const OnBoarding()
            )));
  }
  @override
  Widget build(BuildContext context) {
        return Scaffold(
          body:
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Designs.scaffoldTheme,
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Designs.splashPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/ball_png.png',
                      height: Designs.splashLogo,
                    ),
                    const SizedBox(width: 7,),
                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText('SportConnect',
                            textAlign: TextAlign.justify,
                            textStyle: TextStyle(
                                letterSpacing: 2,
                                color: Designs.blueColor,
                                fontSize: Designs.splashText,
                                fontWeight: FontWeight.bold
                            )),],
                      isRepeatingAnimation: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
  }
}
