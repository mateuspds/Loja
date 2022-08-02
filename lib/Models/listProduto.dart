import 'dart:js';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loja/Date/dateProducts.dart';
import 'package:loja/Models/produto.dart';

class ListProduto with ChangeNotifier {
  bool _favoritos = false;
  final List<Produto> _itens = Datelist;

  List<Produto> get itens {
    if (_favoritos) {
      return _itens.where((element) => element.favorito).toList();
      
    } else {
      return [..._itens];
    }
  }

  void Favorito() {
    _favoritos = true;
    if (_itens.where((element) => element.favorito).toList().length < 1) {
      _favoritos = false;
    }
    notifyListeners();
  }

  void showAll() {
    _favoritos = false;
    notifyListeners();
  }
}
