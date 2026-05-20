import 'package:flutter/material.dart';

class Urun with ChangeNotifier{
 final int id;
 final String ad;
 final int fiyat;
 bool _sepetteMi;

  bool get sepetteMi => _sepetteMi;

  set sepetteMi(bool value) {
    _sepetteMi = value;
    
    notifyListeners();
  }
 

 Urun(this.id,this.ad,this.fiyat,this._sepetteMi);



}