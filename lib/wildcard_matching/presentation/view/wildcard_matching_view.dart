import 'dart:core';
import 'package:flutter/material.dart';
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
          controller: controller.firstController,
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
          controller: controller.secondController,
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
    var s = controller.firstController.text;
    print(s);
    var p = controller.secondController.text;
    print(p);
   if(s==p){
     print(true);
    }
   else{
     if(p.contains("*")) {
       print(true);
     }
     else if(p.contains("?")){
       for(var i=0;i<p.length;i++){
         s.contains(p[i]);
         print("test");
       }
     }
     else{
       print(false);
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
