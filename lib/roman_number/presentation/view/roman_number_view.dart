import 'dart:core';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/roman_number_controller.dart';

class RomanNumberPage extends GetView<RomanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Roman Value"),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: Column(
        children: [
          Form(child: _getTextField()),
          _getButton(),
        ],
      ),
    );
  }

  Widget _getTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: Center(
        child: TextFormField(
          controller: controller.romanController,
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
            controller.romanController.text = roman();
          },
          child: Center(
            child: Text("Click"),
          ),
        ),
      ),
    );
  }

  roman() {
    int num = int.parse(controller.romanController.text);
    String convert = "";
    // ignore: unrelated_type_equality_checks
    while (num != 0) {
      if (num >= 1000) {
        convert = convert + "m";
        num -= 1000;
      } else if (num >= 900) // 900 -  cm
      {
        convert = convert + "cm";
        num -= 900;
      } else if (num >= 500) // 500 - d
      {
        convert = convert + "d";
        num -= 500;
      } else if (num >= 400) // 400 -  cd
      {
        convert = convert + "cd";
        num -= 400;
      } else if (num >= 100) // 100 - c
      {
        convert = convert + "c";
        num -= 100;
      } else if (num >= 90) // 90 - xc
      {
        convert = convert + "xc";
        num -= 90;
      } else if (num >= 50) // 50 - l
      {
        convert = convert + "l";
        num -= 50;
      } else if (num >= 40) // 40 - xl
      {
        convert = convert + "xl";
        num -= 40;
      } else if (num >= 10) // 10 - x
      {
        convert = convert + "x";
        num -= 10;
      } else if (num >= 9) // 9 - ix
      {
        convert = convert + "ix";
        num -= 9;
      } else if (num >= 5) // 5 - v
      {
        convert = convert + "v";
        num -= 5;
      } else if (num >= 4) // 4 - iv
      {
        print("$convert+iv");
      } else if (num >= 1) // 1 - i
      {
        convert = convert + "i";
        num -= 1;
      }
    }

    return convert;
  }
}
