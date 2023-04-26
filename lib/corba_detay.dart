import 'package:corba_tarifleri/admob_islemleri.dart';
import 'package:corba_tarifleri/corba_liste.dart';
import 'package:corba_tarifleri/models/corba.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class CorbaDetay extends StatefulWidget {
  int gelenIndex;

  CorbaDetay(this.gelenIndex);

  @override
  CorbaDetayState createState() {
    return new CorbaDetayState();
  }
}

class CorbaDetayState extends State<CorbaDetay> {
  Corba secilenCorba;
  Color baskinRenk;
  PaletteGenerator paletteGenerator;
  InterstitialAd myInterstitialAd;

  @override
  void initState() {
    super.initState();
    secilenCorba = CorbaListesi.tumCorbalar[widget.gelenIndex];
    baskinRengiBul();

    if (AdmobIslemleri.kacKereBasildi % 3 == 0) {
      myInterstitialAd = AdmobIslemleri.buildInterstitialAd();
      myInterstitialAd
        ..load()
        ..show();
    }
  }

  @override
  void dispose() {
    if (myInterstitialAd != null) myInterstitialAd.dispose();
    super.dispose();
  }

  void baskinRengiBul() {
    Future<PaletteGenerator> fPaletGenerator =
        PaletteGenerator.fromImageProvider(
            AssetImage("images/" + secilenCorba.corbaBuyukResim));
    fPaletGenerator.then((value) {
      paletteGenerator = value;
      debugPrint(
          "secilen renk :" + paletteGenerator.dominantColor.color.toString());

      setState(() {
        baskinRenk = paletteGenerator.darkVibrantColor.color;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: baskinRenk != null ? baskinRenk : Colors.red,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "images/" + secilenCorba.corbaBuyukResim,
                fit: BoxFit.cover,
              ),
              centerTitle: true,
              title: Text(secilenCorba.corbaAdi),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.deepOrange.shade100,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: SingleChildScrollView(
                child: Text(secilenCorba.corbaDetayi,
                    style: TextStyle(fontSize: 18, color: Colors.black)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
