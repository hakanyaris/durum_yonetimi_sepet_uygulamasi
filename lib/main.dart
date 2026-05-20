import 'package:durum_yonetimi_sepet_uygulamasi/model/Urun.dart';
import 'package:durum_yonetimi_sepet_uygulamasi/view/birinci_sayfa.dart';
import 'package:durum_yonetimi_sepet_uygulamasi/view_model/aliveris_view_model.dart';

import 'package:durum_yonetimi_sepet_uygulamasi/view_model/sepet_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(AnaUygulama());
}

class AnaUygulama extends StatelessWidget {
  const AnaUygulama({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return AlisverisViewModel();
          },
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return SepetViewModel();
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BirinciSayfa(),
      ),
    );
  }
}
