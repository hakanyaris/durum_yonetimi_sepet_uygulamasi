import 'package:durum_yonetimi_sepet_uygulamasi/model/Urun.dart';
import 'package:durum_yonetimi_sepet_uygulamasi/view/sepet_sayfasi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlisverisViewModel with ChangeNotifier {
  List<Urun> urunler = [];
  int _seciliUrun = 4;

  int get seciliUrun => _seciliUrun;

  set seciliUrun(int value) {
    _seciliUrun = value;
    notifyListeners();
  }

  Map<int, String> favorilerMap = {
    1: "Elektronik",
    2: "Giyim",
    3: "Spor",
    4: "Hepsi",
  };
  AlisverisViewModel() {
    for (int a = 0; a <= 8; a++) {
      Urun urun = Urun(a, "Ürün $a ", a + 500, false, false);
      urunler.add(urun);
    }

    urunler[0].kategori = favorilerMap[1].toString();
    urunler[1].kategori = favorilerMap[2].toString();
    urunler[2].kategori = favorilerMap[3].toString();
    urunler[3].kategori = favorilerMap[1].toString();
    urunler[4].kategori = favorilerMap[1].toString();
    urunler[5].kategori = favorilerMap[2].toString();
    urunler[6].kategori = favorilerMap[3].toString();
    urunler[7].kategori = favorilerMap[3].toString();
    urunler[8].kategori = favorilerMap[2].toString();
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

  sepetDurumunuDegistir(Urun urun) {
   urun.sepetteMi = !urun.sepetteMi;
    notifyListeners();
  }

  List<Urun> get filtrelenmisUrun {
    if (seciliUrun == 4) {
      return urunler;
    } else {
      return urunler.where((a) {
        return a.kategori == favorilerMap[seciliUrun];
      }).toList();
    }
  }
}
