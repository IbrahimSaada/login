import 'package:flutter/material.dart';
import 'package:login2/logo.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false, // Add this line to remove the debug watermark
      home: const SplashScreen(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(); // This widget is not used, so I replaced it with an empty Container
  }
}