import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'TahminEkrani.dart';

class AnaEkran extends StatefulWidget {

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> with TickerProviderStateMixin {

  late AnimationController animasyonKontrol;
  late Animation<double> translateX;

  double ilerleme = 50.0;

  @override
  void initState() {

    super.initState();
    animasyonKontrol = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);

    translateX = Tween(begin: 0.0, end: -20.0).animate(animasyonKontrol)
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
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.deepPurple,
        ),
        title: Text("Sayı Tahmin Oyunu", style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("resimler/numbers.png"),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Belirttiğiniz sayı aralığında tahmin yapın.", style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Sayı Aralığı : ${ilerleme.toInt()}", style: TextStyle(fontSize: 16, color: Colors.white)),
              Slider(
                max: 100,
                min: 1,
                value: ilerleme,
                activeColor: Colors.amber,
                onChanged: (double i) {
                  setState(() {
                    ilerleme = i;
                  });
                },
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Transform.translate(
          offset: Offset(translateX.value, 0.0),
          child: FloatingActionButton.extended(
            label: Text("OYUNA BAŞLA", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            backgroundColor: Colors.orange,
            icon: Icon(Icons.gamepad_outlined, color: Colors.white),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TahminEkrani(tahminAraligi: ilerleme.toInt())));
            },
          ),
        ),
      ),
    );
  }
}