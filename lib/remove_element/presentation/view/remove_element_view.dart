import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/remove_element_controller.dart';

class RemoveElementPage extends GetView<RemoveElementController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Remove Element"),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
                child: Column(
              children: [
                _getTextField(),
                _getValueTextField(),
              ],
            )),
            _getButton(),
            _getPrintNewList()
          ],
        ),
      ),
    );
  }

  Widget _getTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: Center(
        child: TextFormField(
         // keyboardType: TextInputType.number,
          controller: controller.numController,
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

  Widget _getValueTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: Center(
        child: TextFormField(
          controller: controller.valueController,
          keyboardType: TextInputType.number,
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
           removeElement();
          },
          child: Center(
            child: Text("Click"),
          ),
        ),
      ),
    );
  }

  removeElement(){
    var s= controller.numController.text.toLowerCase().split(',');
    var count=0;
    print(s);
    var n=controller.valueController.text;
    print(n);
    for(var i=0;i< s.length;){
      if(s[i]==n) {
        s.remove(s[i]);
        s.add("_");
        count++;
      }
      else {
        i++;
      }
    }
    print("Lenght is:- ${s.length-count}");
    print(s);
    controller.output.clear();
    controller.newList.clear();
    controller.output.add(s);
    controller.newList.add(s.length-count);
  }

  Widget _getPrintNewList() {
    return Obx(() => Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            children: [
              Text("Length is :-  ${controller.newList .join()}"),
              Text("New List :- ${controller.output.join()} "),
            ],
          ),
        ));
  }
}