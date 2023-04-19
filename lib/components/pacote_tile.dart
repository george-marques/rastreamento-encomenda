import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rastrear_encomenda/models/pacote.dart';
import 'package:rastrear_encomenda/views/form_view.dart';

class PacoteTile extends StatelessWidget {
  final Pacote pacote;

  const PacoteTile(this.pacote);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.qr_code),
      title: Text(pacote.codigo),
      subtitle: Text(pacote.nome),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CadastroForm(),
                  ),
                );
              },
              color: Colors.blueAccent,
              icon: Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {},
              color: Colors.red,
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
