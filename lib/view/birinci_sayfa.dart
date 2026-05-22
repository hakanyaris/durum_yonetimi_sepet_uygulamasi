import 'package:durum_yonetimi_sepet_uygulamasi/model/Urun.dart';
import 'package:durum_yonetimi_sepet_uygulamasi/view/sepet_sayfasi.dart';
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
          IconButton(
            icon: Consumer<AlisverisViewModel>(
              builder: (context, viewModel, child) {
                return Badge(
                  label: Text(viewModel.sepettekiUrunSayisi.toString()),
                  child: viewModel.sepettekiUrunSayisi == 0
                      ? Icon(Icons.shopping_basket_outlined)
                      : Icon(Icons.shopping_basket, color: Colors.green),
                );
              },
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SepetSayfasi();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Consumer<AlisverisViewModel>(
      builder: (context, viewModel, child) {
        return Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Consumer<AlisverisViewModel>(
                    builder: (context, viewModel, child) {
                      return Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(viewModel.favorilerMap[1].toString()),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(viewModel.favorilerMap[2].toString()),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(viewModel.favorilerMap[3].toString()),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.urunler.length,
                itemBuilder: (context, index) {
                  return ChangeNotifierProvider.value(
                    value: viewModel.urunler[index],
                    child: _buildListItem(index),
                  );
                },
              ),
            ),
          ],
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
          trailing: ElevatedButton(
            style: ElevatedButton.styleFrom(
              // Ürünün sepette olma durumuna göre rengini dinamik değiştiriyoruz
              backgroundColor: urun.sepetteMi ? Colors.red : Colors.blue,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              // Butona basıldığında Urun modelindeki fonksiyon çalışır ve durumu değiştirir
              context.read<AlisverisViewModel>().sepetDurumunuDegistir(
                urun.sepetteMi,
                index,
              );
            },
            // Ürünün sepet durumuna göre butonun yazısını dinamik ayarlıyoruz
            child: Text(urun.sepetteMi ? "Sepetten Çıkar" : "Sepete Ekle"),
          ),
        );
      },
    );
  }
}
