
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:sport_connect/auth_folder/auth_log_in.dart';
import 'package:sport_connect/auth_folder/complete_registration.dart';


import '../helpers/designs.dart';

class ChangeEmail extends StatefulWidget {
  const ChangeEmail({Key? key}) : super(key: key);

  @override
  State<ChangeEmail> createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {
  final currentUser = FirebaseAuth.instance.currentUser;
  final TextEditingController _mailController = TextEditingController();
  var newEmail = '';
  bool circular = false;
  bool buttonIsActive = false;
  @override
  void dispose(){
    _mailController.dispose();
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
        try {
          String mail = _mailController.text.trim();
          if(mail.isEmpty || !GetUtils.isEmail(mail)){
            Get.snackbar('Email', 'Please type in a valid email');}
          else{
            setState((){
              newEmail = _mailController.text;
            });
            await currentUser?.updateEmail(newEmail);
            FirebaseAuth.instance.signOut();
            setState((){
              circular = false;
            });
            Get.off(const AuthLogIn());
          }
        }
        catch(e){
          Get.snackbar('Error', e.toString());
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
              Text('Change Email',
                style: TextStyle(
                  color: Designs.blueColor,
                  fontSize: Designs.font23,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10,),
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
                          keyboardType: TextInputType.emailAddress,
                          controller: _mailController,
                          onSaved: (value) {},
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                            prefixIcon: Icon(Icons.mail, size: 18,
                              color: Designs.blueColor.withOpacity(0.55),
                            ),
                            border: InputBorder.none,
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
                            child: circular ?
                            CircularProgressIndicator() :
                            Text('Update',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  color: Colors.white,
                                  fontSize: Designs.fontSize17),),
                            onPressed: _onPressed),
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
