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
  String yonlendirme = "Tahmininizi giriniz.";
  bool validate = false;

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
          statusBarColor: Colors.blue,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.lightBlue,
        title: const Text("Tahmin Ekranı", style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Kalan Hak : $kalanHak", style: const TextStyle(color: Colors.pink, fontSize: 30)),
            Text(yonlendirme, style: const TextStyle(color: Colors.black54, fontSize: 24)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: tfTahmin,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Tahmin",
                  errorText: validate ? "Tahmin girmediniz." : null,
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
                child: const Text("TAHMİN ET", style: const TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                ),
                onPressed: () {

                  setState(() {

                    if(tfTahmin.text.isEmpty) {
                      validate = true;
                    }

                    else {
                      validate = false;
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
                      yonlendirme = "Tahmininizi azaltın.";
                    });
                  }

                  if(tahmin < rastgeleSayi) {

                    setState(() {
                      yonlendirme = "Tahmininizi arttırın.";
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
