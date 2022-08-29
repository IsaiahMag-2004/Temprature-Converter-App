import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends Statefulwidget {
  @override
  build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        ),
    );
  }
}