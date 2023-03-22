
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sport_connect/auth_folder/auth_sign_up.dart';
import 'package:sport_connect/auth_folder/login_email.dart';
import 'package:sport_connect/auth_folder/phone_log_in.dart';
import 'package:sport_connect/helpers/designs.dart';

class AuthLogIn extends StatefulWidget {
  const AuthLogIn({Key? key}) : super(key: key);

  @override
  State<AuthLogIn> createState() => _AuthLogInState();
}

class _AuthLogInState extends State<AuthLogIn> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Designs.scaffoldTheme,
      body: Padding(
        padding: EdgeInsets.only(left: Designs.leftPadding35, right: Designs.rightPadding35,
            top: Designs.topPadding120),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome Back',
                style: TextStyle(
                  color: Designs.blueColor,
                  fontSize: Designs.font23,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: Designs.vertical5,
              ),
              Text('We\'re happy to see you again, sign in to use your account',
                style: TextStyle(
                  color: Designs.descriptionColor.withOpacity(0.55),
                  fontSize: Designs.font14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: Designs.font15,
              ),
              Container(
                height: Designs.height50,
                decoration: BoxDecoration(
                    color: Designs.blueColor.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(Designs.radius15)
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Designs.leftPadding35, vertical: Designs.vertical5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(selection.length,(index) =>
                        Padding(
                          padding: EdgeInsets.only(right: Designs.horizontal15),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                pageIndex = index;
                              });},
                            child: Text(selection[index],
                              style: TextStyle(
                                letterSpacing: 0.8,
                                fontSize: Designs.font15,
                                color: pageIndex == index ? Designs.primaryColor : Designs.descriptionColor.withOpacity(0.45),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                    ),
                  ),
                ),
              ),
              IndexedStack(
                index: pageIndex,
                children: const [
                  LogInEmail(),
                  PhoneLogIn()
                ],
              ),
              SizedBox(height: Designs.height50),
              Center(
                child: Wrap(
                  children: [
                    const Text('Don\'t have an account?',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Color(0xFF767676),
                          fontSize: 16,
                          fontWeight: FontWeight.w300
                      ),),
                    GestureDetector(
                      onTap: () {
                        Get.to(const Authentication());
                      },
                      child: const Text(' sign up',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Designs.blueColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  List selection = [
    'Email',
    'Phone Number'
  ];
}
