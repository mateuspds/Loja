import 'package:flutter/material.dart';
import 'package:loja/Models/cartList.dart';
import 'package:loja/Routes/route.dart';
import 'package:provider/provider.dart';

class CarrinhoWidget extends StatelessWidget {
  const CarrinhoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Rotas.carrinho);
            },
            icon:const Icon(Icons.shopping_cart),
          ),
          Positioned(
            right: 5,
            
            
            child: Consumer<CartList>(
              builder: (ctx, provCartList, child) => Container(
                padding:const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.error,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Text(provCartList.tamanho.toString(), textAlign: TextAlign.center,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
