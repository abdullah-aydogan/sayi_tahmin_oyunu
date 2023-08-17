import 'package:flutter/material.dart';
import 'package:sayi_tahmin_uygulamasi/AnaEkran.dart';

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
      home: AnaEkran(),
    );
  }
}