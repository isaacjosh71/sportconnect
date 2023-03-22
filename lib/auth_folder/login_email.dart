
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sport_connect/auth_folder/complete_registration.dart';
import 'package:sport_connect/auth_folder/phone_sign_up.dart';
import 'package:sport_connect/navigation_folder/root_page.dart';

import '../helpers/designs.dart';

class LogInEmail extends StatefulWidget {
  const LogInEmail({Key? key}) : super(key: key);

  @override
  State<LogInEmail> createState() => _LogInEmailState();
}

class _LogInEmailState extends State<LogInEmail> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool circular = false;

  bool _obscureText = true;
  bool buttonIsActive = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var _onPressed;
    if (buttonIsActive) {
      //using firebase email authentication to log in
      _onPressed = () async {
        try {
          setState((){
            circular = true;
          });
          String mail = _mailController.text.trim();
          String password = _passController.text.trim();

          if(mail.isEmpty || !GetUtils.isEmail(mail)){
            Get.snackbar('Email', 'Please type in a valid email');}
          else if(password.length < 6){
            Get.snackbar('Password', 'Password incorrect');}
          else{
            await auth.signInWithEmailAndPassword(
                email: _mailController.text, password: _passController.text);
            setState((){
              circular = false;
            });
            Get.off(const RootPage());
            Get.snackbar('Success Authentication', 'Logged In');
          }
        }
        catch(e){
          Get.snackbar('Authentication Error', e.toString());
          setState((){
            circular = false;
          });
        }
      };
    }
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Designs.sizedBox30,
          ),
          Form(
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
                  height: Designs.sizedBox20,
                ),
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
                    key: const ValueKey('confirm password'),
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
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(_obscureText ? Icons.visibility_off
                            : Icons.visibility,
                          size: 18, color: Designs.descriptionColor.withOpacity(0.65),),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Designs.padding10,),
                Padding(
                    padding: EdgeInsets.only(
                        left: Designs.leftPadding175),
                    child: Text('Forgot Password?',
                      style: TextStyle(
                        fontSize: Designs.font14, color: Color(0xFF767676),
                      ),
                    )
                ),
                SizedBox(
                  height: Designs.sizedBox45,
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
                      Text('Continue',
                        style: TextStyle(
                            letterSpacing: 1,
                            color: Colors.white,
                            fontSize: Designs.fontSize17),),
                      onPressed: _onPressed),
                ),
              ],
            ),
          ),
        ],
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
