import 'package:demo_project/UnSort_first_last_position/bindings/UnSort_first_last_position_bindings.dart';
import 'package:demo_project/add_two_sorted_list/bindings/add_two_sorted_list_bindings.dart';
import 'package:demo_project/ascending_order/bindings/ascending_order_bindings.dart';
import 'package:demo_project/combinations_of_letter/bindings/combinations_of_letter_bindings.dart';
import 'package:demo_project/count_duplicate_value/bindings/count_duplicate_value_bindins.dart';
import 'package:demo_project/count_json_object/bindings/count_json_object_bindins.dart';
import 'package:demo_project/divide_two_integers/bindings/divide_two_integers_bindings.dart';
import 'package:demo_project/duplicate_number/bindings/duplicate_number_bindings.dart';
import 'package:demo_project/first_and_last_position/bindings/first_and_last_position_bindings.dart';
import 'package:demo_project/index_of_first_occurrence/bindings/index_of_first_occurrence_bindings.dart';
import 'package:demo_project/median_of_List/bindings/median_of_List_bindings.dart';
import 'package:demo_project/remove_element/bindings/remove_element_bindings.dart';
import 'package:demo_project/reverse_nodes/bindings/reverse_nodes_bindings.dart';
import 'package:demo_project/reverse_string/bindings/reverse_string_bindins.dart';
import 'package:demo_project/roman_number/bindings/roman_number_bindings.dart';
import 'package:demo_project/social_login/bindings/social_login_bindins.dart';
import 'package:demo_project/stone_weight/bindings/stone_weight_bindings.dart';
import 'package:demo_project/substring_with_concatenation/bindings/substring_with_concatenation_bindings.dart';
import 'package:demo_project/sum_of_pairs/bindings/sum_of_pairs_bindings.dart';
import 'package:demo_project/swap_node_of_list/bindings/swap_node_of_list_bindins.dart';
import 'package:demo_project/test/bindings/test_bindins.dart';
import 'package:demo_project/test/presentation/view/drop.dart';
import 'package:demo_project/zigzag_conversion%20/bindings/zigzag_conversion%20_bindins.dart';
import 'package:get/get.dart';

import '../Combinations_of_parentheses/bindings/parentheses_bindings.dart';
import '../Combinations_of_parentheses/presentation/view/parentheses_view.dart';
import '../UnSort_first_last_position/presentation/view/UnSort_first_last_position_view.dart';
import '../add_two_sorted_list/presentation/view/add_two_sorted_list_view.dart';
import '../add_two_sorted_list/presentation/view/drop_down_view.dart';
import '../ascending_order/presentation/view/ascending_order_view.dart';
import '../checked_box/bindings/checked_bindins.dart';
import '../checked_box/presentation/view/checked_view.dart';
import '../combinations_of_letter/presentation/view/combinations_of_letter_view.dart';
import '../count_duplicate_value/presentation/view/count_duplicate_value_view.dart';
import '../count_json_object/presentation/view/count_json_object_view.dart';
import '../divide_two_integers/presentation/view/divide_two_integers_view.dart';
import '../duplicate_number/presentation/view/duplicate_number_view.dart';
import '../first_and_last_position/presentation/view/first_and_last_position_view.dart';
import '../index_of_first_occurrence/presentation/view/index_of_first_occurrence_view.dart';
import '../list_of_pages/bindings/list_of_pages_bindins.dart';
import '../list_of_pages/presentation/view/list_of_pages_view.dart';
import '../longest_common_prefix/bindings/longest_common_prefix_bindings.dart';
import '../longest_common_prefix/presentation/view/longest_common_prefix_view.dart';
import '../median_of_List/presentation/view/median_of_List_view.dart';
import '../parentheses/bindings/check_parentheses_bindings.dart';
import '../parentheses/presentation/view/check_parentheses_view.dart';
import '../remove_element/presentation/view/remove_element_view.dart';
import '../remove_node_from_list/bindings/remove_node_from_list_bindings.dart';
import '../remove_node_from_list/presentation/view/remove_node_from_list_view.dart';
import '../reverse_nodes/presentation/view/reverse_nodes_view.dart';
import '../reverse_string/presentation/view/reverse_string_view.dart';
import '../roman_number/presentation/view/roman_number_view.dart';
import '../social_login/presentation/view/social_login_view.dart';
import '../stone_weight/presentation/view/stone_weight_view.dart';
import '../substring_with_concatenation/presentation/view/substring_with_concatenation_view.dart';
import '../sum_of_pair_validation/bindings/sum_of_pair_validation_bindings.dart';
import '../sum_of_pair_validation/presentation/view/sum_of_pair_validation_view.dart';
import '../sum_of_pairs/presentation/view/sum_of_pairs_view.dart';
import '../swap_node_of_list/presentation/view/swap_node_of_list_view.dart';
import '../test/presentation/view/test_view.dart';
import '../zigzag_conversion /presentation/view/zigzag_conversion _view.dart';

