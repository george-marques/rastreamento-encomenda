import 'package:flutter/material.dart';
import 'package:rastrear_encomenda/views/home_view.dart';

import '../models/pacote.dart';

class CadastroForm extends StatefulWidget {
  @override
  _CadastroFormState createState() => _CadastroFormState();
}

class _CadastroFormState extends State<CadastroForm> {
  final _formKey = GlobalKey<FormState>();

  late String _codigo;
  late String _nome;
  late String _email;
  late String _categoria;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Novo pacote'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState?.save();

                //Salvar informações do formulário no banco de dados

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Pacote adicionado com sucesso!"),
                  backgroundColor: Colors.green,
                ));
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Código de rastreio',
                    prefixIcon: Icon(Icons.qr_code)),
                validator: (value) {
                  if (value == "") {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
                onSaved: (value) => _codigo = value!,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Nome', prefixIcon: Icon(Icons.abc)),
                validator: (value) {
                  if (value == "") {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
                onSaved: (value) => _nome = value!,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Categoria', prefixIcon: Icon(Icons.newspaper)),
                validator: (value) {
                  if (value == "") {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
                onSaved: (value) => _categoria = value!,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'E-mail', prefixIcon: Icon(Icons.email)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  //Validação básica de email
                  if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                      .hasMatch(value)) {
                    return 'Digite um e-mail válido';
                  }
                  return null;
                },
                onSaved: (value) => _email = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

