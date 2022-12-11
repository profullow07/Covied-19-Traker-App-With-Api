import 'package:covied_19/pages/spalash_screeen.dart';
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
      title: 'Covied Traker 2020',
      theme: ThemeData(
          primaryColor: Colors.white, 
          scaffoldBackgroundColor: Colors.blueGrey),
      home: const SpalashScreen(),
    );
  }
}
