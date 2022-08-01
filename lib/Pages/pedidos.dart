import 'package:flutter/material.dart';
import 'package:loja/Models/listPedidos.dart';
import 'package:loja/componentes/drawer.dart';
import 'package:loja/componentes/pedidosCart.dart';
import 'package:provider/provider.dart';

class Pedidos extends StatelessWidget {
  const Pedidos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ListPedidos>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title:const Text('Pedidos'),
      ),
      drawer:const DrawerWidget(),
      
      body: ListView.builder(
        itemCount: provider.tamanho,
        itemBuilder: (context, index) => PedidosCard(
          pedidos: provider.itens[index],
        ),
      ),
    );
  }
}
