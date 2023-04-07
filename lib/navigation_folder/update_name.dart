
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:sport_connect/auth_folder/auth_log_in.dart';
import 'package:sport_connect/navigation_folder/root_page.dart';


import '../helpers/designs.dart';

class UpdateUsername extends StatefulWidget {
  const UpdateUsername({Key? key}) : super(key: key);

  @override
  State<UpdateUsername> createState() => _UpdateUsernameState();
}

class _UpdateUsernameState extends State<UpdateUsername> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController _nameController = TextEditingController();
  var newUsername = '';
  bool circular = false;
  bool buttonIsActive = false;
  @override
  void dispose(){
    _nameController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final storage = const FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    var _onPressed;
    if (buttonIsActive) {
      _onPressed = () async {
        setState((){
          circular = true;
        });
        if(_nameController.text.isNotEmpty){
          FirebaseFirestore.instance.collection('register').doc(auth.currentUser!.uid).update(
              {'username':_nameController.text,}
          );
          setState((){
            circular = false;
          });
          Get.off(()=> const RootPage());
        }else if(_nameController.text.isEmpty){
          Get.snackbar('Required', 'Username field is required!',
              icon: const Icon(Icons.warning_amber_rounded)
          );
          setState((){
            circular = false;
          });
        }
      };
    }
    return
      Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 23, right: 23, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Change Username',
                style: TextStyle(
                  color: Designs.blueColor,
                  fontSize: Designs.font23,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10,),
              Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFieldContainer(
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: _nameController,
                          onChanged: (value) {
                            setState(() {
                              buttonIsActive =
                              value.isNotEmpty ? true : false;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'New Username',
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.person, size: 18,
                              color: Designs.blueColor.withOpacity(0.55),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Designs.sizedBox30,
                      ),
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
                              backgroundColor: MaterialStateProperty.all(
                                  buttonIsActive ? Designs.blueColor : Designs.blueColor.withOpacity(0.2)
                              ),
                            ),
                            onPressed: _onPressed,
                            child: circular ?
                            const CircularProgressIndicator() :
                            Text('Update',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  color: Colors.white,
                                  fontSize: Designs.fontSize17),)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;

  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Designs.containerHeight53,
      width: Designs.containerWidth230,
      decoration: BoxDecoration(
        color: Designs.blueColor.withOpacity(0.06),
        borderRadius: BorderRadius.circular(Designs.radius15),
      ),
      margin: EdgeInsets.symmetric(vertical: Designs.vertical7),
      padding: EdgeInsets.symmetric(
        horizontal: Designs.horizontal15, vertical: Designs.vertical2,
      ),
      child: child,
    );
  }
}
