
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:sport_connect/Helpers/designs.dart';

class Ads extends StatelessWidget {
  const Ads({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Designs.height150, width: Designs.width350,
      child: Card(
        color: Designs.blueColor.withOpacity(0.9),
        elevation: 1.7,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(25),
            ),
            side: BorderSide.none
        ),
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedTextKit(
                          animatedTexts: [
                            WavyAnimatedText('SportConnect',
                                textAlign: TextAlign.justify,
                                textStyle: const TextStyle(
                                    letterSpacing: 1,
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                )),],
                          repeatForever: true,
                          pause: const Duration(seconds: 60),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.star, size: 15, color: Designs.whiteColor,),
                                SizedBox(width: 5,),
                                const Text('Record',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.5,
                                  ),),
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.star, size: 15, color: Designs.whiteColor,),
                                SizedBox(width: 5,),
                                const Text('Discover',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.5,
                                  ),),
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.star, size: 15, color: Designs.whiteColor,),
                                SizedBox(width: 5,),
                                  const Text('Network',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.5,
                                  ),),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: Designs.height150),
                child: Image.asset('assets/images/ad.png',
                  height: Designs.imageHeight200,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
