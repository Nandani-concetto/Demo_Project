import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/wildcard_matching_controller.dart';

class WildcardPage extends GetView<WildcardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wildcard Matching"),
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
            _getButton(context),
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
          keyboardType: TextInputType.text,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp("[a-z]")),
          ],
          controller: controller.firstController,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue)),
              labelText: "Enter Value",
            hintText: "Hint:-abcd.."
          ),
        ),
      ),
    );
  }

  Widget _getTextFieldOfSum() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: Center(
        child: TextFormField(
          keyboardType: TextInputType.text,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp("[a-z*?]")),
          ],
          controller: controller.secondController,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue)),
              labelText: "Enter Value",
              hintText: "Hint:-abcd.."
          ),
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
            wildcard();
          },
          child: Center(
            child: Text("Click"),
          ),
        ),
      ),
    );
  }

  wildcard() {
    var str = controller.firstController.text.split(" ").join("");
    print(str);
    var pattern = controller.secondController.text.split(" ").join("");
    print(pattern);
    int s = 0, p = 0, match = 0, starIdx = -1;
    if(str.length>=pattern.length){
    while (s < str.length) {
      if (p < pattern.length  && (pattern[p] == '?' || str[s] == pattern[p])){
        s++;
        p++;
      }
      else if (p < pattern.length&& pattern[p] == '*'){
        starIdx = p;
        match = s;
        p++;
      }
      else if (starIdx != -1){
        p = starIdx + 1;
        match++;
        s = match;

      }
      else {
        controller.outputList.clear();
        controller.outputList.add("false");
       return print(false);
      }
    }
    print(true);
    controller.outputList.clear();
    controller.outputList.add("true");
    }
    else if(pattern=="*"){
      print(true);
      controller.outputList.clear();
      controller.outputList.add("true");
    }
    else{
      print(false);
      controller.outputList.clear();
      controller.outputList.add("false");
    }

    while (p < pattern.length&& pattern[p]== '*') {
      p++;
      return p == pattern;
    }


  }

  Widget _getPrintNewList() {
    return Obx(() => Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Text("Wildcard Matching is :-  ${controller.outputList.join()}"),
        ));
  }
}
