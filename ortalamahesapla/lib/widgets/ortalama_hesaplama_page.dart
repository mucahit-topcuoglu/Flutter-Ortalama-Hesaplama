import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ortalamahesapla/Sabitler/sabitler.dart';
import 'package:ortalamahesapla/helper/data_helper.dart';
import 'package:ortalamahesapla/widgets/ders_listesi.dart';
import 'package:ortalamahesapla/widgets/dropdown_harf.dart';
import 'package:ortalamahesapla/widgets/dropdown_kredi.dart';
import 'package:ortalamahesapla/widgets/ortalamaGoster.dart';

import '../model/dersler.dart';

class OrtalamaHesaplamaPage extends StatefulWidget {
  const OrtalamaHesaplamaPage({super.key});

  @override
  State<OrtalamaHesaplamaPage> createState() => _OrtalamaHesaplamaPageState();
}

class _OrtalamaHesaplamaPageState extends State<OrtalamaHesaplamaPage> {
  double secilenHarfDegeri = 4;
  double secilenKrediDegeri = 1;
  String ders_Adi = "";

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            Sabitler.baslik,
            style: Sabitler.baslikStyle,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _formOlustur(),
                ),
                Expanded(
                  flex: 1,
                  child: OrtalamaGoster(ortalama: DataHelper.ortalamaHesapla(), dersSayisi: DataHelper.tumDersler.length),
                ),
              ],
            ),
            Expanded(
              child: DersListesi(
                onDismiss: (index){
                  setState(() {
                    DataHelper.tumDersler.removeAt(index);
                  });
                },
              ),
            ),
          ],
        ),);
  }

  _formOlustur() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: textFormField(),
          ),
          SizedBox(
            height: 5,
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                DropDownHarfNotu(onsecilenHarfDegeri: (harf){
                  secilenHarfDegeri=harf!;
                }),
                DropDownKrediNotu(onSecilenKredi: (kredi){
                  secilenKrediDegeri=kredi!;
                }),
              IconButton(
                onPressed: _dersEkleveOrtalamaHesapla,
                icon: Icon(Icons.arrow_forward_ios_sharp),
                color: Sabitler.anaRenk,
              ),
            ],
          )
        ],
      ),
    );
  }

  TextFormField textFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
                  ders_Adi = deger!;

        });
      },
      validator: (deger) {
        if (deger!.length <= 0) {
          return "Ders Adı Giriniz.";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Sabitler.anaRenk.shade100.withOpacity(0.2),
        hintText: "Matematik",
        border: OutlineInputBorder(
            borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
      ),
    );
  }


 

  void _dersEkleveOrtalamaHesapla() {
    if(formKey.currentState!.validate())
    {
      formKey.currentState!.save();
      Ders olusturulanDers=Ders(dersAdi: ders_Adi, harfDegeri: secilenHarfDegeri, krediDegeri: secilenKrediDegeri);
      DataHelper.dersEkle(olusturulanDers);
    }
  }
}
