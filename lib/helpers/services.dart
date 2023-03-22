
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sport_connect/auth_folder/complete_registration.dart';

import '../navigation_folder/root_page.dart';


class AuthClass{
  final FirebaseAuth auth = FirebaseAuth.instance;
  final storage = const FlutterSecureStorage();


  Future<String> getCurrentUID() async{
    return auth.currentUser!.uid;
  }

  Future<void> storeTokenAndDta(UserCredential userCredential) async {
    await storage.write(key: 'token', value: userCredential.credential?.token.toString());
    await storage.write(key: 'userCredential', value: userCredential.toString());
  }
  Future<String?> getToken () async{
    return await storage.read(key: 'token');
  }

  Future<void> logOut()async {
    await auth.signOut();
    await storage.delete(key: 'token');
  }
  Future<void>verifyPhoneNumber(String phoneNumber, BuildContext context, Function setData)
  async {
    verificationCompleted (PhoneAuthCredential phoneAuthCredential)async{
      Get.snackbar('Success', 'Verification Completed');
    }
    verificationFailed(FirebaseAuthException exception){
      Get.snackbar('Error', exception.toString());
    }
    codeSent(String verificationID, [int? forceResendingToken]){
      Get.snackbar('Sent', 'Verification code sent to the phone number');
      setData(verificationID);
    }
    codeAutoRetrievalTimeout(String verificationID){
      Get.snackbar('Time Out', 'Time Out');
    }

    await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }
  Future<void> signInWithPhoneNumber(String verificationId, String smsCode, BuildContext context)async {
    AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    UserCredential userCredential = await auth.signInWithCredential(credential);
    storeTokenAndDta(userCredential);
    Get.off(const CompleteRegistration());
  }
  Future<void> logInWithPhoneNumber(String verificationId, String smsCode, BuildContext context)async {
    AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    UserCredential userCredential = await auth.signInWithCredential(credential);
    storeTokenAndDta(userCredential);
    Get.off(const RootPage());
    Get.snackbar('Success Authentication', 'Logged In');
  }
}