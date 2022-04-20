import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/social_login_controller.dart';

class SocialLoginPage extends GetView<SocialLoginController> {
  const SocialLoginPage({Key? key}) : super(key: key);

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
          _getLoginButton()
        ],
      ),
    );
  }
Widget _getLoginButton(){
    return Center(
      child: ElevatedButton(
        onPressed: (){
          controller.signInWithGoogle();
        },
        child: Text("Login With Google"),
      ),
    );
}

}
