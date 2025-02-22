import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'homescreen.dart';
import 'cardmodel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CardModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yolo Pay',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          titleLarge: TextStyle(color: Colors.white, fontSize: 24), 
          titleMedium: TextStyle(color: Colors.grey[400], fontSize: 16), 
        ),
      ),
      home: HomeScreen(),
    );
  }
}