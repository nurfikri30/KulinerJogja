import 'package:flutter/material.dart';
import 'package:kulinerjogja/main_screen.dart';


void main() {
  runApp(KulinerBandungApp());
}

class KulinerBandungApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kuliner Jogja',
      theme: ThemeData(),
      home: MainScreen(),
    );
  }
}

