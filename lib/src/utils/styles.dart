import 'package:flutter/material.dart';

import 'colores.dart';
import 'dimens.dart';

InputDecoration styleTextField({String? counter,String hintText=""}) {
  return InputDecoration(
    counterText: counter,
    hintText: hintText,
    contentPadding: const EdgeInsets.all(12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: Colors.black45,
        width: 2.0,
      ),
    ),
  );
}

BoxDecoration decorationDropdown() {
  return BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colores.colorGrisClaro, width: dimen_size_1),
    borderRadius: BorderRadius.circular(dimen_size_5),
  );
}
