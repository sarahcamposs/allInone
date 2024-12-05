import 'package:flutter/material.dart';

class JogoDaVelha extends StatefulWidget {
  @override
  _JogoDaVelhaState createState() => _JogoDaVelhaState();
}

class _JogoDaVelhaState extends State<JogoDaVelha> {
  // Inicialização do tabuleiro
  List<String> board = List.filled(9, '');
  String currentPlayer = 'X';
  String winner = '';

  // Reiniciar o jogo
  void resetGame() {
    setState(() {
      board = List.filled(9, '');
      currentPlayer = 'X';
      winner = '';
    });
  }

  // Verificar o vencedor
  void checkWinner() {
    // Combinações vencedoras
    List<List<int>> winningPatterns = [
      [0, 1, 2], // Linha superior
      [3, 4, 5], // Linha do meio
      [6, 7, 8], // Linha inferior
      [0, 3, 6], // Coluna esquerda
      [1, 4, 7], // Coluna do meio
      [2, 5, 8], // Coluna direita
      [0, 4, 8], // Diagonal principal
      [2, 4, 6], // Diagonal secundária
    ];

    for (var pattern in winningPatterns) {
      if (board[pattern[0]] != '' &&
          board[pattern[0]] == board[pattern[1]] &&
          board[pattern[1]] == board[pattern[2]]) {
        setState(() {
          winner = board[pattern[0]];
        });
        return;
      }
    }

    // Verificar empate
    if (!board.contains('') && winner == '') {
      setState(() {
        winner = 'Empate';
      });
    }
  }

  // Jogar
  void play(int index) {
    if (board[index] == '' && winner == '') {
      setState(() {
        board[index] = currentPlayer;
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      });
      checkWinner();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jogo da Velha'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Mensagem do estado do jogo
          Text(
            winner.isNotEmpty
                ? (winner == 'Empate' ? 'Deu Empate!' : '$winner venceu!')
                : 'Turno de $currentPlayer',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          // Tabuleiro do jogo
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: 9,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => play(index),
                child: Container(
                  margin: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.teal[100],
                    border: Border.all(color: Colors.black),
                  ),
                  child: Center(
                    child: Text(
                      board[index],
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          // Botão de reiniciar o jogo
          ElevatedButton(
            onPressed: resetGame,
            child: Text('Reiniciar Jogo'),
          ),
        ],
      ),
    );
  }
}
