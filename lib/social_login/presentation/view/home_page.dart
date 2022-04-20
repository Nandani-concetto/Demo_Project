import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/social_login_controller.dart';

class HomePage extends GetView<SocialLoginController> {
final authController= Get.put(SocialLoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Social Login"),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hello ${authController.firebaseUser.displayName}',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }

}
