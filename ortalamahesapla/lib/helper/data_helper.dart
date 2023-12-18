import 'package:flutter/material.dart';

import '../model/dersler.dart';

class DataHelper{

  static List<Ders> tumDersler=[];

  static  dersEkle(Ders eklenecekDers){
    tumDersler.add(eklenecekDers);
  }

  static List<String> _tumDerslerinHarfNotlari()
  {
    List<String> notlar=["AA","BA","BB","CB","CC","DC","DD","FD","FF"];
    return notlar;
  }

  static double ortalamaHesapla()
  {
    double toplamNot=0;
    double toplamKredi=0;

    for(int i=0; i<tumDersler.length;i++)
    {
      toplamNot=toplamNot+(tumDersler[i].krediDegeri*tumDersler[i].harfDegeri);
      toplamKredi+=tumDersler[i].krediDegeri;
    }
    return toplamNot/toplamKredi;
  }

  static List<double> _dersKredileri()
  {
    List<double> krediler=List.generate(10, (index) => index+1);
    return krediler;
  }
  static double _harfleriNotlaraDusurme(String harf)
  {
    double deger;
    switch(harf)
    {
      case "AA":
      deger=4;
      return deger;
      
      case "BA":
      deger=3.5;
      return deger;
      
      case "BB":
      deger=3.0;
      return deger;

      case "CB":
      deger=2.5;
      return deger;
      
      case "CC":
      deger=2.0;
      return deger;
      
      case "DC":
      deger=1.5;
      return deger;
      
      case "DD":
      deger=1.0;
      return deger;
      
      case "FD":
      deger=0.5;
      return deger;
      
      case "FF":
      deger=0.0;
      return deger;

      default:
      deger=1;
      return deger;
    }
  }

  static List<DropdownMenuItem<double>> tumHarfNotlari()
  {
    return _tumDerslerinHarfNotlari().map((e) => DropdownMenuItem<double>(child: Text(e), value: _harfleriNotlaraDusurme(e),)).toList();
  }

  static List<DropdownMenuItem<double>> tumKrediler()
  {
    return _dersKredileri().map((e) => DropdownMenuItem(child: Text(e.toString()), value: e, )).toList();
  }
}