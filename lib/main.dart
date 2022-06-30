// ignore_for_file: avoid_print

import 'package:erpxmobile/dt.dart';
import 'package:erpxmobile/mydt.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'Nunito'),
      debugShowCheckedModeBanner: false,
      initialRoute: 'mydt',
      routes: {
        'logo': (context) => const SaveRunminutesTable(),
        'mydt': (context) => const MyDt(),
      },
    ),
  );
}
