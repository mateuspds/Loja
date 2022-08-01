import 'package:flutter/material.dart';
import 'package:loja/Models/cartList.dart';
import 'package:loja/Models/produto.dart';
import 'package:loja/Routes/route.dart';
import 'package:provider/provider.dart';

class GridItem extends StatelessWidget {
  final Produto produto;
  const GridItem({Key? key, required this.produto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provCartList = Provider.of<CartList>(context, listen: false);

    return GridTile(
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        title: Text(produto.titulo),
        leading: Consumer<Produto>(
          builder: (ctx, provider, _) => IconButton(
            onPressed: () {
              provider.Favo();
            },
            icon: Icon(
              produto.favorito ? Icons.favorite : Icons.favorite_border,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            provCartList.addItem(produto);
          },
          icon: Icon(Icons.shopping_cart,
              color: Theme.of(context).colorScheme.error),
        ),
      ),
      child: GestureDetector(
        child: Image.network(
          produto.UrlImage,
          fit: BoxFit.cover,
        ),
        onTap: () {
          Navigator.of(context)
              .pushNamed(Rotas.detalheProduto, arguments: produto);
        },
      ),
    );
  }
}
