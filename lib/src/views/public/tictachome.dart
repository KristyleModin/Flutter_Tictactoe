import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/views/public/tictactoe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:avatar_glow/avatar_glow.dart';



class Tictachome extends StatefulWidget {
  const Tictachome({super.key});

  @override
  State<Tictachome> createState() => _Tictachomestate();
}


class _Tictachomestate extends State<Tictachome> {


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
    // ignore: unused_local_variable
    final color = Colors.white;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 120),
                  child: Container(
                    child: Text(
                      "TIC TAC TOE",
                      style: myNewFontWhite.copyWith(fontSize: 30),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: AvatarGlow(
                    duration: Duration(seconds: 2),
                    glowColor: Colors.white,
                    repeat: true,
                    startDelay: Duration(seconds: 1),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          style: BorderStyle.none,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.shade900,
                        radius: 80.0,
                      ),
                    ),
                  ),
                )
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 80,
                  ),
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    child: Text(
                      "@Khim",
                      style: myNewFontWhite.copyWith(fontSize: 20),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => Tictactoe()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 40, 
                    right: 40, 
                    bottom: 60,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.all(30),
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          "PLAY GAME",
                          style: myNewFont,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );    
  }
}