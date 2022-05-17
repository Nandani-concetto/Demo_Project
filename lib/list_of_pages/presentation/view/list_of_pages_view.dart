import 'package:demo_project/common/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/list_of_pages_controller.dart';

class ListOfPage extends GetView<ListOfPagesController> {
  const ListOfPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Examples"),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // InkWell(
            //   child: _getButton("GoogleSignIn"),
            //   onTap: () {
            //  Get.toNamed(RouteName.homePage);
            //   },
            // ),
            InkWell(
              child: _getButton("Heart Animation"),
              onTap: () {
                Get.toNamed(RouteName.heartAnimationPage);
              },
            ),InkWell(
              child: _getButton("Pendulum Animation"),
              onTap: () {
                Get.toNamed(RouteName.pendulumAnimationPage);
              },
            ),
            InkWell(
              child: _getButton("Socket"),
              onTap: () {
             Get.toNamed(RouteName.socketDemoPage);
              },
            ),
            InkWell(
              child: _getButton("Reverse"),
              onTap: () {
             Get.toNamed(RouteName.reverseStringPage);
              },
            ),
            InkWell(
              child: _getButton("Duplicate"),
              onTap: (){
                Get.toNamed(RouteName.duplicatePage);},

            ),
            InkWell(
              child: _getButton("Select CheckBox"),
              onTap: () {
               Get.toNamed(RouteName.checkBoxPage);
              },
            ),
            InkWell(
              child: _getButton("Ascending Order"),
              onTap: () {
               Get.toNamed(RouteName.ascendingOrderPage);
              },
            ),
            InkWell(
              child: _getButton("Social Login"),
              onTap: () {
               Get.toNamed(RouteName.socialLoginPage);
              },
            ),
            InkWell(
              child: _getButton("Roman Number"),
              onTap: () {
               Get.toNamed(RouteName.romanNumberPage);
              },
            ),
            InkWell(
              child: _getButton("Letter Combination"),
              onTap: () {
               Get.toNamed(RouteName.letterCombinationsPage);
              },
            ),
            InkWell(
              child: _getButton("Parentheses Combination"),
              onTap: () {
               Get.toNamed(RouteName.parenthesesPage);
              },
            ),
            InkWell(
              child: _getButton("Parentheses"),
              onTap: () {
               Get.toNamed(RouteName.checkParenthesesPage);
              },
            ),
            InkWell(
              child: _getButton("Remove Node"),
              onTap: () {
               Get.toNamed(RouteName.removeNodePage);
              },
            ),
            InkWell(
              child: _getButton("Merge List"),
              onTap: () {
               Get.toNamed(RouteName.dropDownView);
              },
            ),
            InkWell(
              child: _getButton("Swap Node"),
              onTap: () {
               Get.toNamed(RouteName.swapNodePage);
              },
            ),
            InkWell(
              child: _getButton("Sum Of Pair"),
              onTap: () {
               Get.toNamed(RouteName.sumOfPairsPage);
              },
            ),
            InkWell(
              child: _getButton("Sum Of List"),
              onTap: () {
               Get.toNamed(RouteName.sumOfListPage);
              },
            ),
            InkWell(
              child: _getButton("Count Json Object"),
              onTap: () {
               Get.toNamed(RouteName.countJsonObjectPage);
              },
            ),
            InkWell(
              child: _getButton("Stone Weight"),
              onTap: () {
               Get.toNamed(RouteName.stonePage);
              },
            ),
            InkWell(
              child: _getButton("Zigzag Conversion"),
              onTap: () {
               Get.toNamed(RouteName.zigzagPage);
              },
            ),
            InkWell(
              child: _getButton("Longest Common Prefix"),
              onTap: () {
               Get.toNamed(RouteName.longestCommonPrefixPage);
              },
            ),
            InkWell(
              child: _getButton("Divide Integer"),
              onTap: () {
               Get.toNamed(RouteName.dividePage);
              },
            ),
            InkWell(
              child: _getButton("Test"),
              onTap: () {
               Get.toNamed(RouteName.testPage);
              },
            ),
            InkWell(
              child: _getButton("Find First and Last Position"),
              onTap: () {
               Get.toNamed(RouteName.firstAndLastPositionPage);
              },
            ),
            InkWell(
              child: _getButton("UnSorted Position"),
              onTap: () {
               Get.toNamed(RouteName.unSortPage);
              },
            ),
            InkWell(
              child: _getButton("Reverse Node"),
              onTap: () {
               Get.toNamed(RouteName.reverseNodePage);
              },
            ),
            InkWell(
              child: _getButton("Duplicate Number"),
              onTap: () {
               Get.toNamed(RouteName.duplicateNumberPage);
              },
            ),
            InkWell(
              child: _getButton("Remove Element"),
              onTap: () {
               Get.toNamed(RouteName.removeElementPage);
              },
            ),
            InkWell(
              child: _getButton("First Occurrence From String"),
              onTap: () {
               Get.toNamed(RouteName.indexOfFirstOccurrencePage);
              },
            ),
            InkWell(
              child: _getButton("Median Of The List"),
              onTap: () {
               Get.toNamed(RouteName.medianOfListPage);
              },
            ),
            InkWell(
              child: _getButton("SubString Concatenation"),
              onTap: () {
               Get.toNamed(RouteName.subStringWithConcatenationPage);
              },
            ),
            InkWell(
              child: _getButton("First Missing Positive"),
              onTap: () {
               Get.toNamed(RouteName.firstMissingPositivePage);
              },
            ),
            InkWell(
              child: _getButton("Wildcard Matching"),
              onTap: () {
               Get.toNamed(RouteName.wildcardPage);
              },
            ),
            InkWell(
              child: _getButton("Bold String"),
              onTap: () {
               Get.toNamed(RouteName.boldStringPage);
              },
            ),
            InkWell(
              child: _getButton("Round Scroll"),
              onTap: () {
               Get.toNamed(RouteName.horizontalRoundScrollPage);
              },
            ),

            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
  Widget _getButton(String title) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Container(
          width: 280,
          height: 50,
          decoration: const BoxDecoration(color: Colors.grey),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }


}
