import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/info_model.dart';

Future<InfoModel> getAnimalById(int id) async {
  var caminho = 'adocao-production.up.railway.app';
  final Uri url = Uri.https(caminho, '/api/animals/$id', {'populate': '*'});

  var response = await http.get(url);
  if (response.statusCode == 200) {
    print(response.body);
    var animal = InfoModel.fromJson(json.decode(response.body)['data']);
    return animal;
  } else {
    throw Exception('Request failed with status: ${response.statusCode}.');
  }
}

confAdocao({
  required id,
  required jwt,
  required void Function() onSuccess,
  required void Function() onFail,
}) async {
  // var url = Uri.http('192.168.137.113:1337', '/api/animals/$id');
  var body = jsonEncode({
    "data": {"adotado": true}
  });

  http.put(
      Uri.parse("https://adocao-production.up.railway.app/api/animals/$id"),
      body: body,
      headers: <String, String>{
        "Authorization": "Bearer $jwt",
        "Content-Type": "application/json"
      }).then((response) {
    if (response.statusCode == 200) {
      onSuccess();
    } else {
      onFail();
    }
  });
}