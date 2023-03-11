import '../models/info_model.dart';
import '../models/user_model.dart';
import 'package:flutter/material.dart';
import '../../data/data.dart';
import 'package:scoped_model/scoped_model.dart';

class ConfirmacaoPage extends StatefulWidget {
  // dados dos animais
  final InfoModel animal;

  const ConfirmacaoPage({
    super.key,
    required this.animal,
  });

  @override
  State<ConfirmacaoPage> createState() => _ConfirmacaoPageState();
}

class _ConfirmacaoPageState extends State<ConfirmacaoPage> {
  @override
  Widget build(BuildContext context) {
    var dados = widget.animal;
    return ScopedModelDescendant<UserModel>(
        builder: (context, child, model) => Scaffold(
              appBar: AppBar(
                title: const Text('Página de confirmação'),
              ),
              body: Column(children: [
                SizedBox(
                    height: 90,
                    child: Card(
                        child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(children: [
                              Image.network(
                                'https://adocao-production.up.railway.app${dados.imagem}',
                                width: 100,
                                height: 100,
                              ),
                              Text(dados.nome),
                              Text(dados.descricao),
                              Text(dados.especie),
                            ])))),
                SizedBox(
                    height: 90,
                    child: Card(
                        child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(children: [
                              Text(dados.username),
                              Text(dados.email),
                              Text(dados.contato),
                              ButtonTheme(
                                height: 60.0,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    confAdocao(1);
                                  },
                                  child: const Text(
                                    "Finalizar adocão",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  ),
                                ),
                              )
                            ]))))
              ]),
            ));
  }
}
