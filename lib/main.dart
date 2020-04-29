import 'package:flutter/material.dart';
import 'screens/searchscreen.dart';
void main() => runApp(CineBot());

class CineBot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SearchScreen(),
    );
  }
}
