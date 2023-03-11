import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../data/data.dart';
import '../models/info_model.dart';
import '../models/user_model.dart';

class ConfirmacaoPage extends StatefulWidget {
  final InfoModel animal;

  const ConfirmacaoPage({
    super.key,
    required this.animal,
  });

  @override
  State<ConfirmacaoPage> createState() => _ConfirmacaoPageState();
}

class _ConfirmacaoPageState extends State<ConfirmacaoPage> {
  late final InfoModel _dados;

  @override
  void initState() {
    _dados = widget.animal;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
      builder: (context, child, model) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text(
              'Página de confirmação',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Column(
            children: [
              _buildAnimalInfoCard(),
              _buildUserDataCard(model),
              ButtonTheme(
                child: ElevatedButton(
                  onPressed: () async {
                    await confAdocao(
                        id: widget.animal.id,
                        jwt: model.userLogado.jwt,
                        onSuccess: _onSuccess,
                        onFail: _onFail);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(20),
                  ),
                  child: const Text(
                    "Finalizar adoção",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAnimalInfoCard() {
    return SizedBox(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Image.network(
                'https://adocao-production.up.railway.app${_dados.imagem}',
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _dados.nome,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      _dados.descricao,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Espécie: ${_dados.especie}',
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserDataCard(UserModel model) {
    return SizedBox(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Text('Nome do dono:${_dados.username}'),
              Text('Email do dono:${_dados.email}'),
              Text('Contato do dono:${_dados.contato}'),
            ],
          ),
        ),
      ),
    );
  }

  void _onSuccess() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Aviso'),
          content: const Text('O animal foi adotado, Parabens!'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(('/'));
              },
              style: ElevatedButton.styleFrom(
              backgroundColor:
              const Color.fromARGB(224, 43, 80, 52),
                              ),
              child: const Text(
                'Voltar!',
              ),
            ),
          ],
        );
      },
    );
  }

  void _onFail() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Erro na adoção. Tente novamente!'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }
}