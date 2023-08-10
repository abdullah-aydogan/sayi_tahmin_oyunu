import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'TahminEkrani.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sayı Tahmin Oyunu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  double ilerleme = 50.0;

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
        title: const Text("Ana Sayfa", style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Sayı Tahmin Oyunu", style: TextStyle(color: Colors.black54, fontSize: 36)),
            Image.asset("resimler/zar_resim.png"),
            Text("Tahmin Aralığı : ${ilerleme.toInt()}", style: TextStyle(color: Colors.black54, fontSize: 20)),
            Slider(
              max: 100,
              min: 1,
              activeColor: Colors.blue,
              value: ilerleme,
              onChanged: (double i) {
                setState(() {
                  ilerleme = i;
                });
              },
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: const Text("OYUNA BAŞLA", style: const TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TahminEkrani(tahminAraligi: ilerleme.toInt())));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
