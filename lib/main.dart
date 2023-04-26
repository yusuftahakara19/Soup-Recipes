import 'package:corba_tarifleri/corba_liste.dart';
import 'package:flutter/material.dart';

import 'corba_detay.dart';

void main() => runApp(MyAppp());

class MyAppp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {
        "/": (context) => CorbaListesi(),
        "/burcListesi": (context) => CorbaListesi(),
      },
      onGenerateRoute: (RouteSettings settings) {
        List<String> pathElemanlari = settings.name.split("/");
        if (pathElemanlari[1] == "corbaDetay") {
          return MaterialPageRoute(
              builder: (context) => CorbaDetay(int.parse(pathElemanlari[2])));
        }
        return null;
      },
      //
      theme: ThemeData(primarySwatch: Colors.red),
      title: "ÇORBA TARİFLERİ",
    );
  }
}
