import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictac/main.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
class tictacto extends StatefulWidget {
  const tictacto({super.key});

  @override
  State<tictacto> createState() => _tictactoState();
}

class _tictactoState extends State<tictacto> {
  bool ohturn=true;
  int Xscore=0;
  int Oscore=0;
  int filledboxes=0;
  List<String> displayXO=['','','','','','','','','',];
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color((0xFF020B1C)),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Player X',
                              style: GoogleFonts.orbitron(
                                textStyle: TextStyle(
                                  color: Colors.deepOrangeAccent,
                                  letterSpacing: .5,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),)),
                          Text(Xscore.toString(),
                            style:  GoogleFonts.orbitron(
                              textStyle: TextStyle(
                                color: Colors.deepOrangeAccent,
                                letterSpacing: .5,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Player O ',style: GoogleFonts.orbitron(
                            textStyle: TextStyle(
                              color: Colors.redAccent,
                              letterSpacing: .5,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),),
                          Text(Oscore.toString(), style: GoogleFonts.orbitron(
                            textStyle: TextStyle(
                              color: Colors.redAccent,
                              letterSpacing: .5,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),SizedBox(height: 5,),
            Expanded(
              child: GridView.builder(
                  itemCount: 9 ,
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemBuilder:(BuildContext context , int index){
                    return GestureDetector(
                      onTap: (){
                        _tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.yellow)
                        ),
                        child: Center(child: Text( displayXO[index],style: TextStyle(color: Colors.cyan,fontSize: 40),)),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),

    );
  }
  void _checkwin(){
    if(displayXO[0]==displayXO[1]&& displayXO[0]==displayXO[2] && displayXO[0]!=''){
      _showwindialodue(displayXO[0]);
    }
    if(displayXO[3]==displayXO[4]&& displayXO[3]==displayXO[5] && displayXO[3]!=''){
      _showwindialodue(displayXO[3]);
    }
    if(displayXO[6]==displayXO[7]&& displayXO[6]==displayXO[8] && displayXO[6]!=''){
      _showwindialodue(displayXO[6]);
    }
    if(displayXO[0]==displayXO[3]&& displayXO[0]==displayXO[6] && displayXO[0]!=''){
      _showwindialodue(displayXO[0]);
    }
    if(displayXO[1]==displayXO[4]&& displayXO[1]==displayXO[7] && displayXO[1]!=''){
      _showwindialodue(displayXO[1]);
    }
    if(displayXO[2]==displayXO[5]&& displayXO[2]==displayXO[8] && displayXO[2]!=''){
      _showwindialodue(displayXO[2]);
    }
    if(displayXO[6]==displayXO[4]&& displayXO[6]==displayXO[2] && displayXO[6]!=''){
      _showwindialodue(displayXO[6]);
    }
    if(displayXO[0]==displayXO[4]&& displayXO[0]==displayXO[8] && displayXO[0]!=''){
      _showwindialodue(displayXO[0]);
    }else if (filledboxes==9){
      _showdrawdialogue();
    }



  }
  void _tapped(int index){

    setState(() {
      if(ohturn && displayXO[index]== ''){
        displayXO[index]='o';
        filledboxes+=1;
      }else if (!ohturn && displayXO[index]== ''){
        displayXO[index]='x';
        filledboxes+=1;
      }
    });
    ohturn=!ohturn;
    _checkwin();

  }
  void  _showwindialodue(String winner){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Stack(
            children:<Widget>[
              Positioned.fill(
                child: Image.network(
                  'https://i.pinimg.com/originals/47/21/bb/4721bb567a7bc99e4564a606df352d23.gif',

                  fit: BoxFit.cover,
                ),
              ),
              GiffyDialog.image(
                  backgroundColor: Color((0xFF020B1C)),
                  Image(
                    image: AssetImage(
                        'asset/d7ca5b358890d9c256aa91f7857b47c4.gif'),
                    fit: BoxFit.cover,

                  ),

                  title: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: TextAnimator(
                      '$winner Player Wins',
                      style: GoogleFonts.orbitron(
                        textStyle: TextStyle(
                          color: Colors.greenAccent,
                          letterSpacing: .5,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),

                      ),
                      atRestEffect: WidgetRestingEffects.pulse(effectStrength: 0.6),
                      incomingEffect: WidgetTransitionEffects.incomingSlideInFromRight(
                          blur: const Offset(1, 20), scale: 2),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  actions: [
                    TextButton(
                      onPressed: () {
                        _clearBoard();
                        Navigator.of(context).pop(); },
                      child:  Text('RETRY',style: GoogleFonts.orbitron(
                        textStyle: TextStyle(
                          color: Colors.redAccent,
                          letterSpacing: .5,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),),),
                    ),]
              ),
            ]
        );

      },
    );
    if(winner=='o'){
      Oscore = Oscore+1 ;
    }else if (winner=='x'){
      Xscore=Xscore+1;
    }
    _clearBoard;
  }
  void _clearBoard (){
    setState(() {
      for(int i=0;i<9;i++){
        displayXO[i]='';
      } filledboxes=0;
    });
  }
  void  _showdrawdialogue(){
    showDialog(
        context: context,
        builder: (BuildContext context)
        {
          return Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Image.asset('assets/4721bb567a7bc99e4564a606df352d23.gif',
                  fit: BoxFit.cover,)
                ),
                GiffyDialog.image(
                    backgroundColor: Color((0xFF020B1C)),
                    Image(
                      image: AssetImage(
                          'asset/4ca22d5ed2714778759a6f2d082ea13e.gif'),
                      fit: BoxFit.cover,

                    ),

                    title: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: TextAnimator(
                        ' D R A W ',
                        style: GoogleFonts.orbitron(
                          textStyle: TextStyle(
                            color: Colors.greenAccent,
                            letterSpacing: .5,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),

                        ),
                        atRestEffect: WidgetRestingEffects.pulse(
                            effectStrength: 0.6),
                        incomingEffect: WidgetTransitionEffects
                            .incomingSlideInFromRight(
                            blur: const Offset(1, 20), scale: 2),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    actions: [
                      TextButton(
                        onPressed: () {
                          _clearBoard();
                          Navigator.of(context).pop();
                        },
                        child: Text('Play Again', style: GoogleFonts.orbitron(
                          textStyle: TextStyle(
                            color: Colors.redAccent,
                            letterSpacing: .5,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),),),
                      ),

                    ]
                ),
              ]
          );

        }
    );}
}