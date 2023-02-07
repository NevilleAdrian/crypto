import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Radii {
  static const BorderRadius k2pxRadius = BorderRadius.all(Radius.circular(2));
  static const BorderRadius k4pxRadius = BorderRadius.all(Radius.circular(4));
  static const BorderRadius k6pxRadius = BorderRadius.all(Radius.circular(6));
  static const BorderRadius k8pxRadius = BorderRadius.all(Radius.circular(8));
  static const BorderRadius k10pxRadius = BorderRadius.all(Radius.circular(10));
  static BorderRadius k12pxRadius = BorderRadius.all(Radius.circular(12.r));
  static const BorderRadius k15pxRadius = BorderRadius.all(Radius.circular(15));
  static const BorderRadius k20pxRadius = BorderRadius.all(Radius.circular(20));
  static const BorderRadius k25pxRadius = BorderRadius.all(Radius.circular(25));
  static const BorderRadius k30pxRadius = BorderRadius.all(Radius.circular(30));
  static const BorderRadius k35pxRadius = BorderRadius.all(Radius.circular(35));

  static const BorderRadius k20TopSymmetricRadius = BorderRadius.only(
      topLeft: Radius.circular(20), topRight: Radius.circular(20));
  static const BorderRadius k15BottomSymmetricRadius = BorderRadius.only(
      bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15));
  static const BorderRadius k15TopSymmetricRadius = BorderRadius.only(
      topLeft: Radius.circular(15), topRight: Radius.circular(15));
}
