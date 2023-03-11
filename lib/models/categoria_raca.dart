import 'dart:convert';

import 'package:http/http.dart' as http;

class Categoria {
  int id;
  String categoria;
  String img;

  Categoria({required this.id, required this.categoria, required this.img});

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
      id: json['id'] as int,
      categoria: json['attributes']['categoria'] as String,
      img: json['attributes']['img']['data']['attributes']['formats']
          ['thumbnail']['url'] as String,
    );
  }
}

Future<List<Categoria>> obterListaRaca() async {
  List<Categoria> listaAnimais = <Categoria>[];
  final url = Uri.parse(
      'https://adocao-production.up.railway.app/api/categorias?populate=*');
  final resposta = await http.get(url);

  if (resposta.statusCode == 200) {
    var listaResponse = json.decode(resposta.body);

    for (var animal in listaResponse['data']) {
      Categoria p = Categoria.fromJson(animal);

      listaAnimais.add(p);
    }

    return listaAnimais;
  } else {
    throw Exception('Erro ao obter lista de animais');
  }
}
