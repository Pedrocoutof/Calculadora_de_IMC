import 'package:flutter/material.dart';

import 'HomePage.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IMC',
      theme: ThemeData(
        primaryColor: Colors.amber.shade900
      ),
      home: HomePage(),
    );
  }
}