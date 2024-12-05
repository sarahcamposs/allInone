
// Jogos Screen
import 'package:flutter/material.dart';
import 'jogos/jokenpo.dart';
import 'jogos/cara_ou_coroa.dart';
import 'jogos/jogo_da_velha.dart';

class JogosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Jogos')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => JokenpoScreen()));
              },
              child: Text('Jokenpô'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CaraOuCoroaScreen()));
              },
              child: Text('Cara ou Coroa'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => JogoDaVelhaScreen()));
              },
              child: Text('Jogo da Velha'),
            ),
          ],
        ),
      ),
    );
  }
}
