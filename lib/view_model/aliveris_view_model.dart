import 'package:durum_yonetimi_sepet_uygulamasi/model/Urun.dart';
import 'package:flutter/material.dart';

class AliverisViewModel with ChangeNotifier{
  List<Urun> urunler = [];
  AliverisViewModel() {
    for (int a = 0; a <= 5; a++) {
      Urun urun = Urun(a, "Ürün $a ", a + 500, false);
      urunler.add(urun);
    }
  }

  List<Urun> get sepetListesi {
    return sepetListesi.where((urun) {
      return urun.sepetteMi;
    }).toList();
  }

  int get toplamTutar{return  sepetListesi.fold(0, (toplam, urun) => toplam + urun.fiyat);}

  int get sepettekiUrunSayisi{return sepetListesi.length;}
}
