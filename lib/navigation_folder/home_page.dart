
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_connect/helpers/ad.dart';
import '../Helpers/designs.dart';
import 'package:image_picker/image_picker.dart';

import '../helpers/services.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  XFile? image;

  @override
  void initState() {
    super.initState();
    loadImage();
  }
  static final FirebaseAuth auth= FirebaseAuth.instance;
  final ImagePicker _picker = ImagePicker();
  String? _imagePath;





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
                      SizedBox(width: 3,),
                      Text('User',
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF0F0F0F),
                            fontSize: Designs.fontSize17
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: Designs.vertical20, horizontal: Designs.horizontal23),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Ads(),
              SizedBox(height: Designs.sizedBox20,),
              Container(
                color: Colors.redAccent,
              ),Container(
                color: Colors.redAccent,
              ),Container(
                color: Colors.redAccent,
              ),
            ],
          ),
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

}
