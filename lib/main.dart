import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/cadastro_animal.dart';
import 'package:flutter_application_1/models/uploader.dart';
import 'package:flutter_application_1/pages/cadastro.dart';
import 'package:flutter_application_1/pages/login.dart';

import 'package:scoped_model/scoped_model.dart';

import 'models/user_model.dart';
import 'pages/tela_inicial.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key); // adicionando parâmetro key

  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
        model: UserModel(),
        child: MaterialApp(
          title: "Adoção",
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          routes: {
            '/': (context) => const TelaAnimais(),
            '/login': (context) => const Login(),
            '/cadastro': (context) => const Cadastro(),
            '/cadastro_animal': (context) => const CadastroAnimal(),
            '/uploader': (context) => const ImageUploader(),
          },
        ));
  }
}
