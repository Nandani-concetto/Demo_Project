import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../view/home_page.dart';
import '../view/social_login_view.dart';

class SocialLoginController extends SuperController {
  late FirebaseApp firebaseApp;
  late User firebaseUser;
  late FirebaseAuth firebaseAuth;

  @override
  void onDetached() {
    print('onDetached called');
  }

  @override
  void onInactive() {
    print('onInative called');
  }

  @override
  void onPaused() {
    print('onPaused called');
  }

  @override
  void onResumed() {
    print('onResumed called');
  }

  Future<void> initlizeFirebaseApp() async {
    firebaseApp = await Firebase.initializeApp();
  }

  Future<Widget> checkUserLoggedIn() async {
    if (firebaseApp == null) {
      await initlizeFirebaseApp();
    }
    if (firebaseAuth == null) {
      firebaseAuth = FirebaseAuth.instance;
      update();
    }
    if (firebaseAuth.currentUser == null) {
      return SocialLoginPage();
    } else {
      firebaseUser = firebaseAuth.currentUser!;
      update();
      return Text("HomePage");
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      Get.dialog(Center(child: Text("test")), barrierDismissible: false);
      await initlizeFirebaseApp();
      firebaseAuth = FirebaseAuth.instance;
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredentialData =
          await FirebaseAuth.instance.signInWithCredential(credential);
      firebaseUser = userCredentialData.user!;
      update();
      Get.back();
      Get.to(HomePage());
    } catch (ex) {
      Get.back();
      Get.snackbar('Sign In Error', 'Error Signing in',
          duration: Duration(seconds: 5),
          backgroundColor: Colors.black,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          icon: Icon(
            Icons.error,
            color: Colors.red,
          ));
    }
  }
  Future<void> signOut() async {
    // Show loading widget till we sign out
    Get.dialog(Center(child: Text("abc")), barrierDismissible: false);
    await firebaseAuth.signOut();
    Get.back();
    // Navigate to Login again
    Get.offAll(SocialLoginPage());
  }
}
