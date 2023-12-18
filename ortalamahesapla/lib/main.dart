import 'package:flutter/material.dart';
import 'package:ortalamahesapla/widgets/ortalama_hesaplama_page.dart';
import 'package:ortalamahesapla/Sabitler/sabitler.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Sabitler.anaRenk),
      home: OrtalamaHesaplamaPage(),
    );
  }
}