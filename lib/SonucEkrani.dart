import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'TahminEkrani.dart';

class SonucEkrani extends StatefulWidget {

  bool sonuc;
  int sayi;

  SonucEkrani({required this.sonuc, required this.sayi});

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {

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
        title: const Text("Sonuç Ekranı", style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.sonuc ? Image.asset("resimler/mutlu_resim.png") : Image.asset("resimler/uzgun_resim.png"),
            Text(widget.sonuc ? "Kazandınız" : "Kaybettiniz", style: const TextStyle(color: Colors.black54, fontSize: 36)),
            Text(widget.sonuc ? "" : "Sayı : ${widget.sayi}",style: const TextStyle(color: Colors.black54, fontSize: 24)),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: const Text("TEKRAR OYNA", style: const TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TahminEkrani()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
