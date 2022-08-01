import 'package:flutter/material.dart';
import 'package:loja/Routes/route.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        AppBar(
          automaticallyImplyLeading: false,
          title:const Text('Bem vindo meu usuario'),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(
            Icons.shop,
            color: Colors.deepPurple,
          ),
          title: const Text('Loja'),
          onTap: () {
            Navigator.pushReplacementNamed(context, Rotas.home);
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(
            Icons.payment,
            color: Colors.green,
          ),
          title: const Text('Pedidos'),
          onTap: () {
            Navigator.pushNamed(context, Rotas.pedidos);
          },
        ),
        const Divider()
      ],
    ));
  }
}
