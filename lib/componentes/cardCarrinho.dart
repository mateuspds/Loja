import 'package:flutter/material.dart';
import 'package:loja/Models/cart.dart';
import 'package:loja/Models/cartList.dart';
import 'package:provider/provider.dart';

class CardWidget extends StatelessWidget {
  final Carrinho carrinho;
  
  const CardWidget({Key? key, required this.carrinho}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(carrinho.idCarrinho),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        padding:const EdgeInsets.only(
          right: 20,
        ),
        margin:const EdgeInsets.symmetric(
          horizontal: 15, vertical: 4,
        ),
        child:const Icon(
          Icons.delete,
          size: 40,
        ),
      ),
      onDismissed: (_) {
        Provider.of<CartList>(context, listen: false).removeProduto(carrinho.idProduto);
      },
      child: Card(
        child: Padding(
          padding:const EdgeInsets.all(10),
          child: ListTile(
            title: Text(carrinho.tiulo),
            trailing: Text("${carrinho.quantidade.toString()}X"),
            subtitle:
                Text("Total: ${(carrinho.quantidade * carrinho.precoTotal).toStringAsFixed(2)}"),
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: FittedBox(
                    child: Text(
                  carrinho.precoTotal.toStringAsFixed(2),
                  textAlign: TextAlign.center,
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
