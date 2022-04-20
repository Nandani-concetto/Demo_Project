import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/UnSort_first_last_position_controller.dart';

class UnSortPage extends GetView<UnSortedController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UnSorted Elements"),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: Column(
        children: [
          Form(
              child: Column(
            children: [_getTextField(), _getUTextField()],
          )),
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
          controller: controller.unSortedController,
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

  Widget _getUTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: Center(
        child: TextFormField(
          controller: controller.target,
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
            unsorted();
          },
          child: Center(
            child: Text("Click"),
          ),
        ),
      ),
    );
  }

  unsorted() {
    var input = controller.unSortedController.text.toLowerCase().split(',');
    var s = controller.target.text.toLowerCase().split(' ');
    print(input);
    print("Target is:- ${s.join()}");
    for (var i = 0; i < input.length; i  ++) {
      if (input[i] == s[0]) {
        // ignore: unrelated_type_equality_checks
        if (i != input.lastIndexOf(s[0])) {
          if (input[i] != input[i + 1] && (input[i] != input[i - 1])) {
            print("[$i,$i]");
          }
          else {
            for(var j=i;j<input.length;j++) {
              if(input [i]==input[i+j]) {
                continue;
              }
              else {
                print("[$i,${i + j-1}]");
                i++;
                break;
              }
            }
          }
        }
        else if (input[i] == input.last) {
          print("[$i,$i]");
        }
      }
    }
  }
}
