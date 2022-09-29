import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  MediaQueryData get query => MediaQuery.of(this);

  Size get size => query.size;

  double get height => size.height;

  double get width => size.width;

  double perWidth(double per) => per * width / 100;

  double perHeight(double per) => per * height / 100;

  TextTheme get textTheme => Theme.of(this).textTheme;
}
