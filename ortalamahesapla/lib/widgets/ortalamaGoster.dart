import 'package:flutter/material.dart';
import 'package:ortalamahesapla/Sabitler/sabitler.dart';

class OrtalamaGoster extends StatelessWidget {
  double ortalama;
  int dersSayisi;
  OrtalamaGoster({required this.ortalama, required this.dersSayisi, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0 ? '$dersSayisi Ders Girildi' : 'Ders Seçiniz',
          style: Sabitler.dersSayisiStyle,
        ),
        Text(
          ortalama > 0 ? "${ortalama.toStringAsFixed(2)}" : "0.0",
          style: Sabitler.ortalamaStyle,
        ),
        Text(
          "Ortalama",
          style: Sabitler.dersSayisiStyle,
        ),
      ],
    );
  }
}
