import 'package:flutter/material.dart';
import 'myform.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form and Expansion',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyForm(),
    );
  }
}