
// Home Screen with three main buttons
import 'package:flutter/material.dart';
import 'combustivel.dart';
import 'motivacao.dart';
import 'jogos.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AllinOne')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CombustivelScreen()));
              },
              child: Text('Combustível'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MotivacaoScreen()));
              },
              child: Text('Motivação'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => JogosScreen()));
              },
              child: Text('Jogos'),
            ),
          ],
        ),
      ),
    );
  }
}
