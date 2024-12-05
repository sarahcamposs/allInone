
// Main entry point for the app
import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() {
  runApp(AllinOneApp());
}

class AllinOneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AllinOne',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
      ),
      home: HomeScreen(),
    );
  }
}
