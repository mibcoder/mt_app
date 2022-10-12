import 'package:flutter/material.dart';

class AppTheme{
  AppTheme._();
  static const Color primaryColor=Color(0xFF19954D);
  static const Color darkGrayColor=Color(0xFF535A73);

  static OutlineInputBorder outlineInputBorder= OutlineInputBorder(
  borderSide: BorderSide(color: Colors.grey.withOpacity(.2), width: 1.0),
  borderRadius: BorderRadius.all(Radius.circular(4.0)),
  );
  static OutlineInputBorder outlineInputBorder2=const OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFF9F9F9), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(4.0)),
  );
}