class RouteName {
  static const INITIAL = root;
  static const String root = "/";
  static const String checkBoxPage = "/CheckBoxPage";
  static const String listOfPage = "/ListOfPage";
  static const String duplicatePage = "/DuplicatePage";
  static const String reverseStringPage = "/ReverseStringPage";
  static const String ascendingOrderPage = "/AscendingOrderPage";
  static const String socialLoginPage = "/SocialLoginPage";
  static const String romanNumberPage = "/RomanNumberPage";
  static const String letterCombinationsPage = "/LetterCombinationsPage";
  static const String parenthesesPage = "/ParenthesesPage";
  static const String checkParenthesesPage = "/CheckParenthesesPage";
  static const String removeNodePage = "/RemoveNodePage";
  static const String addTwoListPage = "/AddTwoListPage";
  static const String swapNodePage = "/SwapNodePage";
  static const String sumOfPairsPage = "/SumOfPairsPage";
  static const String sumOfListPage = "/SumOfListPage";
  static const String countJsonObjectPage = "/CountJsonObjectPage";
  static const String stonePage = "/StonePage";
  static const String zigzagPage = "/ZigzagPage";
  static const String longestCommonPrefixPage = "/LongestCommonPrefixPage";
  static const String dividePage = "/DividePage";
  static const String testPage = "/TestPage";
  static const String dropPage = "/DropPage";
  static const String dropDownView = "/DropDownView";
  static const String unSortPage = "/UnSortPage";
  static const String firstAndLastPositionPage = "/FirstAndLastPositionPage";
  static const String reverseNodePage = "/ReverseNodePage";
  static const String duplicateNumberPage = "/DuplicateNumberPage";
  static const String removeElementPage = "/RemoveElementPage";
  static const String indexOfFirstOccurrencePage = "/IndexOfFirstOccurrencePage";
  static const String medianOfListPage = "/MedianOfListPage";
  static const String subStringWithConcatenationPage = "/SubStringWithConcatenationPage";
}

class Routes {
  static final routes = [
    GetPage(
        page: () => CheckBoxPage(),
        name: RouteName.checkBoxPage,
        binding: CheckedBindings()),
    GetPage(
        page: () => ListOfPage(),
        name: RouteName.listOfPage,
        binding: ListOfPagesBindings()),
    GetPage(
        page: () => ReverseStringPage(),
        name: RouteName.reverseStringPage,
        binding: ReverseBindings()),
    GetPage(
        page: () => DuplicatePage(),
        name: RouteName.duplicatePage,
        binding: DuplicateBindings()),
    GetPage(
        page: () => AscendingOrderPage(),
        name: RouteName.ascendingOrderPage,
        binding: AscendingBindings()),
    GetPage(
        page: () => SocialLoginPage(),
        name: RouteName.socialLoginPage,
        binding: SocialLoginBindings()),
    GetPage(
        page: () => RomanNumberPage(),
        name: RouteName.romanNumberPage,
        binding: RomanBindings()),
    GetPage(
        page: () => LetterCombinationsPage(),
        name: RouteName.letterCombinationsPage,
        binding: LetterCombinationsBindings()),
    GetPage(
        page: () => ParenthesesPage(),
        name: RouteName.parenthesesPage,
        binding: ParenthesesBindings()),
    GetPage(
        page: () => CheckParenthesesPage(),
        name: RouteName.checkParenthesesPage,
        binding: CheckParenthesesBindings()),
    GetPage(
        page: () => RemoveNodePage(),
        name: RouteName.removeNodePage,
        binding: RemoveNodeBindings()),
    GetPage(
        page: () => AddTwoListPage(),
        name: RouteName.addTwoListPage,
        binding: AddTwoListBindings()),
    GetPage(
        page: () => SwapNodePage(),
        name: RouteName.swapNodePage,
        binding: SwapNodeBindings()),
    GetPage(
        page: () => SumOfPairsPage(),
        name: RouteName.sumOfPairsPage,
        binding: SumOfPairBindings()),
    GetPage(
        page: () => SumOfListPage(),
        name: RouteName.sumOfListPage,
        binding: SumOfListBindings()),
    GetPage(
        page: () => CountJsonObjectPage(),
        name: RouteName.countJsonObjectPage,
        binding: CountJsonObjectBindings()),
    GetPage(
        page: () => StonePage(),
        name: RouteName.stonePage,
        binding: StoneBindings()),
    GetPage(
        page: () => ZigzagPage(),
        name: RouteName.zigzagPage,
        binding: ZigzagBindings()),
    GetPage(
        page: () => LongestCommonPrefixPage(),
        name: RouteName.longestCommonPrefixPage,
        binding: LongestCommonPrefixBindings()),
    GetPage(
        page: () => DividePage(),
        name: RouteName.dividePage,
        binding: DivideBindings()),
    GetPage(
        page: () => TestPage(),
        name: RouteName.testPage,
        binding: TestBindings()),
    GetPage(
        page: () => DropPage(),
        name: RouteName.dropPage,
        binding: TestBindings()),
    GetPage(
        page: () => DropDownView(),
        name: RouteName.dropDownView,
        binding: AddTwoListBindings()),
    GetPage(
        page: () => FirstAndLastPositionPage(),
        name: RouteName.firstAndLastPositionPage,
        binding: FirstAndLastPositionBindings()),
    GetPage(
        page: () => UnSortPage(),
        name: RouteName.unSortPage,
        binding: UnSortedBindings()),
    GetPage(
        page: () => ReverseNodePage(),
        name: RouteName.reverseNodePage,
        binding: ReverseNodeBindings()),
    GetPage(
        page: () => DuplicateNumberPage(),
        name: RouteName.duplicateNumberPage,
        binding: DuplicateNumberBindings()),
    GetPage(
        page: () => RemoveElementPage(),
        name: RouteName.removeElementPage,
        binding: RemoveElementBindings()),
    GetPage(
        page: () => IndexOfFirstOccurrencePage(),
        name: RouteName.indexOfFirstOccurrencePage,
        binding: IndexOfFirstOccurrenceBindings()),
    GetPage(
        page: () => MedianOfListPage(),
        name: RouteName.medianOfListPage,
        binding: MedianOfListBindings()),
    GetPage(
        page: () => SubStringWithConcatenationPage(),
        name: RouteName.subStringWithConcatenationPage,
        binding: SubStringWithConcatenationBindings()),
  ];
}