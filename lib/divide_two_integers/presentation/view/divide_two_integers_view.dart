import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/duplicate.dart';
import '../controllers/divide_two_integers_controller.dart';

class DividePage extends GetView<DivideController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Duplicate Value"),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              child: Column(
                children: [_getFirstTextField(), _getSecondTextField()],
              ),
            ),
            _getButton(),
            _getPrintNewList()
          ],
        ),
      ),
    );
  }

  Widget _getFirstTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: Center(
        child: TextFormField(
          keyboardType: TextInputType.number,
          controller: controller.firstController,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue)),
              labelText: "Enter First Value"),
        ),
      ),
    );
  }

  Widget _getSecondTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: Center(
        child: TextFormField(
          keyboardType: TextInputType.number,
          controller: controller.secondController,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue)),
              labelText: "Enter Second Value"),
        ),
      ),
    );
  }

  Widget _getButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SizedBox(
        width: 100,
        height: 40,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.grey[700]),
          onPressed: () {
            divide();
          },
          child: Center(
            child: Text("Click"),
          ),
        ),
      ),
    );
  }

  divide() {
    int f = int.parse(controller.firstController.text);
    int s = int.parse(controller.secondController.text);
    print(" dividend :- $f");
    print("divisor :- $s");
    int sign = ((f < 0) ^ (s < 0)) ? -1 : 1;
    int diff = 0, count = 0;
    if (s == 0) {
      print("Error");
      controller.output.value="Division is Not Possible".toLowerCase().split('');
    }
    if (s != 0) {
      f = f.abs();
      s = s.abs();
      while (f >= s) {
        diff = f - s;
        f = diff;
        count++;
      }
      var result=count*sign;
      print(" Division is:- $result");
      print(" Carry is:- $f");
      controller.output.clear();
      controller.output.value=result.toString().toLowerCase().split('');
      controller.carry.value=f.toString().toLowerCase().split('');
    }
  }
  Widget _getPrintNewList() {
    return Obx(() => Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Column(
        children: [
          Text("Division is :  " + controller.output.join()),
          Text("Carry is :  " + controller.carry.join()),
        ],
      ),
    ));
  }
}
