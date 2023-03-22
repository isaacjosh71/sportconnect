
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sport_connect/navigation_folder/change_email.dart';
import '../Helpers/designs.dart';
import '../auth_folder/auth_log_in.dart';
import '../helpers/services.dart';
import 'change_password.dart';


class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  static AuthClass authClass = AuthClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Designs.scaffoldTheme,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Designs.scaffoldTheme,
        flexibleSpace: Padding(
          padding: EdgeInsets.only(left: Designs.leftPadding25, top: Designs.topPadding55),
          child: const Text('Profile',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Designs.blueColor,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Designs.sizedBox25),
          Padding(
            padding: EdgeInsets.only(left: Designs.padding20, top: Designs.padding10, bottom: Designs.padding10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/person.svg',
                        height: 22, width: 22,
                      ),
                      SizedBox(width: 10),
                      const Text('Update Username', style: TextStyle(
                          fontWeight: FontWeight.w400, color: Color(0xFF1F1F1F), fontSize: 16),)
                    ],
                  ),
                ),
                SizedBox(height: Designs.sizedBox40),
                GestureDetector(
                  onTap: (){
                    Get.to(ChangeEmail());
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(Icons.mail_outline_rounded, size: 21,),
                      SizedBox(width: 10),
                      Text('Update Email', style: TextStyle(
                          fontWeight: FontWeight.w400, color: Color(0xFF1F1F1F), fontSize: 16),)
                    ],
                  ),
                ),
                SizedBox(height: Designs.sizedBox40),
                GestureDetector(
                  onTap: (){
                    Get.to(const ChangePassword());
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/password.svg',
                        height: 22, width: 22,
                      ),
                      const SizedBox(width: 10),
                      const Text('Change Password', style: TextStyle(
                          fontWeight: FontWeight.w400, color: Color(0xFF1F1F1F), fontSize: 16),)
                    ],
                  ),
                ),
                SizedBox(height: Designs.sizedBox40),
                GestureDetector(
                  onTap: (){},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(Icons.notification_important_outlined, size: 21,),
                      SizedBox(width: 10,),
                      Text('Notification', style: TextStyle(
                          fontWeight: FontWeight.w400, color: Color(0xFF1F1F1F), fontSize: 16),)
                    ],
                  ),
                ),
                SizedBox(height: Designs.sizedBox40),
                GestureDetector(
                  onTap: (){},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(Icons.help_outline_rounded, size: 21,),
                      SizedBox(width: 10),
                      Text('About', style: TextStyle(
                          fontWeight: FontWeight.w400, color: Color(0xFF1F1F1F), fontSize: 16),)
                    ],
                  ),
                ),
                SizedBox(height: Designs.sizedBox40),
                GestureDetector(
                  onTap: () async {
                    authClass.logOut;
                    Get.off(const AuthLogIn());
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/logout.svg',
                        height: 22, width: 22,
                      ),
                      const SizedBox(width: 10),
                      const Text('Logout', style: TextStyle(
                          fontWeight: FontWeight.w400, color: Color(0xFF1F1F1F), fontSize: 16),)
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
