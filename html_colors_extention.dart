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
      home: Scaffold(
        backgroundColor: '#ABCD47'.toColor(),
        body: Center(
          child: Text('Hello, World!'),
        ),
      ),
    );
  }
}

extension HTMLColors on String {
  Color toColor() {
    String colorString = this;
    colorString = colorString.toUpperCase().replaceAll("#", "");
    if (colorString.length == 6) {
      colorString = "FF" + colorString;
    }
    if (colorString.length == 8) {
      return Color(int.parse(colorString, radix: 16));
    }
    return Colors.black;
  }
}
