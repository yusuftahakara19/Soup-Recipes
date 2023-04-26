import 'package:corba_tarifleri/admob_islemleri.dart';
import 'package:corba_tarifleri/models/corba.dart';
import 'package:corba_tarifleri/utils/Strings.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

class CorbaListesi extends StatefulWidget {
  static List<Corba> tumCorbalar;
  static int basilmaSayisi = 0;

  @override
  _CorbaListesiState createState() => _CorbaListesiState();
}

class _CorbaListesiState extends State<CorbaListesi> {
  BannerAd myBannerAd;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AdmobIslemleri.admobInitialize();
    myBannerAd = AdmobIslemleri.buildBannerAd();
    // myBannerAd.load();
  }

  @override
  void dispose() {
    myBannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    myBannerAd
      ..load()
      ..show();
    CorbaListesi.tumCorbalar = veriKaynaginiHazirla();
    return Scaffold(
      appBar: AppBar(
        title: Text("Çorba Tarifleri"),
      ),
      body: Column(
        children: [
          Expanded(child: listeyiHazirla()),
          SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }

  int index = 0;

  List<Corba> veriKaynaginiHazirla() {
    List<Corba> corbalar = [];
    for (int i = 0; i < Strings.CORBA_ADLARI.length; i++) {
      String kucukResim = "kucuk" + "${i + 1}.jpg";
      String buyukResim = "buyuk" + "${i + 1}.jpg";
      Corba eklenecekCorba = Corba(
        Strings.CORBA_ADLARI[i],
        Strings.CORBA_DETAY[i],
        kucukResim,
        buyukResim,
      );
      corbalar.add(eklenecekCorba);
    }
    return corbalar;
  }

  Widget listeyiHazirla() {
    return ListView.builder(
      itemBuilder: (context, int index) {
        return tekSatirCorbaWidget(context, index);
      },
      itemCount: CorbaListesi.tumCorbalar.length,
    );
  }

  Widget tekSatirCorbaWidget(BuildContext context, int index) {
    Corba oAnListeyeEklenecekCorba = CorbaListesi.tumCorbalar[index];
    return Card(
      elevation: 10,
      child: ListTile(
        onTap: () => {
          Navigator.pushNamed(context, "/corbaDetay/$index"),
          AdmobIslemleri.kacKereBasildi++,
        },
        leading: Image.asset(
          "images/${oAnListeyeEklenecekCorba.corbaKucukResim}",
          fit: BoxFit.cover,
          width: 64,
          height: 64,
        ),
        title: Text(
          "${oAnListeyeEklenecekCorba.corbaAdi}",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange),
        ),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
