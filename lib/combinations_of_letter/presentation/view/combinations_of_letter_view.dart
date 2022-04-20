import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/combinations_of_letters_controller.dart';

class LetterCombinationsPage extends GetView<LetterCombinationsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Letter Combinations"),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [Form(child: _getTextField()), _getButton(), _getOutput()],
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
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp("^[2-9]*"))
          ],
          controller: controller.numberController,
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
            myRecursiveCall();
          },
          child: Center(
            child: Text("Click"),
          ),
        ),
      ),
    );
  }

  List<String> list1 = [];
  late Map<String, List<String>> someMap;

  List<String> recursive(List<String> list1, List<String> list2) {
    List<String> outputList = [];
    for (var firstValue in list1) {
      for (var secondValue in list2) {
        outputList.add(firstValue + secondValue);
      }
    }
    return outputList;
  }

  void myRecursiveCall() {
    var input = controller.numberController.text.toLowerCase().split('');
    list1 = input;
    int count = 0;
    List<String> output = [];
    someMap = {
      '2': ["a", 'b', 'c'],
      '3': ['d', 'e', 'f'],
      '4': ['g', 'h', 'i'],
      '5': ['j', 'k', 'l'],
      '6': ['m', 'n', 'o'],
      '7': ['p', 'q', 'r', 's'],
      '8': ['t', 'u', 'v'],
      '9': ['w', 'x', 'y', 'z'],
    };

    while (count != list1.length) {
      print(list1.length);
      if (list1.length == 1) {
        output = someMap[list1[count]]!;
        count++;
      } else {
        if (output.isEmpty) {
          output = recursive(someMap[list1[count]]!, someMap[list1[++count]]!);
        } else {
          output = recursive(output, someMap[list1[count]]!);
        }
        count++;
      }
    }
    controller.output.value = output;
    print(output.length);
  }

  Widget _getOutput() {
    return Obx(() => Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child:
              Text("All Combinations :-  " "\n\n" + controller.output.string),
        ));
  }
}

// combination() {
//   var input = controller.numberController.text.toLowerCase().split('');
//   list1 = input;
//   print(list1);
//    someMap = {
//     '2': ["a", 'b', 'c'],
//     '3': ['d', 'e', 'f'],
//     '4': ['g', 'h', 'i'],
//     '5': ['j', 'k', 'l'],
//     '6': ['m', 'n', 'o'],
//     '7': ['p', 'q', 'r', 's'],
//     '8': ['t', 'u', 'v'],
//     '9': ['w', 'x', 'y', 'z'],
//   };
//   List<String>? firstSet;
//   if (list1.isNotEmpty) {
//     firstSet = someMap[list1[0]];
//   }
//   List<String>? secondSet;
//   if (list1.length > 1) {
//     secondSet = someMap[list1[1]];
//   }
//   List<String>? thirdSet;
//   if (list1.length > 2) {
//     thirdSet = someMap[list1[2]];
//   }
//   List<String>? fourthSet;
//   if (list1.length > 3) {
//     fourthSet = someMap[list1[3]];
//   }
//   List<String>? fifthSet;
//   if (list1.length > 4) {
//     fifthSet = someMap[list1[4]];
//   }
//   List<String>? sixthSet;
//   if (list1.length > 5) {
//     sixthSet = someMap[list1[5]];
//   }
//   List<String>? seventhSet;
//   if (list1.length > 6) {
//     seventhSet = someMap[list1[6]];
//   }
//   List<String>? eighthSet;
//   if (list1.length > 7) {
//     eighthSet = someMap[list1[7]];
//   }
//
//   controller.output.clear();
//
//   firstSet?.forEach((firstValue) {
//     if (list1.length > 1) {
//       secondSet?.forEach((secondValue) {
//         if (list1.length == 2) {
//           controller.output.add(firstValue + secondValue);
//         }
//         if (list1.length > 2) {
//           thirdSet?.forEach((thirdValue) {
//             if (list1.length == 3) {
//               controller.output.add(firstValue + secondValue + thirdValue);
//             }
//             if (list1.length > 3) {
//               fourthSet?.forEach((fourthValue) {
//                 if (list1.length == 4) {
//                   controller.output.add(
//                       firstValue + secondValue + thirdValue + fourthValue);
//                 }
//                 if (list1.length > 4) {
//                   fifthSet?.forEach((fifthValue) {
//                     if (list1.length == 5) {
//                       controller.output.add(firstValue +
//                           secondValue +
//                           thirdValue +
//                           fourthValue +
//                           fifthValue);
//                     }
//                     if (list1.length > 5) {
//                       sixthSet?.forEach((sixthValue) {
//                         if (list1.length == 6) {
//                           controller.output.add(firstValue +
//                               secondValue +
//                               thirdValue +
//                               fourthValue +
//                               fifthValue +
//                               sixthValue);
//                         }
//                         if (list1.length > 6) {
//                           seventhSet?.forEach((seventhValue) {
//                             if (list1.length == 7) {
//                               controller.output.add(firstValue +
//                                   secondValue +
//                                   thirdValue +
//                                   fourthValue +
//                                   fifthValue +
//                                   sixthValue +
//                                   seventhValue);
//                             }
//                             if (list1.length > 7) {
//                               eighthSet?.forEach((eightValue) {
//                                 if (list1.length == 8) {
//                                   controller.output.add(firstValue +
//                                       secondValue +
//                                       thirdValue +
//                                       fourthValue +
//                                       fifthValue +
//                                       sixthValue +
//                                       seventhValue +
//                                       eightValue);
//                                 }
//                               });
//                             }
//                           });
//                         }
//                       });
//                     }
//                   });
//                 }
//               });
//             }
//           });
//         }
//       });
//     } else {
//       controller.output.add(firstValue);
//     }
//   });
//   print(controller.output);
// }
