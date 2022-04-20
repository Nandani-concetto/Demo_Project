import 'dart:core';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/stone_weight_controller.dart';

class StonePage extends GetView<StoneController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stone"),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(child: _getTextFieldOfList()),
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
          controller: controller.stoneController,
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
            recursion();
          },
          child: Center(
            child: Text("Click"),
          ),
        ),
      ),
    );
  }
  List<String> s=[];
  recursion() {
    controller.outputList.clear();
     s = controller.stoneController.text.toLowerCase().split('');
     if(s.length>=2) {
       while(s.length>1) {
      stone();
    }
     }
     else{
       print(s.join());
       controller.outputList.value=s;
     }
  }

  stone() {
    List<String> k = [];
    k.clear();
    k.addAll(s);
    k.sort();
    if (k.length >= 2) {
      var firstLargeNumber = k[k.length - 1];
      var secondLargeNumber = k[k.length - 2];
      print("FirstLarge Number : "
          "${firstLargeNumber}"
          " SecondLarge Number:"
          "${secondLargeNumber}");
      if (firstLargeNumber == secondLargeNumber) {
        s.remove(firstLargeNumber);
        s.remove(secondLargeNumber);
        s.join();
        print(s.join());
      } else {
        s.remove(secondLargeNumber);
        var n = s.indexOf(firstLargeNumber);
        firstLargeNumber =
            (int.parse(firstLargeNumber) - int.parse(secondLargeNumber))
                .toString();
        s[n] = firstLargeNumber;
        controller.outputList.value = s;
      }
    }
    else{
      print(k.join());
      controller.outputList.value=k;
    }
    return s.length;
  }

  Widget _getPrintNewList() {
    return Obx(() => Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Text("New List :  " + controller.outputList.join()),
        ));
  }
}

// for (var i = 0; i < s.length; i++) {
//   if (int.parse(s[i]) > int.parse(firstLargeNumber)) {
//     secondLargeNumber = firstLargeNumber;
//     firstLargeNumber = s[i];
//   } else if (int.parse(s[i]) > int.parse(secondLargeNumber)) {
//     secondLargeNumber = s[i];
//   }
//   // else if(int.parse(s[i])<int.parse(firstLargeNumber)){
//   //   print("test");
//   // }
// }
