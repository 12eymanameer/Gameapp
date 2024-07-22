import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tictac/Ticpage.dart';
import 'package:tictac/selectgame.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asset/4721bb567a7bc99e4564a606df352d23.gif'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => selectgame()),
                );
              },
              child:  TextAnimator(
                'G A M E S',
                style: GoogleFonts.orbitron(
                  textStyle: TextStyle(
                    color: Colors.greenAccent,
                    letterSpacing: .5,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),


                ),
                atRestEffect: WidgetRestingEffects.pulse(effectStrength: 0.6),
                incomingEffect: WidgetTransitionEffects.incomingSlideInFromTop(
                    blur: const Offset(0, 20), scale: 2),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}