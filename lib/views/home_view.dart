import 'package:flutter/material.dart';
import 'package:rastrear_encomenda/components/pacote_tile.dart';
import 'package:rastrear_encomenda/data/dummy_pacotes.dart';
import 'package:rastrear_encomenda/views/form_view.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const encomendas = {...DUMMY_PACOTES};
    return Scaffold(
      appBar: AppBar(
        title: Icon(Icons.home),
      ),
      body: ListView.builder(
          itemCount: encomendas.length,
          itemBuilder: (ctx, i) => PacoteTile(encomendas.values.elementAt(i))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CadastroForm(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
