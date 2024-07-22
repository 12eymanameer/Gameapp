import 'package:flutter/material.dart';
import 'package:tictac/Ticpage.dart';
import 'package:tictac/boxii.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweep_animation_button/sweep_animation_button.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

    );
  }
}
class selectgame extends StatefulWidget {


  const selectgame ({super.key});

  @override
  State<selectgame > createState() => _selectgameState();
}

class _selectgameState extends State<selectgame > {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(

        home: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Stack(
              children:<Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:  AssetImage('asset/4721bb567a7bc99e4564a606df352d23.gif'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget>[
                      Center(
                          child:TextAnimator(
                           'Select Game To Play',
                       style: GoogleFonts.orbitron(
                    textStyle: TextStyle(
                    color: Colors.yellowAccent,
                               fontWeight: FontWeight.bold,
                                fontSize: 20,
                           ),))),
                      SizedBox(height: 3),
                      Card(

                        color: Colors.transparent,
                        margin: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 2),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => tictacto()),
                                            );
                                          },
                               child:TextAnimator(
                                 'Tic Tac Toe',
                                           style: GoogleFonts.orbitron(
                                  textStyle: TextStyle(
                                             fontWeight: FontWeight.bold,
                                             fontSize: 15,
                                    color: Colors.pinkAccent,
                                             ),),
                                                ),





                                        ))],
                                  ),

                                ])
                        ),
                      ),
                      SizedBox(height: 3),
                      Card(
                        color: Colors.transparent,
                        margin: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 2),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(

                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => boxii()),
                                              );
                                            },
                                            child:TextAnimator(
                                                'Boxii',
                                                style: GoogleFonts.orbitron(
                                                  textStyle: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Colors.pinkAccent,

                                                  ),),
                                            )




                                            ,
                                          ))],
                                  ),

                                ])
                        ),
                      ),
                    ]
                ),
              ], ),
          ),
        ));
  }}


