import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EntregueView extends StatefulWidget {
  EntregueView({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<EntregueView> {
  List<dynamic> encomendas = [];

  Future<void> fetchEncomendas() async {
    final response = await http.get(Uri.parse('http://localhost:3000/encomendas'));
    if (response.statusCode == 200) {
      setState(() {
        encomendas = json.decode(response.body);
      });
    } else {
      throw Exception('Falha ao carregar as encomendas');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchEncomendas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Entregues'),
      ),
      body: ListView.builder(
        itemCount: encomendas.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.qr_code),
            title: Text(encomendas[index]['codigo']),
            subtitle: Text(encomendas[index]['nome']),
            trailing: Text('Status: ${encomendas[index]['status']}'),
          );
        },
      ),
    );
  }
}

