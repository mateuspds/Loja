import 'package:flutter/foundation.dart';
import 'package:loja/Date/dateProducts.dart';
import 'package:loja/Models/produto.dart';

class ListProduto with ChangeNotifier {
  final List<Produto> _itens = Datelist;

  List<Produto> get itens {
    return [..._itens];
  }
}
