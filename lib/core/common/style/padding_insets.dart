import 'package:flutter/material.dart';

class PaddingInsets {
  static const lowPaddingAll = EdgeInsets.all(4);
  static const normalPaddingAll = EdgeInsets.all(8);
  static const bigPaddingAll = EdgeInsets.all(16);
  static const extraBigPaddingAll = EdgeInsets.all(24);

  static const subLowPaddingVertical = EdgeInsets.symmetric(vertical: 2);
  static const lowPaddingVertical = EdgeInsets.symmetric(vertical: 4);
  static const normalPaddingVertical = EdgeInsets.symmetric(vertical: 8);
  static const bigPaddingVertical = EdgeInsets.symmetric(vertical: 16);

  static const subLowPaddingHorizontal = EdgeInsets.symmetric(horizontal: 2);
  static const lowPaddingHorizontal = EdgeInsets.symmetric(horizontal: 4);
  static const normalPaddingHorizontal = EdgeInsets.symmetric(horizontal: 8);
  static const bigPaddingHorizontal = EdgeInsets.symmetric(horizontal: 16);

  static const normalPaddingHV = EdgeInsets.symmetric(horizontal: 8,vertical: 4);
  static const cardPaddingHV = EdgeInsets.symmetric(horizontal: 12,vertical: 6);
  static const bigPaddingHV = EdgeInsets.symmetric(horizontal: 16,vertical: 6);
  static const profileCardPaddingHV = EdgeInsets.symmetric(horizontal: 8,vertical: 16);
}