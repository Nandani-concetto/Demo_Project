import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/parentheses_controller.dart';

class ParenthesesPage extends GetView<ParenthesesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Parentheses Combination"),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [Form(child: _getTextField()), _getButton(),_getOutput()],
        ),
      ),
    );
  }

  Widget _getTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: Center(
        child: TextFormField(
          keyboardType: TextInputType.number,
          controller: controller.parenthesesController,
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
            printParenthesis();
          },
          child: Center(
            child: Text("Click"),
          ),
        ),
      ),
    );
  }

  void printParenthesis() {
    int n = int.parse(controller.parenthesesController.text);
    List<String> str = [];
    controller.output.clear();
    _printParenthesis(n, str, 0, 0, "");
  }

  void _printParenthesis(
      int n, List<String> str, int open, int close, String ans) {
    if (open == n && close == n) {
      controller.output.add(ans);
      print(str.join());
      return;
    }
    if (open == close) {
      _printParenthesis(n, str, open + 1, close, ans + "(");
    } else if (open > close) {
      if (open == n) {
        _printParenthesis(n, str, open, close + 1, ans + ")");
      } else {
        _printParenthesis(n, str, open + 1, close, ans + "(");
        _printParenthesis(n, str, open, close + 1, ans + ")");
      }
    }
  }
  Widget _getOutput() {
    return Obx(() => Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child:
      Text("All Combinations :-  " "\n\n" + controller.output.string),
    ));
  }
}
