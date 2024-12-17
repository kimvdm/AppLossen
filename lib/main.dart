import 'package:applossen/src/core/utils/injections.dart';
import 'package:flutter/material.dart';

import 'src/app.dart';

void main() async {
  await initInjections();
  runApp(const MyApp());
}
