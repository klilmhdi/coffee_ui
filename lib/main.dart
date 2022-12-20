import 'package:coffee_ui/pages/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee UI',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark
      ),
      home: const SplashPage(),
    );
  }
}
