import 'package:flutter/material.dart';
import 'package:ortalamahesapla/Sabitler/sabitler.dart';
import 'package:ortalamahesapla/helper/data_helper.dart';

import '../model/dersler.dart';

class DersListesi extends StatelessWidget {
  final Function onDismiss;
  const DersListesi({required this.onDismiss, super.key});

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDerslerD = DataHelper.tumDersler;
    return tumDerslerD.length > 0
        ? ListView.builder(
            itemCount: tumDerslerD.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  onDismiss(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(tumDerslerD[index].dersAdi),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.anaRenk,
                        child: Text(
                          (tumDerslerD[index].harfDegeri *
                                  tumDerslerD[index].krediDegeri)
                              .toStringAsFixed(0),
                        ),
                      ),
                      subtitle: Text(
                          "Kredi Değer: ${tumDerslerD[index].krediDegeri}, Harf Notu: ${tumDerslerD[index].harfDegeri}"),
                    ),
                  ),
                ),
              );
            })
        : Container(
            child: Center(
              child: Text(
                "Lütfen Ders Giriniz",
                style: Sabitler.baslikStyle,
              ),
            ),
          );
  }
}
