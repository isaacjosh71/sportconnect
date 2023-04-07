
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_connect/helpers/ad.dart';
import 'package:sport_connect/navigation_folder/grid_tile.dart';
import '../Helpers/designs.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
    super.initState();
    loadImage();
  }
  static final FirebaseAuth auth = FirebaseAuth.instance;
  final ImagePicker _picker = ImagePicker();
  String? _imagePath;
  XFile? image;
  String? userName;
  bool? footballValue;bool? basketBallValue;bool? swimmingValue;
  bool? iceHockeyValue;bool? skatingValue;bool? lacrosseValue;
  bool? sprintValue;bool? cyclingValue;bool? baseballValue;
  bool? cricketValue;bool? volleyballValue;bool? tennisValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Designs.scaffoldTheme,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Designs.preferSize),
        child: AppBar(
          elevation: 0,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: Designs.rightPadding15),
              child :
                Icon(Icons.notification_important_sharp, size: Designs.iconSize23,
                color: Designs.blueColor,)
            ),
          ],
          backgroundColor: Designs.scaffoldTheme,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: Designs.leftPadding23, top: Designs.topPadding7),
                  child: GestureDetector(
                      onTap: () async {
                        image = await _picker.pickImage(source: ImageSource.gallery);
                        setState(() {
                          image = image;
                        });
                        _saveImage(image!.path);
                      },
                      child: _imagePath!= null?CircleAvatar(
                        backgroundImage: FileImage(File(_imagePath!)),
                        radius: Designs.radius30,
                      )
                          : CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        radius: 30,
                        backgroundImage: _getImage(),
                      )
                  ),
                ),
                const SizedBox(width: 7,),
                Padding(
                  padding: EdgeInsets.only(top: Designs.topPadding37),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hi',
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF0F0F0F),
                            fontSize: Designs.fontSize17
                        ),
                      ),
                      const SizedBox(width: 5,),
                      FutureBuilder(
                          future: _fetch(),
                          builder: (context,snapshot){
                            if(snapshot.connectionState!=ConnectionState.done) {
                              return const Text('loading...');
                            }
                            return Text('$userName',
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF0F0F0F),
                                  fontSize: Designs.fontSize17
                              ),
                            );
                          }
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Designs.horizontal23, vertical: Designs.padding10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Ads(),
            SizedBox(height: Designs.sizedBox20,),
            const Text('My Sports',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),),
            SizedBox( height: Designs.horizontal15,),
           Expanded(
             child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: Designs.width220, bottom: 5),
                    child: FutureBuilder(
                        future: _fetchSports(),
                        builder: (context, snapshot){
                          if(snapshot.connectionState!=ConnectionState.done){
                            return const Text('loading...');
                          }
                          return
                            footballValue==true ?
                            const SportTile(title: 'Football', image: 'assets/images/football.jpg', document: {})
                            : Container();
                        }
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Padding(
                    padding: EdgeInsets.only(right: Designs.width220, bottom: 5),
                    child: FutureBuilder(
                        future: _fetchSports(),
                        builder: (context, snapshot){
                          if(snapshot.connectionState!=ConnectionState.done) {
                            return const Text('loading...');
                          }
                          return swimmingValue==true ? const SportTile(title: 'Swimming',
                          image: 'assets/images/swimming.jpg', document: {})
                              : Container();
                        }
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Padding(
                    padding: EdgeInsets.only(right: Designs.width220, bottom: 5),
                    child: FutureBuilder(
                        future: _fetchSports(),
                        builder: (context, snapshot){
                          if(snapshot.connectionState!=ConnectionState.done) {
                            return const Text('loading...');
                          }
                          return cricketValue==true ? const SportTile(title: 'Cricket',
                          image: 'assets/images/cricket.jpg', document: {})
                              : Container();
                        }
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Padding(
                    padding: EdgeInsets.only(right: Designs.width220, bottom: 5),
                    child: FutureBuilder(
                        future: _fetchSports(),
                        builder: (context, snapshot){
                          if(snapshot.connectionState!=ConnectionState.done) {
                            return const Text('loading...');
                          }
                          return basketBallValue==true ?
                          const SportTile(title: 'BasketBall', image: 'assets/images/basketball.jpg', document: {})
                              : Container();
                        }
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Padding(
                    padding: EdgeInsets.only(right: Designs.width220, bottom: 5),
                    child: FutureBuilder(
                        future: _fetchSports(),
                        builder: (context, snapshot){
                          if(snapshot.connectionState!=ConnectionState.done) {
                            return const Text('loading...');
                          }
                          return sprintValue==true ? const SportTile(title: 'Sprint',
                            image: 'assets/images/sprint.jpg', document: {})
                              : Container();
                        }
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Padding(
                    padding: EdgeInsets.only(right: Designs.width220, bottom: 5),
                    child: FutureBuilder(
                        future: _fetchSports(),
                        builder: (context, snapshot){
                          if(snapshot.connectionState!=ConnectionState.done) {
                            return const Text('loading...');
                          }
                          return baseballValue==true ? const SportTile(title: 'Baseball',
                            image: 'assets/images/baseball.jpg', document: {})
                              : Container();
                        }
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Padding(
                    padding: EdgeInsets.only(right: Designs.width220, bottom: 5),
                    child: FutureBuilder(
                        future: _fetchSports(),
                        builder: (context, snapshot){
                          if(snapshot.connectionState!=ConnectionState.done) {
                            return const Text('loading...');
                          }
                          return cyclingValue==true ? const SportTile(title: 'Cycling',
                            image: 'assets/images/cycling.jpg', document: {})
                              : Container();
                        }
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Padding(
                    padding: EdgeInsets.only(right: Designs.width220,bottom: 5),
                    child: FutureBuilder(
                        future: _fetchSports(),
                        builder: (context, snapshot){
                          if(snapshot.connectionState!=ConnectionState.done) {
                            return const Text('loading...');
                          }
                          return lacrosseValue==true ?
                              const SportTile(title: 'Lacrosse', image: 'assets/images/lacrosse.jpg', document: {})
                              : Container();
                        }
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Padding(
                    padding: EdgeInsets.only(right: Designs.width220, bottom: 5),
                    child: FutureBuilder(
                        future: _fetchSports(),
                        builder: (context, snapshot){
                          if(snapshot.connectionState!=ConnectionState.done) {
                            return const Text('loading...');
                          }
                          return tennisValue==true ? const SportTile(title: 'Tennis',
                            image: 'assets/images/tennis.jpg', document: {})
                              : Container();
                        }
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Padding(
                    padding: EdgeInsets.only(right: Designs.width220, bottom: 5),
                    child: FutureBuilder(
                        future: _fetchSports(),
                        builder: (context, snapshot){
                          if(snapshot.connectionState!=ConnectionState.done) {
                            return const Text('loading...');
                          }
                          return skatingValue==true ? const SportTile(title: 'Skating',
                            image: 'assets/images/skating.jpg', document: {})
                              : Container();
                        }
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Padding(
                    padding: EdgeInsets.only(right: Designs.width220, bottom: 5),
                    child: FutureBuilder(
                        future: _fetchSports(),
                        builder: (context, snapshot){
                          if(snapshot.connectionState!=ConnectionState.done) {
                            return const Text('loading...');
                          }
                          return volleyballValue==true ? const SportTile(title: 'Volleyball',
                            image: 'assets/images/volleyball.jpg', document: {})
                              : Container();
                        }
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Padding(
                    padding: EdgeInsets.only(right: Designs.width220, bottom: 5),
                    child: FutureBuilder(
                        future: _fetchSports(),
                        builder: (context, snapshot){
                          if(snapshot.connectionState!=ConnectionState.done) {
                            return const Text('loading...');
                          }
                          return iceHockeyValue==true ? const SportTile(title: 'IceHockey',
                            image: 'assets/images/ice_hockey.jpg', document: {})
                              : Container();
                        }
                    ),
                  ),
                  const SizedBox(height: 5,),
                ]
              ),
           ),
          ],
        ),
      ),
    );
  }

  ImageProvider _getImage() {
    final image = this.image;
    if (image != null) {
      return FileImage(File(image.path));
    }
    return const AssetImage('assets/images/profile.png');
  }

  void _saveImage (path) async{
    SharedPreferences saveImage = await SharedPreferences.getInstance();
    saveImage.setString('imagePath', path);
  }

  void loadImage() async{
    SharedPreferences saveImage = await SharedPreferences.getInstance();
    setState((){
      _imagePath = saveImage.getString('imagePath');
    });
  }

  _fetch() async{
    FirebaseFirestore.instance.collection('register').doc(auth.currentUser!.uid)
        .get().then((ds){
          userName = ds.get('username');
          print(userName);
    });
}  _fetchSports() async{
    FirebaseFirestore.instance.collection('selection').doc(auth.currentUser!.uid)
        .get().then((ds){
          footballValue = ds.get('football');
          print(footballValue);
          basketBallValue = ds.get('basketball');
          print(basketBallValue);
          swimmingValue = ds.get('swimming');
          print(swimmingValue);
          sprintValue = ds.get('sprint');
          print(sprintValue);
          cyclingValue = ds.get('cycling');
          print(cyclingValue);
          baseballValue = ds.get('baseball');
          print(baseballValue);
          tennisValue = ds.get('tennis');
          print(tennisValue);
          cricketValue = ds.get('cricket');
          print(cricketValue);
          volleyballValue = ds.get('volleyball');
          print(volleyballValue);
          lacrosseValue = ds.get('lacrosse');
          print(lacrosseValue);
          skatingValue = ds.get('skating');
          print(skatingValue);
          iceHockeyValue = ds.get('ice_hockey');
          print(iceHockeyValue);
    });
}
}
