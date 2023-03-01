import 'package:flutter/material.dart';

SizedBox sizedContainer(Widget child) {
  return SizedBox(
    width: 80.0,
    height: 80.0,
    child: Center(child: child),
  );
}
