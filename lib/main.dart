
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sport_connect/auth_folder/auth_sign_up.dart';
import 'package:sport_connect/auth_folder/choose_sport.dart';
import 'package:sport_connect/auth_folder/complete_registration.dart';
import 'package:sport_connect/auth_folder/sign_in_email.dart';
import 'package:sport_connect/auth_folder/splash_screen.dart';
import 'package:sport_connect/navigation_folder/root_page.dart';
import 'helpers/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget currentPage = const Splash();
  AuthClass authClass = AuthClass();
  SignIn signUp = const SignIn();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogIn();
    stillCheckLogIn();
  }
//to save user when logged in
  void checkLogIn() async {
    String? token = await authClass.getToken();
    if (token != null){
      setState(() {
        currentPage = const RootPage();
      });
    }
  }

  void stillCheckLogIn() async {
    String? token = await signUp.getToken();
    if (token != null){
      setState(() {
        currentPage = const RootPage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: const Color(0xFF05070A)
      ),
      home: currentPage
    );
  }
}
