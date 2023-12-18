import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Sabitler/sabitler.dart';
import '../helper/data_helper.dart';

class DropDownKrediNotu extends StatefulWidget {
  final Function onSecilenKredi;
  const DropDownKrediNotu({required this.onSecilenKredi, super.key});

  @override
  State<DropDownKrediNotu> createState() => _DropDownKrediNotuState();
}

class _DropDownKrediNotuState extends State<DropDownKrediNotu> {
  double secilenKrediDegeri = 1;
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
                child: Text("Kredi Notu", style: GoogleFonts.quicksand(fontSize: 10, fontWeight: FontWeight.w600),),),
              DropdownButton<double>(
                value: secilenKrediDegeri,
                onChanged: (deger) {
                  setState(() {
                    secilenKrediDegeri = deger!;
                    widget.onSecilenKredi(deger);
                  });
                },
                underline: SizedBox(),
                items: DataHelper.tumKrediler(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
