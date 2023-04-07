
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:sport_connect/auth_folder/complete_registration.dart';
import '../helpers/designs.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  final storage = const FlutterSecureStorage();

  Future<String?> getToken () async{
    return await storage.read(key: 'token');
  }

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _rePassController = TextEditingController();

  bool circular = false;
  bool _obscureText = true;
  bool _reObscureText = true;
  bool buttonIsActive = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final storage = const FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    var _onPressed;
    if (buttonIsActive) {
      _onPressed = () async {
        //using firebase email authentication to sign up
        setState((){
          circular = true;
        });
          try {
            String mail = _mailController.text.trim();
            String password = _passController.text.trim();
            String confirm_password = _rePassController.text.trim();

            if(mail.isEmpty || !GetUtils.isEmail(mail)){
              Get.snackbar('Email', 'Please type in a valid email');}
            else if(password.length < 6){
              Get.snackbar('Password', 'Password can\'t be less than 6 characters');}
            else if(confirm_password != password){
              Get.snackbar('Password', 'Password doesn\'t match');}
            else{
              UserCredential userCredential =
              await auth.createUserWithEmailAndPassword(
                  email: _mailController.text, password: _passController.text);
              storeTokenAndDta(userCredential);
              setState((){
                circular = false;
              });
              Get.off(const CompleteRegistration());
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
                    SizedBox(
                      height: Designs.sizedBox20,
                    ),
                    TextFieldContainer(
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: _rePassController,
                        obscureText: _reObscureText,
                        onChanged: (value) {
                          setState(() {
                            buttonIsActive =
                            value.isNotEmpty ? true : false;
                          });
                        },
                        key: const ValueKey('confirm password'),
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
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
                                _reObscureText = !_reObscureText;
                              });
                            },
                            child: Icon(_reObscureText ? Icons.visibility_off
                                : Icons.visibility,
                                size: 18, color: Designs.descriptionColor.withOpacity(0.65),),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Designs.margin10,),
                    Padding(
                      padding: EdgeInsets.only(
                          left: Designs.leftPadding175),
                      child: GestureDetector(
                        onTap: (){

                        },
                        child: Text('Forgot Password?',
                          style: TextStyle(
                            fontSize: 14.5, color: Color(0xFF767676),
                          ),
                        ),
                      )
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
  Future<void> storeTokenAndDta(UserCredential userCredential) async {
    await storage.write(key: 'token', value: userCredential.credential?.token.toString());
    await storage.write(key: 'userCredential', value: userCredential.toString());
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
