import 'package:durum_yonetimi_sepet_uygulamasi/model/Urun.dart';
import 'package:durum_yonetimi_sepet_uygulamasi/view_model/aliveris_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BirinciSayfa extends StatefulWidget {
  const BirinciSayfa({super.key});

  @override
  State<BirinciSayfa> createState() => _BirinciSayfaState();
}

class _BirinciSayfaState extends State<BirinciSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnaSayfa"),
        actions: [
          IconButton(icon: Icon(Icons.shopping_basket), onPressed: () {}),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Consumer<AliverisViewModel>(
      builder: (context, viewModel, child) {
        return ListView.builder(
          itemCount: viewModel.urunler.length,
          itemBuilder: (context, index) {return 
            ChangeNotifierProvider.value(
              value: viewModel.urunler[index],
              child: _buildListItem(index),
            );
          },
        );
      },
    );
  }

  Widget _buildListItem(int index) {
    return Consumer<Urun>(
      builder: (context, urun, child) {
        return ListTile(
          title: Text(urun.ad),
          subtitle: Text("Fiyatı: ${urun.fiyat}"),
          trailing: 
              ElevatedButton(style: ElevatedButton.styleFrom(
              // Ürünün sepette olma durumuna göre rengini dinamik değiştiriyoruz
              backgroundColor: urun.sepetteMi ? Colors.red : Colors.blue,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              // Butona basıldığında Urun modelindeki fonksiyon çalışır ve durumu değiştirir
             context.read<AliverisViewModel>().sepetDurumunuDegistir(urun.sepetteMi,index);
            },
            // Ürünün sepet durumuna göre butonun yazısını dinamik ayarlıyoruz
            child: Text(urun.sepetteMi ? "Sepetten Çıkar" : "Sepete Ekle"),
            
            
          ),
        );
      },
    );
  }
}
