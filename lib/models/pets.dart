import 'package:http/http.dart' as http;
import 'dart:convert';

class Animals {
  int id;
  String nome;
  String especie;
  String descricao;

  String img;

  Animals(
      {required this.id,
      required this.nome,
      required this.especie,
      required this.descricao,
      required this.img});

  factory Animals.fromJson(Map<String, dynamic> json) {
    return Animals(
      id: json['id'] as int,
      nome: json['attributes']['nome'] as String,
      especie: json["attributes"]["especie"] as String,
      descricao: json["attributes"]["descricao"] as String,
      img: json['attributes']['img']['data']['attributes']['formats']
          ['thumbnail']['url'] as String,
    );
  }
}

Future<List<Animals>> obterListaAnimais() async {
  List<Animals> listaAnimais = <Animals>[];
  final url = Uri.parse(
      'https://adocao-production.up.railway.app/api/animals?populate=*');
  final resposta = await http.get(url);

  if (resposta.statusCode == 200) {
    var listaResponse = json.decode(resposta.body);

    for (var animal in listaResponse['data']) {
      Animals p = Animals.fromJson(animal);

      listaAnimais.add(p);
    }

    return listaAnimais;
  } else {
    throw Exception('Erro ao obter lista de animais');
  }
}
