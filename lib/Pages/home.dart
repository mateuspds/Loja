// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:loja/Models/listProduto.dart';
import 'package:loja/Models/produto.dart';
import 'package:loja/componentes/carrinho.dart';
import 'package:loja/componentes/drawer.dart';
import 'package:loja/componentes/gridItem.dart';
import 'package:provider/provider.dart';

enum selectFavorite {
  selectFavoritos,
  selectall,
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ListProduto>(context,);
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text("Minha Loja"),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text("somente os favoritos"),
                value: selectFavorite.selectFavoritos,
              ),
              const PopupMenuItem(
                child: Text("Todos"),
                value: selectFavorite.selectall,
              ),
            ],
            onSelected: (selectFavorite value) {
              if (value== selectFavorite.selectFavoritos) {
                 provider.Favorito();
              } else {
                provider.showAll();
              }
            },
          ),
          CarrinhoWidget(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: 
           GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                mainAxisExtent: 170,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: provider.itens.length,
            itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ChangeNotifierProvider.value(
                  value: provider.itens[index],
                  child: GridItem(
                    produto: provider.itens[index],
                  ),
                )),
          ),
        
      ),
    );
  }
}
