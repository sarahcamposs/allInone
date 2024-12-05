
// Combustível Screen
import 'package:flutter/material.dart';

class CombustivelScreen extends StatelessWidget {
  final TextEditingController consumoController = TextEditingController();
  final TextEditingController kilometragemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Combustível')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: consumoController,
              decoration: InputDecoration(labelText: 'Consumo (Km/L)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: kilometragemController,
              decoration: InputDecoration(labelText: 'Kilometragem (Km)'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                double consumo = double.tryParse(consumoController.text) ?? 0;
                double km = double.tryParse(kilometragemController.text) ?? 0;
                double gasolina = (km / consumo) * 6.00;
                double alcool = (km / consumo) * 4.89;
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text('Custo do Combustível'),
                    content: Text(
                        'Gasolina: R\$${gasolina.toStringAsFixed(2)}, Álcool: R)$${alcool.toStringAsFixed(2)}'),
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
              child: Text('Calcular'),
            ),
          ],
        ),
      ),
    );
  }
}
