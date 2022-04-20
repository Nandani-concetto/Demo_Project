import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/substring_with_concatenation_controller.dart';

class SubStringWithConcatenationPage
    extends GetView<SubStringWithConcatenationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SubString Concatenation"),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
                child: Column(
              children: [
                _getFirstTextField(),
                _getSecondTextField(),
              ],
            )),
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
            hintText: "barfoothefoobarman"
          ),
        ),
      ),
    );
  }

  Widget _getSecondTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: Center(
        child: TextFormField(
          keyboardType: TextInputType.text,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp("[a-z]")),
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
            hintText: 'foo","bar"'
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
            findAllPermutations();
          },
          child: Center(
            child: Text("Click"),
          ),
        ),
      ),
    );
  }
  List<String> findAllPermutations() {
    var source = controller.secondController.text.toLowerCase().split(',');
    List allPermutations = [];

    void permutate(List list, int cursor) {
      if (cursor == list.length) {
        allPermutations.add(list);
        print(allPermutations);
        return;
      }

      for (int i = cursor; i < list.length; i++) {
        List permutation = List.from(list);
        permutation[cursor] = list[i];
        permutation[i] = list[cursor];
        print(permutation[i]);
        print(permutation);
        print("Length:- ${permutation.length}");
        permutate(permutation, cursor + 1);
      }
    }

    permutate(source, 0);

    List<String> strPermutations = [];
    for (int j = 0; j < allPermutations.length; j++) {
      List permutation = allPermutations[j];
      strPermutations.add(permutation.join());
      print(permutation.join());
    }
    print(strPermutations);
    var s1=controller.firstController.text;
    s1.removeAllWhitespace;
    print("S1:- $s1");
    var result=[];
    for(var k=0;k<strPermutations.length;k++){
      if (s1.contains(strPermutations[k])) {
            result.add(s1.indexOf(strPermutations[k]));
          }
    }
    print(result);
    controller.outputList.clear();
    controller.outputList.add(result);
    return strPermutations;
  }
  Widget _getPrintNewList() {
    return Obx(() => Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Text("Output :-  " + controller.outputList.join()),
    ));
  }
}
