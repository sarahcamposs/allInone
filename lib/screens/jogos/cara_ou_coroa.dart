import 'dart:math';
import 'package:flutter/material.dart';

class CaraOuCoroa extends StatefulWidget {
  @override
  _CaraOuCoroaState createState() => _CaraOuCoroaState();
}

class _CaraOuCoroaState extends State<CaraOuCoroa> {
  String resultado = ''; // Resultado atual do jogo (Cara ou Coroa)
  String imagemAtual = 'assets/coin.png'; // Imagem inicial

  // Função para simular o lançamento da moeda
  void jogarMoeda() {
    final random = Random();
    final lado = random.nextBool(); // true para Cara, false para Coroa

    setState(() {
      resultado = lado ? 'Cara' : 'Coroa';
      imagemAtual = lado ? 'assets/cara.png' : 'assets/coroa.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cara ou Coroa'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Imagem representando a moeda
          Image.asset(
            imagemAtual,
            height: 150,
            width: 150,
          ),
          SizedBox(height: 20),
          // Texto com o resultado
          Text(
            resultado.isNotEmpty ? 'Resultado: $resultado' : 'Lance a moeda!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          // Botão para jogar a moeda
          ElevatedButton(
            onPressed: jogarMoeda,
            child: Text('Jogar Moeda'),
          ),
        ],
      ),
    );
  }
}
