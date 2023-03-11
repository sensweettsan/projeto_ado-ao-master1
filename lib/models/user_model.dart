import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  late dynamic userLogado = '';

  late dynamic itensCarrinho = [];

  cadastroUser({
    required String nome,
    required String email,
    required String senha,
    required String contato,
    required void Function() onSuccess,
    required void Function() onFail,
  }) async {
    final url = Uri.parse(
        'https://adocao-production.up.railway.app/api/auth/local/register');

    final response = await http.post(
      url,
      headers: <String, String>{
        'content-type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': senha,
        'contato': contato,
        'username': nome
      }),
    );

    if (response.statusCode == 200) {
      // Sucesso no cadastro
      onSuccess();
    } else {
      // Falha no cadastro
      onFail();
    }
  }

  cadastroAnimal({
    required String nome,
    required String descricao,
    required void Function() onSuccess,
    required void Function() onFail,
  }) async {
    final url = Uri.parse(
        'https://adocao-production.up.railway.app/api/auth/local/register');

    final response = await http.post(
      url,
      headers: <String, String>{
        'content-type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nome': nome,
        'descricao': descricao,
      }),
    );

    if (response.statusCode == 200) {
      // Sucesso no cadastro
      onSuccess();
    } else {
      // Falha no cadastro
      onFail();
    }
  }

  signIn({
    required String email,
    required String pass,
    required void Function() onSuccess,
    required void Function() onFail,
  }) async {
    final url =
        Uri.parse('https://adocao-production.up.railway.app/api/auth/local');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'identifier': email,
        'password': pass,
      }),
    );

    if (response.statusCode == 200) {
      userLogado = jsonDecode(response.body);
      // Login bem sucedido
      onSuccess();

      notifyListeners();
    } else {
      // Login falhou
      onFail();
    }
  }

  bool isLoggedIn() {
    return userLogado != '';
  }

  signOut() {
    userLogado = '';
    notifyListeners();
  }
}
