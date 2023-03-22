
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_connect/navigation_folder/root_page.dart';
import '../Helpers/designs.dart';

class SelectSports extends StatefulWidget {
  const SelectSports({Key? key}) : super(key: key);

  @override
  State<SelectSports> createState() => _SelectSportsState();
}

class _SelectSportsState extends State<SelectSports> {
  bool _select1 = false; bool _select2 = false; bool _select3 = false;
  bool _select4 = false; bool _select5 = false; bool _select6 = false;
  bool _select7 = false; bool _select8 = false;bool _select9 = false;
  bool _select10 = false;bool _select11 = false; bool _select12 = false;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Designs.scaffoldTheme,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Designs.preferSize),
        child: AppBar(
          elevation: 0,
          backgroundColor: Designs.scaffoldTheme,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 11),
              child: Center(
                child: Column(
                  children: [
                    Text('Select favorite sports',
                      style: TextStyle(
                        color: Designs.blueColor,
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 2,),
                    Text('You can choose more than one',
                      style: TextStyle(
                        color: Designs.descriptionColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ),
        ),
      ),
      body: Padding(padding: EdgeInsets.symmetric(vertical: Designs.vertical5,
          horizontal: Designs.horizontal23),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 0.3, color: Designs.blueColor,
            ),
            SizedBox(height: Designs.sizedBox25,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      child: Column(
                        children: [
                          GestureDetector(
                            child: CircleAvatar(
                              child: _select1 ? Center(
                                child: Icon(Icons.check_circle,
                                    size: Designs.iconSize23,color: Designs.blueColor),
                              ): Container(),
                              radius: Designs.radius35,
                              backgroundImage: _getImage1(),),
                            onTap: (){
                              setState(() {
                                _select1 =!_select1;
                              });
                            },
                          ),
                          Text('Football',
                          style: Designs.primaryFont,)
                        ],
                      ),
                    ),
                    Align(
                      child: Column(
                        children: [
                          GestureDetector(
                            child: CircleAvatar(
                              child: _select2 ? Center(
                                child: Icon(Icons.check_circle,
                                    size: Designs.iconSize23,color: Designs.blueColor),
                              ): Container(),
                              radius: Designs.radius35,
                              backgroundImage: _getImage2(),),
                            onTap: (){
                              setState(() {
                                _select2 =!_select2;
                              });
                            },
                          ),
                          Text('Swimming',
                          style: Designs.primaryFont,)
                        ],
                      ),
                    ),
                    Align(
                      child: Column(
                        children: [
                          GestureDetector(
                            child: CircleAvatar(
                              child: _select3 ? Center(
                                child: Icon(Icons.check_circle,
                                    size: Designs.iconSize23,color: Designs.blueColor),
                              ): Container(),
                              radius: Designs.radius35,
                              backgroundImage: _getImage3(),),
                            onTap: (){
                              setState(() {
                                _select3 =!_select3;
                              });
                            },
                          ),
                          Text('Basketball',
                          style: Designs.primaryFont,)
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: Designs.sizedBox45,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      child: Column(
                        children: [
                          GestureDetector(
                            child: CircleAvatar(
                              child: _select4 ? Center(
                                child: Icon(Icons.check_circle,
                                    size: Designs.iconSize23,color: Designs.blueColor),
                              ): Container(),
                              radius: Designs.radius35,
                              backgroundImage: _getImage4(),),
                            onTap: (){
                              setState(() {
                                _select4 =!_select4;
                              });
                            },
                          ),
                          Text('Cycling',
                            style: Designs.primaryFont,)
                        ],
                      ),
                    ),
                    Align(
                      child: Column(
                        children: [
                          GestureDetector(
                            child: CircleAvatar(
                              child: _select5 ? Center(
                                child: Icon(Icons.check_circle,
                                    size: Designs.iconSize23,color: Designs.blueColor),
                              ): Container(),
                              radius: Designs.radius35,
                              backgroundImage: _getImage5(),),
                            onTap: (){
                              setState(() {
                                _select5 =!_select5;
                              });
                            },
                          ),
                          Text('Sprint',
                            style: Designs.primaryFont,)
                        ],
                      ),
                    ),
                    Align(
                      child: Column(
                        children: [
                          GestureDetector(
                            child: CircleAvatar(
                              child: _select6 ? Center(
                                child: Icon(Icons.check_circle,
                                    size: Designs.iconSize23,color: Designs.blueColor),
                              ): Container(),
                              radius: Designs.radius35,
                              backgroundImage: _getImage6(),),
                            onTap: (){
                              setState(() {
                                _select6 =!_select6;
                              });
                            },
                          ),
                          Text('Baseball',
                            style: Designs.primaryFont,)
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: Designs.sizedBox45,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      child: Column(
                        children: [
                          GestureDetector(
                            child: CircleAvatar(
                              child: _select7 ? Center(
                                child: Icon(Icons.check_circle,
                                    size: Designs.iconSize23,color: Designs.blueColor),
                              ): Container(),
                              radius: Designs.radius35,
                              backgroundImage: _getImage7(),),
                            onTap: (){
                              setState(() {
                                _select7 =!_select7;
                              });
                            },
                          ),
                          Text('Tennis',
                            style: Designs.primaryFont,)
                        ],
                      ),
                    ),
                    Align(
                      child: Column(
                        children: [
                          GestureDetector(
                            child: CircleAvatar(
                              child: _select8 ? Center(
                                child: Icon(Icons.check_circle,
                                    size: Designs.iconSize23,color: Designs.blueColor),
                              ): Container(),
                              radius: Designs.radius35,
                              backgroundImage: _getImage8(),),
                            onTap: (){
                              setState(() {
                                _select8 =!_select8;
                              });
                            },
                          ),
                          Text('Cricket',
                            style: Designs.primaryFont,)
                        ],
                      ),
                    ),
                    Align(
                      child: Column(
                        children: [
                          GestureDetector(
                            child: CircleAvatar(
                              child: _select9 ? Center(
                                child: Icon(Icons.check_circle,
                                    size: Designs.iconSize23,color: Designs.blueColor),
                              ): Container(),
                              radius: Designs.radius35,
                              backgroundImage: _getImage9(),),
                            onTap: (){
                              setState(() {
                                _select9 =!_select9;
                              });
                            },
                          ),
                          Text('Volleyball',
                            style: Designs.primaryFont,)
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: Designs.sizedBox45,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      child: Column(
                        children: [
                          GestureDetector(
                            child: CircleAvatar(
                              child: _select10 ? Center(
                                child: Icon(Icons.check_circle,
                                    size: Designs.iconSize23,color: Designs.blueColor),
                              ): Container(),
                              radius: Designs.radius35,
                              backgroundImage: _getImage10(),),
                            onTap: (){
                              setState(() {
                                _select10 =!_select10;
                              });
                            },
                          ),
                          Text('Lacrosse',
                            style: Designs.primaryFont,)
                        ],
                      ),
                    ),
                    Align(
                      child: Column(
                        children: [
                          GestureDetector(
                            child: CircleAvatar(
                              child: _select11 ? Center(
                                child: Icon(Icons.check_circle,
                                    size: Designs.iconSize23,color: Designs.blueColor),
                              ): Container(),
                              radius: Designs.radius35,
                              backgroundImage: _getImage11(),),
                            onTap: (){
                              setState(() {
                                _select11 =!_select11;
                              });
                            },
                          ),
                          Text('Skating',
                            style: Designs.primaryFont,)
                        ],
                      ),
                    ),
                    Align(
                      child: Column(
                        children: [
                          GestureDetector(
                            child: CircleAvatar(
                              child: _select12 ? Center(
                                child: Icon(Icons.check_circle,
                                    size: Designs.iconSize23,color: Designs.blueColor),
                              ): Container(),
                              radius: Designs.radius35,
                              backgroundImage: _getImage12(),),
                            onTap: (){
                              setState(() {
                                _select12 =!_select12;
                              });
                            },
                          ),
                          Text('Ice Hockey',
                            style: Designs.primaryFont,)
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: Designs.sizedBox45,),
            SizedBox(
              width: Designs.width220, height: Designs.sizedBox45,
              child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(
                      1,),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Designs.radius13)
                    )),
                    shadowColor: MaterialStateProperty.all<Color>(
                        Colors.blueGrey),
                    backgroundColor: MaterialStateProperty.all(Designs.blueColor),
                  ),
                  child: Text('Get Started',
                    style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                        fontSize: Designs.fontSize17),),
                  onPressed: (){
                    //using CRUD system, sending fav sports to the current logged in user to the database
                      FirebaseFirestore.instance.collection('selection').doc(auth.currentUser!.uid).collection('fav_sports').add(
                          {'football':_select1,
                            'swimming':_select2,
                            'basketball':_select3,
                            'cycling':_select4,
                            'sprint':_select5,
                            'baseball':_select6,
                            'tennis':_select7,
                            'cricket':_select8,
                            'volleyball':_select9,
                            'lacrosse':_select10,
                            'skating':_select11,
                            'ice_hockey':_select12,
                          }
                      );
                      Get.off(const RootPage());
                  }),
            ),
          ],
        ),
      ),
      ),
    );
  }
  ImageProvider _getImage1() {
    return const AssetImage('assets/images/football.jpg');
  }ImageProvider _getImage2() {
    return const AssetImage('assets/images/swimming.jpg');
  }ImageProvider _getImage3() {
    return const AssetImage('assets/images/basketball.jpg');
  }ImageProvider _getImage4() {
    return const AssetImage('assets/images/cycling.jpg');
  }ImageProvider _getImage5() {
    return const AssetImage('assets/images/sprint.jpg');
  }ImageProvider _getImage6() {
    return const AssetImage('assets/images/baseball.jpg');
  }ImageProvider _getImage7() {
    return const AssetImage('assets/images/tennis.jpg');
  }ImageProvider _getImage8() {
    return const AssetImage('assets/images/cricket.jpg');
  }ImageProvider _getImage9() {
    return const AssetImage('assets/images/volleyball.jpg');
  }ImageProvider _getImage10() {
    return const AssetImage('assets/images/lacrosse.jpg');
  }ImageProvider _getImage11() {
    return const AssetImage('assets/images/skating.jpg');
  }ImageProvider _getImage12() {
    return const AssetImage('assets/images/ice_hockey.jpg');
  }
}
