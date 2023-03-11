import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/user_model.dart';
import 'tela_inicial.dart';


// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

class CadastroAnimal extends StatefulWidget {
  const CadastroAnimal({Key? key}) : super(key: key);

  @override
  createState() => _CadastroAnimalState();
}

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

class _CadastroAnimalState extends State<CadastroAnimal> {
  final nomeAnimalController = TextEditingController();
  final especieController = TextEditingController();
  final descricaoAnimalController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
      
        builder: (context, child, model) => Scaffold(
          
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text(''),
              backgroundColor: const Color.fromARGB(224, 43, 80, 52),
            ),
            body: Padding(
                padding: const EdgeInsets.all(12.0),

                // XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

                // começo do children


                child: Center(
                    child: Form(
                        child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.pets,
                      color: Color.fromARGB(224, 43, 80, 52),
                      size: 50,
                    ),

                    // XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

                    const SizedBox(width: 10),
                    const Text(
                      ' Hora de criar um perfil para seu animal !',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(224, 43, 80, 52),
                      ),
                    ),

                    // XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

                    const SizedBox(
                      height: 20,
                    ),

                    // XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(224, 43, 80, 52),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        controller: nomeAnimalController,
                        autofocus: true,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Nome do seu animalzinho',
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 15,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),

                    // XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

                    const SizedBox(
                      height: 10,
                    ),

                    // XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(224, 43, 80, 52),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        controller: descricaoAnimalController,
                        autofocus: true,
                        keyboardType: TextInputType.text,
                        style:
                            const TextStyle(color: Colors.green, fontSize: 18),
                        decoration: InputDecoration(
                          hintText: 'Adicione aqui a descrição do animal',
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 15,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),

                    // XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

                    const SizedBox(height: 10),

                    // XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

                    const Text(
                      'Escolha uma imagem para dar identidade ao seu animalzinho ! Imagens que ferem as diretrizes da comunidade muito provavelmente vão acarretar em "perma-ban" ( banimento vitalício por justa causa ). Recomenda-se ler as diretrizes de usuário',
                      textAlign: TextAlign.center,
                    ),

                    // XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

                    const SizedBox(height: 10),

                    // XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

                    // Select Image Button

                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(224, 43, 80, 52),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text(
                                  "Selecione uma imagem",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      GestureDetector(
                                        child: const Text("Galeria"),
                                        onTap: () {
                                          _pickImage(ImageSource.gallery);
                                          Navigator.pop(context);
                                        },
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.all(8.0)),
                                      GestureDetector(
                                        child: const Text("Câmera"),
                                        onTap: () {
                                          _pickImage(ImageSource.camera);
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: const Center(
                          child: Text(
                            'Selecionar imagem',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


 
 





                    // XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(224, 43, 80, 52),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextButton(
                          child: const Center(
                            child: Text(
                              'Criar cadastro do animal',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              model.cadastroAnimal(
                                  nome: nomeAnimalController.text,
                                  descricao: descricaoAnimalController.text,
                                  onFail: () {},
                                  onSuccess: () {});

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TelaAnimais()));
                            }
                          }),

                      // XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                    ),

                    // XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                  ], // fim do children

                  // XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                ))))));
  }

  void _pickImage(ImageSource gallery) {}
  // uploader ( está acima )
}

 // fim do class

// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

// Drop button




