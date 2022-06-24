import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'icon_model.dart';

class IconProvider extends StateNotifier<IconModel> {
  IconProvider() : super(const IconModel());

  void minMaxSize(double val) {
    final newState = state.copy(sizes: val.toInt());
    state = newState;
  }

  void colorIcon(String colorName) {
    final newState = colorName == 'Red'
        ? state.copy(newColor: Colors.red)
        : colorName == 'Blue'
        ? state.copy(newColor: Colors.blue)
        : colorName == 'Green'
        ? state.copy(newColor: Colors.green)
        : colorName == 'Orange'
        ? state.copy(newColor: Colors.orange)
        : colorName == 'Purple'
        ? state.copy(newColor: Colors.deepPurple)
        : state.copy(newColor: Colors.brown);
    state = newState;
  }

  void newColorSize(Color? colourName, int? iconS) {
    final newState = state.copy(newColor: colourName, sizes: iconS);
    state = newState;
  }
}