import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../models/duplicate.dart';
import '../controllers/heart_animation_controller.dart';
import 'heart_animation_container_widget.dart';

class HeartAnimationPage extends GetView<HeartAnimationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Heart Animation"),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: (){
              controller.onNewLikeCome();
            },
              child: Center(
                child: Image.asset("assets/png/ic_white_heart.png",width: 30,height: 30,),
          )),
          buildPlayGroundForLike()
        ],
      ),
    );
  }
  Widget buildPlayGroundForLike() {
    return HeartAnimationContainerWidget(
      controller,
      Duration(
          minutes: int.tryParse(
              controller.liveStreamDetails?.availableMinutes?.toString() ??
                  "1000") ??
              1000),
    );
  }
}
