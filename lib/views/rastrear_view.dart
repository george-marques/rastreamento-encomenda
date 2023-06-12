import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelaRastreamento extends StatefulWidget {
  @override
  _EstadoTelaRastreamento createState() => _EstadoTelaRastreamento();
}

class _EstadoTelaRastreamento extends State<TelaRastreamento> {
  TextEditingController _controladorCodigoRastreamento = TextEditingController();
  Map<String, dynamic>? _dadosRastreamento;
  bool _isLoading = false;

  void _rastrearEncomenda() async {
    String codigoRastreamento = _controladorCodigoRastreamento.text;

    if (codigoRastreamento.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });

      var url = Uri.parse('http://localhost:4000/rastreamentos?codigo=$codigoRastreamento');

      var resposta = await http.get(url);

      if (resposta.statusCode == 200) {
        var jsonResponse = json.decode(resposta.body);

        if (jsonResponse.length > 0) {
          setState(() {
            _dadosRastreamento = jsonResponse[0];
          });
        } else {
          setState(() {
            _dadosRastreamento = null;
          });
        }
      } else {
        setState(() {
          _dadosRastreamento = null;
        });
      }

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rastreamento de Encomenda',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _controladorCodigoRastreamento,
              decoration: InputDecoration(
                labelText: 'Código de Rastreamento',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _rastrearEncomenda,
              child: Text(
                'Rastrear',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
              ),
            ),
            SizedBox(height: 16.0),
            _isLoading
                ? CircularProgressIndicator()
                : _dadosRastreamento != null
                ? ListTile(
              leading: Icon(Icons.fire_truck),
              title: Text(
                _dadosRastreamento!['descricao'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Data e Hora de Criação: ${_dadosRastreamento!['dtHrCriado']}'),
                  Text('Tipo: ${_dadosRastreamento!['tipo']}'),
                  Text('Unidade: ${_dadosRastreamento!['unidade']['tipo']}'),
                  Text('Endereço da Unidade: ${_dadosRastreamento!['unidade']['endereco']['rua']}, ${_dadosRastreamento!['unidade']['endereco']['numero']}, ${_dadosRastreamento!['unidade']['endereco']['cidade']}, ${_dadosRastreamento!['unidade']['endereco']['estado']}'),
                  Text('Unidade de Destino: ${_dadosRastreamento!['unidadeDestino']['tipo']}'),
                  Text('Destino: ${_dadosRastreamento!['unidadeDestino']['endereco']['rua']}, ${_dadosRastreamento!['unidadeDestino']['endereco']['numero']}, ${_dadosRastreamento!['unidadeDestino']['endereco']['cidade']}, ${_dadosRastreamento!['unidadeDestino']['endereco']['estado']}'),
                ],
              ),
            )
                : Text('Encomenda não encontrada!'),
          ],
        ),
      ),
    );
  }
}
