import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text('Adote aqui!!! '),
        Text('Vários animaizinhos a procura de um lar!!!'),
      ],
    );
  }
}
