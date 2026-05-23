import 'package:durum_yonetimi_sepet_uygulamasi/model/Urun.dart';
import 'package:durum_yonetimi_sepet_uygulamasi/view_model/aliveris_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SepetSayfasi extends StatefulWidget {
  const SepetSayfasi({super.key});

  @override
  State<SepetSayfasi> createState() => _SepetSayfasiState();
}

class _SepetSayfasiState extends State<SepetSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<AlisverisViewModel>(
          builder: (context, viewModel, child) {
            return Text("Sepetim (${viewModel.sepettekiUrunSayisi})");
          },
        ),
        actions: [
          Consumer<AlisverisViewModel>(
            builder: (context, viewModel, child) {
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text("Toplam : ${viewModel.toplamTutar} TL"),
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
        if (viewModel.sepetListesi.isEmpty) {
          return Center(
            child: Text(
              "Sepetiniz Şu anada Boş",
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
          );
        }
        return ListView.builder(
          itemCount: viewModel.sepetListesi.length,
          itemBuilder: (context, index) => ChangeNotifierProvider.value(
            value: viewModel.sepetListesi[index],
            child: _itemListItem(),
          ),
        );
      },
    );
  }

  Widget _itemListItem() {
    return Consumer<Urun>(
      builder: (context, viewModel, child) {
        return ListTile(
          title: Text(viewModel.ad),
          subtitle: Text("Ürün Fiyatı : ${viewModel.fiyat.toString()}"),
          trailing: ElevatedButton(
            child: Text("Sepetten Çıkar"),
            onPressed: () {
              Provider.of<AlisverisViewModel>(
                context,
                listen: false,
              ).sepetDurumunuDegistir( viewModel);
            },
          ),
        );
      },
    );
  }
}
