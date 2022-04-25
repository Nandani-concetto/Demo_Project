import 'dart:core';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/round_scroll_controller.dart';

class RoundScrollPage extends GetView<RoundScrollController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Round Scroll"),
          centerTitle: true,
          backgroundColor: Colors.grey[700],
        ),
        body: ListView.builder(
            scrollDirection:Axis.horizontal ,
            itemCount: 100,
            itemBuilder: (BuildContext context, int Index) {
              return new Text("$Index");
            }));
  }
}
