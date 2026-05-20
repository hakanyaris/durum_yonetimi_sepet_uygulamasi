import 'package:durum_yonetimi_sepet_uygulamasi/model/Urun.dart';
import 'package:durum_yonetimi_sepet_uygulamasi/view/sepet_sayfasi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlisverisViewModel with ChangeNotifier {
  List<Urun> urunler = [];
  AlisverisViewModel() {
    for (int a = 0; a <= 5; a++) {
      Urun urun = Urun(a, "Ürün $a ", a + 500, false);
      urunler.add(urun);
    }
  }

  List<Urun> get sepetListesi {
    return urunler.where((urun) {
      return urun.sepetteMi;
    }).toList();
  }

  int get toplamTutar {
    return sepetListesi.fold(0, (toplam, urun) => toplam + urun.fiyat);
  }

  int get sepettekiUrunSayisi {
    return sepetListesi.length;
  }

  sepetDurumunuDegistir(bool sepetteMi, int index) {
    if (!sepetteMi) {
      sepetteMi = true;
      urunler[index].sepetteMi = sepetteMi;
    } else {
      sepetteMi = false;
      urunler[index].sepetteMi = sepetteMi;
    }
    notifyListeners();
  }
}
