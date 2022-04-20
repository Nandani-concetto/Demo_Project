import 'package:get/get.dart';

class ColorModel{
  int id;
  String name;
  RxBool isSelected;
  RxBool? outOfBox;

  ColorModel(this.id, this.name, this.isSelected,{this.outOfBox});
}