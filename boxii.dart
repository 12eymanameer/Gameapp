import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictac/boxiishape.dart';
import 'package:tictac/values.dart';
import 'package:tictac/boxii.dart';
import 'package:tictac/pixel.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

List <List<boxipieces?>> gameboard =
List.generate(collength, (i) => List.generate(
          rowslength,
            (j)=>null,
        ));
class boxii extends StatefulWidget {
  const boxii({super.key});

  @override
  State<boxii> createState() => _boxiiState();
}

class _boxiiState extends State<boxii> {

  boxiishape currentPiece =boxiishape(type:boxipieces.T);
  int currentscore=0;
  bool gameover=false;
  @override
  void initState(){
    super.initState();
    startGame();
  }
  void startGame(){
    currentPiece.intializeboxi();
    Duration framerate =const Duration(milliseconds: 400);
    gameLoop (framerate);
  }
  void gameLoop(Duration framerate){
    Timer.periodic(
      framerate,
        (timer){
        setState(() {
          clear();
          checklanding();
          if (gameover==true){
            timer.cancel();
            _showwindialodue();

          }
          currentPiece.movepiece(directions.down);
        });
        },
    );
  }
  bool checkCollision(directions direction){
    for (int i =0 ;i<currentPiece.postion.length;i++)
      {
        int row = (currentPiece.postion[i]/rowslength).floor();
        int col = currentPiece.postion[i]%rowslength;

    if (direction==directions.left){
      col-=1;
    }else  if (direction==directions.right){
      col+=1;
    } else  if (direction==directions.down){
      row +=1;
    }
    if(row>=collength || col <0 || col >= rowslength){
      return true;
    }
      if (row >= 0 && gameboard[row][col] != null){
        return true;
  }}
    return false;
  }
  void checklanding(){
    if(checkCollision(directions.down)){
    for (int i =0 ;i<currentPiece.postion.length;i++)
    {
    int row = (currentPiece.postion[i]/rowslength).floor();
    int col = currentPiece.postion[i]%rowslength;
    if(row>=0 && col >=0){
      gameboard[row][col]=currentPiece.type;
    }
    }
    createnewpiece();
    }
  }
  void createnewpiece(){
    Random rand = Random();
    boxipieces randomType=boxipieces.values[rand.nextInt(boxipieces.values.length)];
 currentPiece=boxiishape (type:randomType);
 currentPiece.intializeboxi();
 if (isgameover()){
  gameover=true;
 }
  }
  void moveleft(){
    if(!checkCollision((directions.left))){
      setState(() {
        currentPiece.movepiece((directions.left));
      });
    }
  }
  void moveright(){
    if(!checkCollision((directions.right))){
      setState(() {
        currentPiece.movepiece((directions.right));
      });
    }
  }
  void moverotate(){
   setState(() {
     currentPiece.rotationState();
   });

  }
  void clear(){
    for(int row=collength-1;row>=0;row--) {
      bool rowisfull = true;

      for (int col = 0; col < rowslength; col++) {
        if (gameboard[row][col] == null) {
          rowisfull = false;
          break;
        }
      }
      if(rowisfull){
        for(int r=row;r>0;r--){
          gameboard[r]=List.from((gameboard[r-1]));
        }

      gameboard[0]=List.generate(row, (index) => null);
     currentscore++;
    }
    }
  }
    bool isgameover(){
    for(int col=0;col<rowslength;col++){
      if (gameboard[0][col] != null){
        return true;
      }
    }
    return false;
}
  void  _showwindialodue(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Stack(
            children: <Widget>[
              Positioned.fill(
                child: Image.asset('asset/4721bb567a7bc99e4564a606df352d23.gif',
                  fit: BoxFit.cover,
                ),
              ),
              GiffyDialog.image(
                  backgroundColor: Color((0xFF020B1C)),
                  Image(
                    image: AssetImage(
                        'asset/cdb14b1f2ec4963f3b9801487757363a.gif'),
                    fit: BoxFit.cover,

                  ),

                  title: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: TextAnimator(
                        'Game Over',
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
                  ),

                  actions: [
                    TextButton(
                      onPressed: () {
                        clearboard();
                        Navigator.of(context).pop();
                      },
                      child: Text('RETRY', style: GoogleFonts.orbitron(
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
      );
  }

  void clearboard(){

 gameboard = List.generate(collength, (i) => List.generate(
      rowslength,
          (j)=>null,
    ));
    gameover=false;
    currentscore=0;
    createnewpiece();
startGame();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
                itemCount: rowslength * collength ,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: rowslength),
                itemBuilder:( context ,  index){
                  int row = (index/rowslength).floor();
                  int col = index%rowslength;
                  if(currentPiece.postion.contains(index)){
                   return pixel(
                     color:Colors.lightGreen,
                    child:index,
                   );
                  }
                  else if (gameboard[row][col] != null){
                    final boxipieces? boxipiecesType = gameboard[row][col];

                    return pixel( color: boxicolors[boxipiecesType],child: '');
                  }

                  else {
                    return pixel (
                      child:index,
                      color:Colors.blueGrey.shade900,
                    );
                  }
                }

                  ),
          ),SizedBox(height: 3,),
          Text('SCORE : $currentscore' ,
              style: GoogleFonts.orbitron(
            textStyle: TextStyle(
              color: Colors.redAccent,
              letterSpacing: .5,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),)),
          SizedBox(height: 5,),

         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             IconButton(
               onPressed:moveleft,
                color: Colors.greenAccent,
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined),),
             IconButton(
               onPressed:moverotate,
               color: Colors.limeAccent,
               icon: Icon(
                   Icons.rotate_90_degrees_cw_outlined),),
             IconButton(
               onPressed:moveright,
               color: Colors.purpleAccent,
               icon: Icon(
                   Icons.arrow_forward_ios_outlined),),


           ],

            )
        ],
      )
           );
  }
}
