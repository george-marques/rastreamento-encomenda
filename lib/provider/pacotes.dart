import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rastrear_encomenda/models/pacote.dart';

import '../data/dummy_pacotes.dart';

class Pacotes with ChangeNotifier{
  final Map<String, Pacote> _items = {...DUMMY_PACOTES};

  List<Pacote> get all {
    return [..._items.values];
  }

  int get count{
    return _items.length;
  }

  Pacote byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Pacote pacote) {
    if (pacote == null) {
      return;
    }
    
    if(pacote.id != null && pacote.id.trim().isNotEmpty && _items.containsKey(pacote.id)) {
      _items.update(pacote.id, (_) => Pacote(id: pacote.id, codigo: pacote.codigo, nome: pacote.nome, email: pacote.email));
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(id, () => Pacote(id: id, codigo: pacote.codigo, nome: pacote.nome, email: pacote.email));
    }
    
    notifyListeners();
  }

  void remover(Pacote pacote){
    if(pacote != null && pacote.id != null){
      _items.remove(pacote.id);
      notifyListeners();
    }


  }

}