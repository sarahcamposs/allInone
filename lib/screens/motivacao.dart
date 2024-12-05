
// Motivação Screen
import 'package:flutter/material.dart';
import 'dart:math';

class MotivacaoScreen extends StatelessWidget {
  final List<String> frases = [
    "Acredite em si mesmo!",
    "O sucesso está na jornada.",
    "Cada dia é uma nova oportunidade!",
    "Persista, você está mais perto do que imagina.",
    "O impossível é apenas uma opinião."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Motivação')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final frase = frases[Random().nextInt(frases.length)];
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                content: Text(frase),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'),
                  )
                ],
              ),
            );
          },
          child: Text('Mostrar Frase'),
        ),
      ),
    );
  }
}
