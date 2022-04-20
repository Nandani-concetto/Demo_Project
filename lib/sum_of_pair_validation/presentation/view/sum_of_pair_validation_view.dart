import 'dart:core';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/sum_of_pair_validation_controller.dart';

class SumOfListPage extends GetView<SumOfListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sum Of List"),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
                child: Column(
              children: [_getTextFieldOfList(), _getTextFieldOfSum()],
            )),
            _getButton(),
            _getPrintNewList()
          ],
        ),
      ),
    );
  }

  Widget _getTextFieldOfList() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: Center(
        child: TextFormField(
          controller: controller.listController,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue)),
              labelText: "Enter Value"),
        ),
      ),
    );
  }

  Widget _getTextFieldOfSum() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: Center(
        child: TextFormField(
          controller: controller.sumController,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue)),
              labelText: "Enter Value"),
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
            sumOfPair();
          },
          child: Center(
            child: Text("Click"),
          ),
        ),
      ),
    );
  }

  sumOfPair() {
    var s = controller.listController.text.toLowerCase().split('');
    int sum = int.parse(controller.sumController.text);
    print(s);
    controller.outputList.clear();
    for (var i = 0; i < s.length; i += 2) {
      if (int.parse(s[i]) + int.parse(s[i+1]) == sum) {
        var h =(s[i] + s[i+1]).toLowerCase().split('');
        print(h);
        controller.outputList.add(h);
      }
    }
  }

  Widget _getPrintNewList() {
    return Obx(() => Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Text("New List :-  " + controller.outputList.join()),
        ));
  }
}
