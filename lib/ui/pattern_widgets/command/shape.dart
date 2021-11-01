import 'package:flutter/material.dart';

class Shape {
  late Color color;
  late double height;
  late double width;

  Shape.initial() {
    color = Colors.black;
    height = 150;
    width = 150;
  }
}