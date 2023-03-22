
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import '../helpers/designs.dart';
import '../helpers/services.dart';

class PhoneLogIn extends StatefulWidget {
  const PhoneLogIn({Key? key}) : super(key: key);

  @override
  State<PhoneLogIn> createState() => _PhoneLogInState();
}

class _PhoneLogInState extends State<PhoneLogIn> {
  int start = 60;
  bool wait = false;
  String buttonName = 'send';
  final TextEditingController _phoneController = TextEditingController();
  AuthClass authClass = AuthClass();
  String verificationIdFinal = '';
  String smsCode = '';

  bool buttonIsActive = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var _onPressed;
    if (buttonIsActive) {
      _onPressed = (){
        authClass.logInWithPhoneNumber(verificationIdFinal, smsCode, context);
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
                    keyboardType: TextInputType.number,
                    controller: _phoneController,
                    onSaved: (value) {},
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                      prefixIcon: Icon(Icons.phone, size: 18,
                        color: Designs.blueColor.withOpacity(0.55),
                      ),
                      suffixIcon: InkWell(
                        onTap: wait?null: (){
                          startTimer();
                          setState(() {
                            start= 60;
                            wait= true;
                            buttonName = 'resend';
                          });
                          authClass.verifyPhoneNumber('+234${_phoneController.text}',
                              context, setData);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: Designs.horizontal15, horizontal: Designs.vertical5),
                          child: Text(
                            buttonName,
                            style: TextStyle(
                              color:  wait? Colors.black54 : const Color(0xFF2B3849),
                              fontSize: Designs.font15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: Designs.sizedBox30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                        margin: EdgeInsets.symmetric(horizontal: Designs.horizontal15),
                      ),
                    ),
                    Text('Enter 6 Digit OTP',
                      style: TextStyle(
                          color: Color(0xFF767676), fontSize: Designs.font15
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                        margin: EdgeInsets.symmetric(horizontal: Designs.font14),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Designs.sizedBox20),
                Padding(
                  padding: EdgeInsets.all(Designs.padding8),
                  child: otpField(),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.035),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Resend OTP again in',
                                style: TextStyle(color: Color(0xFF767676),
                                    fontSize: Designs.font14
                                )),
                            TextSpan(
                                text: ' 00:$start',
                                style: TextStyle(color: Color(0xFF767676),
                                    fontSize: Designs.font14
                                )),
                            TextSpan(
                                text: ' sec',
                                style: TextStyle(color: Color(0xFF767676),
                                    fontSize: Designs.font14
                                )),
                          ]
                      )),
                ),
                SizedBox(
                  height: Designs.sizedBox60,
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
                      child: Text('Continue',
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
  void startTimer (){
    const onsec = Duration(seconds: 1);
    Timer timer = Timer.periodic(onsec, (timer){
      if (start == 0){
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  Widget otpField (){
    return OTPTextField(
      onChanged: (value) {
        setState(() {
          buttonIsActive =
          value.isNotEmpty ? true : false;
        });
      },
      length: 6,
      width: Designs.vertical5,
      fieldWidth: Designs.sizedBox40,
      otpFieldStyle: OtpFieldStyle(
        backgroundColor: Designs.blueColor.withOpacity(0.15),
      ),
      style: TextStyle(
          fontSize: Designs.fontSize17
      ),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      onCompleted: (pin) {
        print("Completed: " + pin);
        setState(() {
          setData(smsCode = pin);
        });
      },
    );
  }

  void setData(verificationId){
    setState(() {
      verificationIdFinal = verificationId;
    });
    startTimer();
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
