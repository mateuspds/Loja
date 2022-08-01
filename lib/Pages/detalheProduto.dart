import 'package:flutter/material.dart';
import 'package:loja/Models/produto.dart';

class DetalheProduto extends StatelessWidget {
  const DetalheProduto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final produto = ModalRoute.of(context)!.settings.arguments as Produto;
    return Scaffold(
      appBar: AppBar(
        title: Text(produto.titulo),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.network(
              produto.UrlImage,
              fit: BoxFit.cover,
            ),
          ),
        const  SizedBox(height: 10),
          Text(
            "R\$ ${produto.preco}",
            style:const TextStyle(
              color: Colors.grey,
              fontSize: 18
            ),
          ),
           const  SizedBox(height: 10),
           Text(produto.descricao, style:const TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: 16
           ),)
        ],
      ),
    );
  }
}
