import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

import '../pages/login.dart';

class MyDrawerMenu extends StatelessWidget {
  const MyDrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buidMenuItems(context),
          ],
        ),
      ),
    );
  }
}

Widget buildHeader(BuildContext context) => Container(
      color: const Color.fromARGB(224, 43, 80, 52),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        bottom: 24,
      ),
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              const Center(
                child: Text(
                  'Adocão',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              !model.isLoggedIn()
                  ? const Text(
                      'Olá, ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      'Olá, ${model.userLogado['user']['username']}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
              const SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  if (model.userLogado != '') {
                    model.signOut();
                    Navigator.pop(context);
                    Navigator.of(context).pushReplacementNamed('/');
                  } else {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Login()));
                  }
                },
                child: Text(
                  model.isLoggedIn() ? 'Sair' : 'Entre ou cadastre-se >',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

Widget buidMenuItems(BuildContext context) => ScopedModelDescendant<UserModel>(
      builder: (context, child, model) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 4, //espaçamento vertical
          children: [
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                //model.(idCliente: model.idCliente);
                Navigator.pop(context);
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.pets),
              title: const Text('Cadastre animal'),
              onTap: () {
                //model.(idCliente: model.idCliente);
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/cadastro_animal');
              },
            ),
            const Divider(
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
