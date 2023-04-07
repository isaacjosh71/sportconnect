
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:sport_connect/auth_folder/auth_log_in.dart';


import '../helpers/designs.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final currentUser = FirebaseAuth.instance.currentUser;
  final TextEditingController _passController = TextEditingController();
var newPassword = '';
  bool circular = false;
  bool _obscureText = true;
  bool buttonIsActive = false;
  @override
  void dispose(){
    _passController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var _onPressed;
    if (buttonIsActive) {
      _onPressed = () async {
        setState((){
          circular = true;
        });
        try {
          String password = _passController.text.trim();
          if(password.length < 6){
            Get.snackbar('Password', 'Password can\'t be less than 6 characters');}
          else{
            setState((){
              newPassword = _passController.text;
            });
            await currentUser?.updatePassword(newPassword);
            FirebaseAuth.instance.signOut();
            setState((){
              circular = false;
            });
            Get.off(const AuthLogIn());
          }
        }
        catch(e){
          Get.snackbar('Error', e.toString());
          print(e.toString());
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
              Text('Change Password',
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
                          controller: _passController,
                          obscureText: _obscureText,
                          onChanged: (value) {
                            setState(() {
                              buttonIsActive =
                              value.isNotEmpty ? true : false;
                            });
                          },
                          key: const ValueKey('password'),
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.lock, size: 18,
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
