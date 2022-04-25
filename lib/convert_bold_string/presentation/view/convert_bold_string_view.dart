import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/duplicate.dart';
import '../controllers/convert_bold_string_controller.dart';

class BoldStringPage extends GetView<BoldStringController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bold String"),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              child: _getFirstTextField(),
            ),
            _getButton(context),
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
          onChanged: (value) {},
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
            //controller.firstController.text.replaceAll("*", "replace")
            //controller.firstController.text="abc*Nandu*";
            //boldString();
          },
          child: Center(
            child: Text("Click"),
          ),
        ),
      ),
    );
  }

  // boldString() {
  //   List<String> list = [];
  //   List<String> list1 = [];
  //   var regExp = RegExp(r"(\*[^*]+\*)|(\_[^_]+\_)|(\*\-.*\-\*)|(\_\*.*\*\_)");
  //   var str1 = controller.firstController.text;
  //   Iterable matches = regExp.allMatches(str1);
  //   for (var match in matches) {
  //     var test = str1.substring(match.start, match.end);
  //     list.add(test);
  //   }
  //   print(list);
  //   controller.output.clear();
  //   controller.output.add(list.join());
  //   // for (var i = 0; i < list.length; i++) {
  //   //   // list[i] = list[i].replaceAll("_", "");
  //   //   // list[i] = list[i].replaceAll("*", "");
  //   //   print(list[i]);
  //   //
  //   // }
  //   print(controller.output.join());
  // }

  Widget _getPrintNewList() {
    return Obx(() => Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            children: [
              //Text(controller.firstController.text.replaceAll(controller.output.join(), Text("abc"))),
              Text(controller.output.join(),style: TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
        ));
  }
}
