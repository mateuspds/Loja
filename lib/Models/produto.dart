import 'package:flutter/foundation.dart';

class Produto with ChangeNotifier {
  final String id;
  final String titulo;
  final String descricao;
  final double preco;
  final String UrlImage;
  bool favorito;
  Produto({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.preco,
    required this.UrlImage,
     this.favorito=false,
  });

  void Favo() {
    this.favorito = !favorito;
    notifyListeners();
  }
}
