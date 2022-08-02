import 'package:flutter/material.dart';
import 'package:loja/Models/cartList.dart';
import 'package:loja/Models/listPedidos.dart';
import 'package:loja/Models/listProduto.dart';
import 'package:loja/Pages/Carrinho_Page.dart';
import 'package:loja/Pages/detalheProduto.dart';
import 'package:loja/Pages/pedidos.dart';
import 'package:loja/Routes/route.dart';
import 'package:provider/provider.dart';
import 'Pages/home.dart';

void main() => runApp(const Myapp());

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ListProduto>.value(
          value:ListProduto(),
        ),
         ChangeNotifierProvider(
          create: (_) => CartList(),
        ),
         ChangeNotifierProvider(
          create: (_) => ListPedidos(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'flutter Clone',
          theme: ThemeData(
            secondaryHeaderColor: Colors.deepOrange,
            colorScheme: ColorScheme.fromSwatch(
                    primarySwatch: Colors.purple, errorColor: Colors.red)
                .copyWith(),
          ),
          // home: const Home(),
          initialRoute: Rotas.home,
          routes: {
            Rotas.home: (context) =>const Home(),
            Rotas.pedidos: (context) =>const Pedidos(),
            Rotas.carrinho:(context) =>const CarrinhoPage(),
            Rotas.detalheProduto:(context) => const DetalheProduto(),
          }),
    );
  }
}
