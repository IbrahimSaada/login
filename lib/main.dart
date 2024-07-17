import 'package:flutter/material.dart';
import 'package:login2/logo.dart';

void main() {
  runApp(const MyApp());
}

// u can also make this command to add const to all ur files
class MyApp extends StatelessWidget {
 
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  DebugShowCheckedModeBanner : false;
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}