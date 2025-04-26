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
        body: Column(
          children: [
            Text(100.00.inr),
            Text(100.00.usd),
            Text(100.00.euro),
            Text(100.00.pound),
            Text(100.00.yen),
            Text(100.00.tur)
          ],
        ),
      ),
    );
  }
}

extension DoubleExtension on double {
  String get inr => "₹ $this";
  String get usd => "\$ $this";
  String get euro => "€ $this";
  String get pound => "£ $this";
  String get yen => "¥ $this";
  String get tur => "₺ $this";
}
