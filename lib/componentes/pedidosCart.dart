import 'package:flutter/material.dart';
import 'package:loja/Models/pedidos.dart';
import 'package:intl/intl.dart';

class PedidosCard extends StatefulWidget {
  final PedidosClass pedidos;
  const PedidosCard({Key? key, required this.pedidos}) : super(key: key);

  @override
  State<PedidosCard> createState() => _PedidosCardState();
}

class _PedidosCardState extends State<PedidosCard> {
  bool _detalhes = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text("R\$ ${widget.pedidos.total.toStringAsFixed(2)}"),
            subtitle: Text(
                DateFormat('dd/MM/yyyy kk:mm').format(widget.pedidos.data)),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  _detalhes = !_detalhes;
                });
              },
              icon:const Icon(
                Icons.expand_more,
                color: Colors.purple,
              ),
            ),
          ),
          if (_detalhes)
            Container(
              height: widget.pedidos.produtos.length * 23 + 10,
              width: double.infinity,
              padding:const EdgeInsets.only(right: 5,left: 5),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.pedidos.produtos
                      .map(
                        (e) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(e.tiulo,style:const TextStyle(
                              fontWeight: FontWeight.bold
                            ),),
                          const  Spacer(),
                            Text("${e.quantidade.toString()}X"),
                           const Padding(padding: EdgeInsets.only(right: 5)),
                            Text(e.precoTotal.toString())
                          ],
                        ),
                      )
                      .toList()),
            ),
        ],
      ),
    );
  }
}
