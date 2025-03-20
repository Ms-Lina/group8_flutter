import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(const ShoeVogueApp());
}

class ShoeVogueApp extends StatelessWidget {
  const ShoeVogueApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShoeVogue',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const HomePage(),
    );
  }
}
