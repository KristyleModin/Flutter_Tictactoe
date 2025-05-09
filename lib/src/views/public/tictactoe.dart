// ignore_for_file: unused_field, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tictactoe extends StatefulWidget {
  const Tictactoe({super.key});

  @override
  State<Tictactoe> createState() => _TictactoeState();
}

class _TictactoeState extends State<Tictactoe> {

  bool ohTurn = true; //first player ("o")

  List<String> displayExOh = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  var myTextStyle = TextStyle(color: Colors.white, fontSize: 30);
  int ohScore = 0;
  int exScore = 0;
  int filledBoxes = 0;

  static var myNewFont = GoogleFonts.pressStart2p (
    textStyle: TextStyle(
      color: Colors.black,
      letterSpacing: 3,
    ),
  );
  static var myNewFontWhite = GoogleFonts.pressStart2p (
    textStyle: TextStyle(
      color: Colors.white,
      letterSpacing: 3,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Player O",
                          style: myNewFontWhite,
                        ),
                        Text(
                          ohScore.toString(),
                          style: myTextStyle,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Player X",
                          style: myNewFontWhite,
                        ),
                        Text(
                          exScore.toString(),
                          style: myTextStyle,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), 
              itemBuilder: (BuildContext context, int index){
                return GestureDetector(
                  onTap: () {
                    _tapped((index),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade700,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        //  index.toString(), 
                        displayExOh[index],
                        // index.toString(),
                         style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                         ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "TIC TAC TOE",
                      style: myNewFontWhite,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "@Khim",
                      style: myNewFontWhite,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _tapped (int index) {

    setState(() {
      if (ohTurn && displayExOh[index] == '') {
        displayExOh[index] = 'O';
        filledBoxes += 1;
      } else if (!ohTurn && displayExOh[index] == ''){
        displayExOh[index] = 'X';
        filledBoxes += 1;
      }

      ohTurn = !ohTurn;
      _checkWinner();
    }
  );
} 

    void _checkWinner() {
      //Column
      if(displayExOh[0] == displayExOh[1] && 
        displayExOh[0] == displayExOh[2] && 
        displayExOh[0] != '') {
        _showWinDialog(displayExOh[0]);
      }

      //Column
      if(displayExOh[3] == displayExOh[4] && 
        displayExOh[3] == displayExOh[5] && 
        displayExOh[3] != '') {
        _showWinDialog(displayExOh[3]);
      }

      //Column
      if(displayExOh[6] == displayExOh[7] && 
        displayExOh[6] == displayExOh[8] && 
        displayExOh[6] != '') {
        _showWinDialog(displayExOh[6]);
      }

      //Column
      if(displayExOh[0] == displayExOh[3] && 
        displayExOh[0] == displayExOh[6] && 
        displayExOh[0] != '') {
        _showWinDialog(displayExOh[0]);
      }

      //Column
      if(displayExOh[1] == displayExOh[4] && 
        displayExOh[1] == displayExOh[7] && 
        displayExOh[1] != '') {
        _showWinDialog(displayExOh[1]);
      }   

      //Column
      if(displayExOh[2] == displayExOh[5] && 
        displayExOh[2] == displayExOh[8] && 
        displayExOh[2] != '') {
        _showWinDialog(displayExOh[2]);
      }

      //Diagonal
      if(displayExOh[6] == displayExOh[4] && 
        displayExOh[6] == displayExOh[2] && 
        displayExOh[6] != '') {
        _showWinDialog(displayExOh[6]);
      }

      // Diagonal
      if(displayExOh[0] == displayExOh[4] && 
        displayExOh[0] == displayExOh[8] && 
        displayExOh[0] != '') {
        _showWinDialog(displayExOh[0]);
      }              

      //Draw
      else if(filledBoxes == 9) {
        _showDrawDialog();
      }  
    }

    void _showWinDialog(String winner) {
      showDialog(
        barrierDismissible: false,
        context: context, 
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              // ignore: prefer_interpolation_to_compose_strings
              "WINNER IS: " + winner,
            ),
            actions: [
              FloatingActionButton(
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: Text("Play Again"),
                
              ),
            ],
          );
        }
      );

      if (winner == 'O') {
        ohScore += 1;
      } else if (winner == 'X'){
        exScore += 1;
      }
    }

    void _showDrawDialog () {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "DRAW",
            ),
            actions: [
              FloatingActionButton(
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Play Again",
                ),
              ),
            ],
          );
        }
      );
    }

    void _clearBoard () {
       setState(() {
        for(int i=0; i < 9; i++) {
        displayExOh[i] = '';
        }
      }
    );
    filledBoxes = 0;
  }
}