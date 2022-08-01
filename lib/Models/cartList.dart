import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:loja/Models/cart.dart';
import 'package:loja/Models/produto.dart';

class CartList with ChangeNotifier {
  Map<String, Carrinho> _cartList = {};

  Map<String, Carrinho> get itenscart {
    return {..._cartList};
  }

  int get tamanho {
    return _cartList.length;
  }

  double get total {
    double total = 0.0;
    _cartList.forEach((key, value) {
      total += value.quantidade * value.precoTotal;
    });
    return total;
  }

  void addItem(Produto produto) {
    if (_cartList.containsKey(produto.id)) {
      _cartList.update(
          produto.id,
          (value) => Carrinho(
              quantidade: value.quantidade + 1,
              precoTotal: value.precoTotal,
              idCarrinho: value.idCarrinho,
              idProduto: value.idProduto,
              tiulo: value.tiulo));
      notifyListeners();
    } else {
      _cartList.putIfAbsent(
          produto.id,
          () => Carrinho(
              quantidade: 1,
              precoTotal: produto.preco,
              idCarrinho: Random().nextInt(200),
              idProduto: produto.id,
              tiulo: produto.titulo));
      notifyListeners();
    }
  }

  void clear() {
    _cartList = {};
    notifyListeners();
  }

  void removeProduto(String produtoid) {
    _cartList.remove(produtoid);
    notifyListeners();
  }
}
