import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/check_parentheses_controller.dart';
import 'package:stack/stack.dart' as new_stack;

class CheckParenthesesPage extends GetView<CheckParenthesesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Parentheses"),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [Form(child: _getTextField()), _getButton()],
        ),
      ),
    );
  }

  Widget _getTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: Center(
        child: TextFormField(
          //keyboardType: TextInputType.number,
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
            var result=parentheses();
            controller.parenthesesController.text=(result);
            print(result);
          },
          child: Center(
            child: Text("Click"),
          ),
        ),
      ),
    );
  }

  String parentheses() {
    var s = controller.parenthesesController.text.toLowerCase().split('');
    if (s.isEmpty) return "true";
    new_stack.Stack<String> stack = new_stack.Stack<String>();

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(' || s[i] == '{' || s[i] == '[') {
        stack.push(s[i]);
        print("Pushed Stack");
      }
      if (s[i] == ')' || s[i] == '}' || s[i] == ']') {
        if (stack.isEmpty) return "false";
        var temp = stack.pop();
        print("Poped Stack");
        if ((temp == '(' && s[i] == ')') ||
            (temp == '{' && s[i] == '}') ||
            (temp == '[' && s[i] == ']')) {
          continue;
        } else {
          return "false";
        }
      }
    }

    if (stack.isNotEmpty) return "false";
    return "true";
  }
}
