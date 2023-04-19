import 'package:flutter/material.dart';
import 'package:rastrear_encomenda/views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rastreio de encomendas',
      home: HomePage(),
    );
  }
}

