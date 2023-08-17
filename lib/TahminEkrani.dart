import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'SonucEkrani.dart';

class TahminEkrani extends StatefulWidget {

  int tahminAraligi;

  TahminEkrani({required this.tahminAraligi});

  @override
  State<TahminEkrani> createState() => _TahminEkraniState();
}

class _TahminEkraniState extends State<TahminEkrani> {

  var tfTahmin = TextEditingController();
  int rastgeleSayi = 0;
  int kalanHak = 5;
  String yonlendirme = "SAYI TAHMİNİNİZİ GİRİNİZ";
  bool validate = false;
  bool azaltArttir = false;
  bool gosterme = false;

  @override
  void initState() {

    super.initState();

    rastgeleSayi = Random().nextInt(widget.tahminAraligi + 1);
    print("Rastgele Sayı : $rastgeleSayi");
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.deepPurple,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Kalan Hak : $kalanHak", style: const TextStyle(color: Colors.white, fontSize: 22)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(yonlendirme, style: const TextStyle(color: Colors.deepPurple, fontSize: 24)),
                gosterme ? azaltArttir ? Image.asset("resimler/up.png") : Image.asset("resimler/down.png")
                    : Center(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: TextField(
                controller: tfTahmin,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Tahmin",
                  errorText: validate ? "Tahmin girmediniz!" : null,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: const Text("TAHMİN ET", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                onPressed: () {
                  setState(() {
                    if(tfTahmin.text.isEmpty) {
                      validate = true;
                    }

                    else {
                      validate = false;
                      gosterme = true;
                      kalanHak = kalanHak - 1;
                      FocusManager.instance.primaryFocus?.unfocus();
                    }
                  });

                  int tahmin = int.parse(tfTahmin.text);

                  if(tahmin == rastgeleSayi) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(sonuc: true, sayi: rastgeleSayi)));
                    return;
                  }

                  if(tahmin > rastgeleSayi) {

                    setState(() {
                      yonlendirme = "SAYIYI AZALTIN";
                      azaltArttir = false;
                    });
                  }

                  if(tahmin < rastgeleSayi) {

                    setState(() {
                      yonlendirme = "SAYIYI ARTTIRIN";
                      azaltArttir = true;
                    });
                  }

                  if(kalanHak == 0) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(sonuc: false, sayi: rastgeleSayi)));
                  }

                  tfTahmin.text = "";
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}