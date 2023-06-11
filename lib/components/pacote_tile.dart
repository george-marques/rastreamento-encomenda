import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rastrear_encomenda/models/pacote.dart';
import 'package:rastrear_encomenda/provider/pacotes.dart';
import 'package:rastrear_encomenda/routes/app_routes.dart';
import 'package:rastrear_encomenda/views/acompanhe_view.dart';

class PacoteTile extends StatelessWidget {
  final Pacote pacote;

  const PacoteTile(this.pacote);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.qr_code),
      title: Text(pacote.codigo),
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RastreioView(),
          ),
        );
      },
      subtitle: Text(pacote.nome),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                    AppRoutes.FORM,
                  arguments: pacote,
                );
              },
              color: Colors.amber,
              icon: Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                showDialog(context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text('Excluir encomenda'),
                      content: Text('Deseja realmente excluir?'),
                      actions: [
                        TextButton(onPressed: () {
                          Navigator.of(context).pop();
                        }, child: Text('Não')),
                        TextButton(onPressed: () {
                          Provider.of<Pacotes>(context, listen: false).remover(pacote);
                          Navigator.of(context).pop();
                        }, child: Text('Sim'))
                      ],
                    ));
              },
              color: Colors.red,
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
