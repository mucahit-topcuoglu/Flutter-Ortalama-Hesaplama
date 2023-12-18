import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Sabitler/sabitler.dart';
import '../helper/data_helper.dart';

class DropDownHarfNotu extends StatefulWidget {
  final Function onsecilenHarfDegeri;
  const DropDownHarfNotu({required this.onsecilenHarfDegeri, super.key});

  @override
  State<DropDownHarfNotu> createState() => _DropDownHarfNotuState();
}

class _DropDownHarfNotuState extends State<DropDownHarfNotu> {
  double secilenHarfDegeri = 4;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          alignment: Alignment.center,
          padding: Sabitler.dropDownPadding,
          decoration: BoxDecoration(
            borderRadius: Sabitler.borderRadius,
            color: Sabitler.anaRenk.shade200.withOpacity(0.2),
          ),
          child: Column(
            children: [
              Container(alignment: Alignment.center,
                child: Text("Harf Notu", style: GoogleFonts.quicksand(fontSize: 10, fontWeight: FontWeight.w600),),),
              DropdownButton<double>(
                value: secilenHarfDegeri,
                onChanged: (deger) {
                  setState(
                    () {
                      secilenHarfDegeri = deger!;
                      widget.onsecilenHarfDegeri(secilenHarfDegeri);
                    },
                  );
                },
                underline: SizedBox(),
                items: DataHelper.tumHarfNotlari(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
