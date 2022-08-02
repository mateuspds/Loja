import 'package:flutter/material.dart';
import 'package:loja/Models/cartList.dart';
import 'package:loja/Models/listPedidos.dart';
import 'package:loja/componentes/cardCarrinho.dart';
import 'package:provider/provider.dart';

class CarrinhoPage extends StatelessWidget {
  const CarrinhoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartList>(context);
    final providerPedidos = Provider.of<ListPedidos>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title:const Text("Carrinho"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Card(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                 const   SizedBox(width: 10),
                    Chip(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      label: Consumer<CartList>(
                        builder: (context, value, filho) => Text(
                          "R\$ ${provider.total.toStringAsFixed(2)}",
                        ),
                      ),
                    ),
                 const   Spacer(),
                    TextButton(
                      onPressed: () {
                        if (provider.tamanho > 0) {
                          providerPedidos.addPedidos(provider);

                          provider.clear();
                           showDialog(
                            context: context,
                            builder: (context) {
                              Future.delayed(const Duration(seconds: 1), () {
                                Navigator.of(context).pop(true);
                              });
                              return const AlertDialog(
                                alignment: Alignment.topCenter,
                                title: Text(
                                  "Compra realizada com sucesso",
                                  style: TextStyle(
                                    color: Colors.purple
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              Future.delayed(const Duration(seconds: 1), () {
                                Navigator.of(context).pop(true);
                              });
                              return const AlertDialog(
                                alignment: Alignment.topCenter,
                                title: Text(
                                  "Adicione produtos no seu carrinho",
                                  style: TextStyle(
                                    color: Colors.purple
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                      child: Text(
                        "Comprar",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 17),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Consumer<CartList>(
                builder: (context, value, child) => ListView.builder(
                  itemCount: provider.itenscart.length,
                  itemBuilder: (context, index) => CardWidget(
                      carrinho: provider.itenscart.values.toList()[index],
                      ),
                ),
              ),
            ),
          ],
        ));
  }
}
