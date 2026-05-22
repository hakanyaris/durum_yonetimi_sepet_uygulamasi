import 'package:flutter/material.dart';

class Urun with ChangeNotifier {
  final int id;
  final String ad;
  final int fiyat;
  String kategori;
  bool _sepetteMi;

  bool get sepetteMi => _sepetteMi;

  set sepetteMi(bool value) {
    _sepetteMi = value;

    notifyListeners();
  }

  bool _favorilendiMi;

  bool get favorilendiMi => _favorilendiMi;

  set favorilendiMi(bool value) {
    _favorilendiMi = value;
    notifyListeners();
  }

  Urun(
    this.id,
    this.ad,
    this.fiyat,
    this._sepetteMi,
    this._favorilendiMi, {
    this.kategori = "Hepsi",
  });
}
