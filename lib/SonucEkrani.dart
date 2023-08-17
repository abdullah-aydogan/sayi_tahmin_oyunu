import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SonucEkrani extends StatefulWidget {

  bool sonuc;
  int sayi;

  SonucEkrani({required this.sonuc, required this.sayi});

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> with TickerProviderStateMixin {

  late AnimationController animasyonKontrol;
  late Animation<double> translateX;
  late Animation<double> rotateDegerleri;

  @override
  void initState() {

    super.initState();
    animasyonKontrol = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);

    translateX = Tween(begin: 0.0, end: -20.0).animate(animasyonKontrol)
      ..addListener(() {
          setState(() {

          });
      });

    rotateDegerleri = Tween(begin: 0.0, end: pi/4).animate(animasyonKontrol)
      ..addListener(() {
          setState(() {

          });
      });

    animasyonKontrol.repeat(reverse: true);
  }

  @override
  void dispose() {

    super.dispose();
    animasyonKontrol.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.deepPurple,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(widget.sonuc ? "TEBRİKLER :)" : "Bilemediniz - Sayı : ${widget.sayi}",style: const TextStyle(color: Colors.white, fontSize: 22)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                widget.sonuc ? Transform.rotate(
                    child: Image.asset("resimler/mutlu_resim.png"),
                    angle: rotateDegerleri.value,
                ) : Image.asset("resimler/uzgun_resim.png"),
                SizedBox(height: 20),
                Text(widget.sonuc ? "Kazandınız" : "Kaybettiniz", style: const TextStyle(color: Colors.white, fontSize: 36)),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Transform.translate(
          offset: Offset(translateX.value, 0.0),
          child: FloatingActionButton.extended(
            label: Text("TEKRAR OYNA", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            backgroundColor: Colors.orange,
            icon: Icon(Icons.replay, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}