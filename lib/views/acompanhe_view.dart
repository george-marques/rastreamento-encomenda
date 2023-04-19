import 'package:flutter/material.dart';

class RastreioView extends StatelessWidget{
  final List<String> status = [
    'Objeto postado após o horário limite da unidade',
    'Objeto em trânsito para de Unidade de Distribuição',
    'Objeto saiu para entrega ao destinatário',
    'Objeto entregue ao destinatário',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acompanhe'),
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        itemCount: status.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.access_alarms),
            subtitle: Text("UNIDADE DE DISTRIBUIÇÃO - PALMAS/TO"),
            title: Text(status[index]),
          );
        },
      ),
    );
  }
}

