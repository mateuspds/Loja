import 'package:loja/Models/cart.dart';

class PedidosClass {
  final int id;
  final List<Carrinho> produtos;
  final DateTime data;
  final double total;
  PedidosClass({
    required this.id,
    required this.produtos,
    required this.data,
    required this.total,
  });
 
}
