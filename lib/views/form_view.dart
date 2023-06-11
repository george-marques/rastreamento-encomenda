import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rastrear_encomenda/provider/pacotes.dart';

import '../models/pacote.dart';

class CadastroForm extends StatefulWidget {
  @override
  _CadastroFormState createState() => _CadastroFormState();
}

class _CadastroFormState extends State<CadastroForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(Pacote pacote){
    if(pacote != null) {
      _formData['id'] = pacote.id;
      _formData['nome'] = pacote.nome;
      _formData['codigo'] = pacote.codigo;
      _formData['email'] = pacote.email;
    }
  }

  @override
  Widget build(BuildContext context) {

    final route = ModalRoute.of(context);
    if (route != null) {
      final pacote = route.settings.arguments as Pacote;
      _loadFormData(pacote);
    }


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
                Provider.of<Pacotes>(context, listen: false).put(Pacote(id: _formData['id'].toString(),
                    codigo: _formData['codigo'].toString(),
                    nome: _formData['nome'].toString(),
                    email: _formData['email'].toString(),
                ));

                Navigator.of(context).pop();




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
                initialValue: _formData['codigo'],
                decoration: InputDecoration(
                    labelText: 'Código de rastreio',
                    prefixIcon: Icon(Icons.qr_code)),
                validator: (value) {
                  if (value == "") {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
                onSaved: (value) => _formData['codigo'] = value!,
              ),
              TextFormField(
                initialValue: _formData['nome'],
                decoration: InputDecoration(
                    labelText: 'Nome', prefixIcon: Icon(Icons.abc)),
                validator: (value) {
                  if (value == "") {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
                onSaved: (value) => _formData['nome'] = value!,
              ),

              TextFormField(
                initialValue: _formData['email'],
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
                onSaved: (value) => _formData['email'] = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

