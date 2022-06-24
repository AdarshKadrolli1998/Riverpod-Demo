import 'package:flutter/material.dart';

class IconModel {
  final int sizes;
  final Color newColor;

  const IconModel({
    this.sizes = 40,
    this.newColor = Colors.black,
  });

  IconModel copy({
    int? sizes,
    Color? newColor,
  }) =>
      IconModel(
        sizes: sizes ?? this.sizes,
        newColor: newColor ?? this.newColor,
      );
}