import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_two_sorted_list_controller.dart';

class AddTwoListPage extends GetView<AddTwoListController> {
  var result, result1, result2;

  @override
  Widget build(BuildContext context) {
    controller.outputList.clear();
    controller.finalList.clear();
    controller.controllers.clear();
    return Scaffold(
      appBar: AppBar(
        title: Text("Merge List"),
        centerTitle: true,
        backgroundColor: Colors.grey[700],

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  Obx(
                    () => ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: controller.dropdownValue.value,
                        itemBuilder: (BuildContext context, int index) {
                          return _getNewTextField();
                        }),
                  ),
                  _getButton(),
                  _getPrintNewList()
                ],
              ),
            ),
            //_getButton(),
            //_getPrintNewList()
          ],
        ),
      ),
    );
  }

  Widget _getNewTextField() {
    var textController = new TextEditingController();
    controller.controllers.add(textController);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: Center(
        child: TextFormField(
          onChanged: (value){
            controller.outputList.clear();
            controller.finalList.clear();
          },
          controller: textController,
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
            controller.outputList.clear();
            ascending();
          },
          child: Center(
            child: Text("Click"),
          ),
        ),
      ),
    );
  }

  String ascending() {
    for (var i = 0; i < controller.controllers.length; i++) {
      result = controller.controllers[i].text.toLowerCase().split(',');
      controller.outputList.addAll(result);
      print(result);
    }
    print("All List Merged :-${controller.outputList}");
    controller.outputList.remove("");
    var input = controller.outputList;
    String temp = "";
    for (var i = 0; i < input.length; i++) {
      for (var j = 0; j < (input.length - 1); j++) {
        if (int.parse(input[j]) > int.parse(input[j + 1])) {
          temp = input[j];
          input[j] = input[j + 1];
          input[j + 1] = temp;
        }
      }
    }
    controller.finalList.clear();
    controller.finalList.add(input);
    print(" Sorted List:- ${controller.finalList.join()}");
    return input.join();
  }

  Widget _getPrintNewList() {
    return Obx(() => Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Text("Sorted List :-  " + controller.finalList.join()),
        ));
  }
}

// mergeList(){
//   var f=controller.firstListController.text.toLowerCase().split('');
//   var s=controller.secondListController.text.toLowerCase().split('');
//   print(f);
//   print(s);
//   var result=f+s;
//   result.sort();
//   print(result);
//   controller.outputList.value=result;
// }
