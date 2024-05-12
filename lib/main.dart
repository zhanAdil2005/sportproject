import "package:flutter/material.dart";
import 'package:flutter_sport_adil/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Adil Sport',
      theme: ThemeData(
      ),
      home: HomeScreen(), // Этот вызов вызывает ошибку
    );
  }
}