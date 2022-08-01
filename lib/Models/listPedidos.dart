import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:loja/Models/cartList.dart';
import 'package:loja/Models/pedidos.dart';

class ListPedidos with ChangeNotifier {
  final List<PedidosClass> _itens = [];

  List<PedidosClass> get itens {
    return [..._itens];
  }

  int get tamanho {
    return _itens.length;
  }

  void addPedidos(CartList carrinho) {
    _itens.insert(
      0,
      PedidosClass(
        id: Random().nextInt(200),
        produtos: carrinho.itenscart.values.toList(),
        data: DateTime.now(),
        total: carrinho.total,
      ),
    );
  }
}
