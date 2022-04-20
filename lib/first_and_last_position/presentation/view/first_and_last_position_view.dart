import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/duplicate.dart';
import '../controllers/first_and_last_position_controller.dart';

class FirstAndLastPositionPage extends GetView<FirstAndLastPositionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First And Last Position"),
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
            _getButton(context),
            SizedBox(
              height: 20,
            ),
            _getRadioButton(),
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
              labelText: "Enter target"),
        ),
      ),
    );
  }

  Widget _getButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SizedBox(
        width: 100,
        height: 40,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.grey[700]),
          onPressed: () {
            FocusScope.of(context).requestFocus(new FocusNode());
            sort();
            firstAndLastPosition();
          },
          child: Center(
            child: Text("Click"),
          ),
        ),
      ),
    );
  }

  Widget _getRadioButton() {
    return Obx(
      () => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            child: controller.selectedSorted.value == 0
                ? Icon(Icons.radio_button_on)
                : Icon(Icons.radio_button_off),
            onTap: () {
              controller.selectedSorted.value = 0;
              firstAndLastPosition();
              sort();
            },
          ),
          SizedBox(
            width: 10,
          ),
          const Text("Sorted"),
          SizedBox(
            width: 10,
          ),
          InkWell(
            child: controller.selectedSorted.value == 1
                ? Icon(Icons.radio_button_on)
                : Icon(Icons.radio_button_off),
            onTap: () {
              controller.selectedSorted.value = 1;
              firstAndLastPosition();
            },
          ),
          SizedBox(
            width: 10,
          ),
          Text("UnSorted"),
        ],
      ),
    );
  }

  sort() {
    var f = controller.firstController.text.toLowerCase().split(',');
    f.sort();
    controller.sortList.clear();
    controller.sortList.add(f);
  }

  firstAndLastPosition() {
    var f = controller.firstController.text.toLowerCase().split(',');
    var s = controller.secondController.text.toLowerCase().split(' ');
    var input;
    if (controller.selectedSorted.value == 0) {
      f.sort();
      input = f;
    } else if (controller.selectedSorted.value == 1) {
      input = f;
    }
    print(input);
    List<int> result = [];
    int first = -1;
    int last = -1;
    print(input);
    print("Target is:- ${s.join()}");
    for (var i = 0; i < input.length; i++) {
      if (s[0] != input[i]) {
        continue;
      }
      if (first == -1) {
        first = i;
      }
      last = i;
    }
    if (first != -1) {
      print("First And Last Position:- [$first,$last]");
      result.add(first);
      result.add(last);
      controller.output.value = result;
    } else {
      print("[$first,$last]");
      result.add(first);
      result.add(last);
      controller.output.value = result;
    }
  }

  Widget _getPrintNewList() {
    return Obx(() => Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              Text("Sort:- ${controller.sortList.join()}"),
              SizedBox(
                height: 10,
              ),
              Text(
                  "First and Last Position of Element  : ${controller.output} "),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
