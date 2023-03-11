import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/draw_menu.dart';
import 'package:flutter_application_1/models/pets.dart';
import 'package:flutter_application_1/pages/info_animal.dart';

class TelaAnimais extends StatelessWidget {
  const TelaAnimais({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adoção de Animais'),
        backgroundColor: const Color.fromARGB(224, 43, 80, 52),
        centerTitle: true,
      ),
      drawer: const MyDrawerMenu(),
      body: FutureBuilder<List<Animals>>(
        future: obterListaAnimais(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final listaAnimais = snapshot.data!;

            return ListView.builder(
              itemCount: listaAnimais.length,
              itemBuilder: (context, index) {
                final animal = listaAnimais[index];
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.network(
                          'https://adocao-production.up.railway.app${animal.img}',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(animal.nome,
                                style: Theme.of(context).textTheme.titleLarge),
                            const SizedBox(height: 8.0),
                            Text(animal.especie,
                                style: Theme.of(context).textTheme.titleMedium),
                            const SizedBox(height: 8.0),
                            Text(animal.descricao,
                                style: Theme.of(context).textTheme.bodyMedium),
                            const SizedBox(height: 16.0),
                            ElevatedButton(
                              onPressed: () {
                                // Lógica para adoção do animal
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AdocaoInfo(id: animal.id)),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(224, 43, 80, 52),
                              ),
                              child: const Text('Adotar'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erro ao obter lista de animais',
                  style: Theme.of(context).textTheme.bodyLarge),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Cadastre animal',
          ),
        ],
        selectedItemColor: const Color.fromARGB(224, 43, 80, 52),
        onTap: (int index) {
          // Lógica para navegar entre as telas
        },
      ),
    );
  }
}
