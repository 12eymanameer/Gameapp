import 'package:flutter/services.dart';
import 'package:tictac/boxii.dart';

import 'package:tictac/values.dart';

class boxiishape {
  boxipieces type;
  boxiishape({required this.type});
  List<int> postion = [];
  Color get color {
    return boxicolors[type] ?? const Color(0xFFFFFFFF);
  }
  void intializeboxi() {
    switch (type) {
      case boxipieces.L:
        postion = [-26, -16, -6, -5];
        break;
      case boxipieces.J:
        postion = [-25, -15, -5, -6];
        break;
      case boxipieces.I:
        postion = [-4, -5, -6, -7];
        break;
      case boxipieces.S:
        postion = [-15, -14, -6, -5];
        break;
      case boxipieces.O:
        postion = [-15, -16, -5, -6];
        break;
      case boxipieces.Z:
        postion = [-17, -16, -6, -5];
        break;
      case boxipieces.T:
        postion = [-26, -16, -6, -15];
        break;
      default:
    }
  }
  void movepiece(directions direction) {
    switch (direction) {
      case directions.down:
        for (int i = 0; i < postion.length; i++) {
          postion[i] += rowslength;
        }
        break;
      case directions.right:
        for (int i = 0; i < postion.length; i++) {
          postion[i] += 1;
        }
        break;
      case directions.left:
        for (int i = 0; i < postion.length; i++) {
          postion[i] -= 1;
        }
        break;
      default:
    }
  }

  int rotationstate = 1;
  void rotationState() {
    List<int> newPostion = [];
    switch (type) {
      case boxipieces.L:
        switch (rotationstate) {
          case 0:
            newPostion = [
              postion[1] - rowslength,
              postion[1],
              postion[1] + 1,
              postion[1] + rowslength + 1,
            ];
            if (piecePositionIsValid(newPostion)) {
              postion = newPostion;
              rotationstate = (rotationstate + 1) % 4;
            }
            break;
          case 1:
            newPostion = [
              postion[1] - 1,
              postion[1],
              postion[1] + 1,
              postion[1] + rowslength - 1,
            ];
            if (piecePositionIsValid(newPostion)) {
              postion = newPostion;
              rotationstate = (rotationstate + 1) % 4;
            }
            break;
          case 2:
            newPostion = [
              postion[1] + rowslength,
              postion[1],
              postion[1] - rowslength,
              postion[1]- rowslength - 1,
            ];
            if (piecePositionIsValid(newPostion)) {
              postion = newPostion;
              rotationstate = (rotationstate + 1) % 4;
            }
            break;
          case 3:
            newPostion = [
              postion[1] - rowslength + 1,
              postion[1],
              postion[1] + 1,
              postion[1] - 1,
            ];
            if (piecePositionIsValid(newPostion)) {
              postion = newPostion;
              rotationstate = (rotationstate + 1) % 4;
            }
            break;
        }
      case boxipieces.S:
        switch (rotationstate) {
          case 0:
            newPostion = [
              postion[1] ,
              postion[1]+1,
              postion[1] + rowslength -1,
              postion[1] + rowslength ,
            ];
            if (piecePositionIsValid(newPostion)) {
              postion = newPostion;
              rotationstate = (rotationstate + 1) % 4;
            }
            break;
          case 1:
            newPostion = [
              postion[0] - rowslength,
              postion[0],
              postion[0] + 1,
              postion[0] + rowslength + 1,
            ];
            if (piecePositionIsValid(newPostion)) {
              postion = newPostion;
              rotationstate = (rotationstate + 1) % 4;
            }
            break;
          case 2:
            newPostion = [
              postion[1] ,
              postion[1]+1,
              postion[1] +rowslength- 1,
              postion[1] + rowslength ,
            ];
            if (piecePositionIsValid(newPostion)) {
              postion = newPostion;
              rotationstate = (rotationstate + 1) % 4;
            }
            break;
          case 3:
            newPostion = [
              postion[0] - rowslength ,
              postion[0] ,
              postion[0] + 1,
              postion[0]  + rowslength+ 1,
            ];
            if (piecePositionIsValid(newPostion)) {
              postion = newPostion;
              rotationstate = (rotationstate + 1) % 4;
            }
            break;
        }
      case boxipieces.T:
        switch (rotationstate) {
          case 0:
            newPostion = [
              postion[2] - rowslength,
              postion[2],
              postion[2] + 1,
              postion[2] + rowslength,
            ];
            if (piecePositionIsValid(newPostion)) {
              postion = newPostion;
              rotationstate = (rotationstate + 1) % 4;
            }
            break;
          case 1:
            newPostion = [
              postion[1] - 1,
              postion[1],
              postion[1] + 1,
              postion[1] + rowslength ,
            ];
            if (piecePositionIsValid(newPostion)) {
              postion = newPostion;
              rotationstate = (rotationstate + 1) % 4;
            }
            break;
          case 2:
            newPostion = [
              postion[1] - rowslength,
              postion[1]-1,
              postion[1] ,
              postion[1] + rowslength ,
            ];
            if (piecePositionIsValid(newPostion)) {
              postion = newPostion;
              rotationstate = (rotationstate + 1) % 4;
            }
            break;
          case 3:
            newPostion = [
              postion[2] - rowslength ,
              postion[2]-1,
              postion[2] + 1,
              postion[2] ,
            ];
            if (piecePositionIsValid(newPostion)) {
              postion = newPostion;
              rotationstate = (rotationstate + 1) % 4;
            }
            break;
        }
      case boxipieces.O:
            break;
      case boxipieces.Z:
        switch (rotationstate) {
          case 0:
            newPostion = [
              postion[0] - rowslength-2,
              postion[1],
              postion[2] + rowslength-1,
              postion[3] + 1,
            ];
            if (piecePositionIsValid(newPostion)) {
              postion = newPostion;
              rotationstate = (rotationstate + 1) % 4;
            }
            break;
          case 1:
            newPostion = [
              postion[0] - rowslength+2,
              postion[1],
              postion[2] -rowslength+ 1,
              postion[3]  - 1,
            ];
            if (piecePositionIsValid(newPostion)) {
              postion = newPostion;
              rotationstate = (rotationstate + 1) % 4;
            }
            break;
          case 2:
            newPostion = [
              postion[0] + rowslength-2,
              postion[1],
              postion[2] +rowslength- 1,
              postion[3]  +1,
            ];
            if (piecePositionIsValid(newPostion)) {
              postion = newPostion;
              rotationstate = (rotationstate + 1) % 4;
            }
            break;
          case 3:
            newPostion = [
              postion[0] - rowslength + 2,
              postion[1],
              postion[2] -rowslength+ 1,
              postion[3] - 1,
            ];
            if (piecePositionIsValid(newPostion)) {
              postion = newPostion;
              rotationstate = (rotationstate + 1) % 4;
            }
            break;
        }
      case boxipieces.J:
        switch (rotationstate) {
          case 0:
            newPostion = [
              postion[1] - rowslength,
              postion[1],
              postion[1] + 1,
              postion[1] + rowslength - 1,
            ];
            if (piecePositionIsValid(newPostion)) {
              postion = newPostion;
              rotationstate = (rotationstate + 1) % 4;
            }
            break;
          case 1:
            newPostion = [
              postion[1] - rowslength -1,
              postion[1],
              postion[1] - 1,
              postion[1] +  1,
            ];
            if (piecePositionIsValid(newPostion)) {
              postion = newPostion;
              rotationstate = (rotationstate + 1) % 4;
            }
            break;
          case 2:
            newPostion = [
              postion[1] + rowslength,
              postion[1],
              postion[1] - rowslength,
              postion[1] - rowslength + 1,
            ];
            if (piecePositionIsValid(newPostion)) {
              postion = newPostion;
              rotationstate = (rotationstate + 1) % 4;
            }
            break;
          case 3:
            newPostion = [
              postion[1]  + 1,
              postion[1],
              postion[1] - 1,
              postion[1]+ rowslength+ 1,
            ];
            if (piecePositionIsValid(newPostion)) {
              postion = newPostion;
              rotationstate = (rotationstate + 1) % 4;
            }
            break;
        }
      case boxipieces.I:
        switch (rotationstate) {
          case 0:
            newPostion = [
              postion[1] - 1,
              postion[1],
              postion[1] + 1,
              postion[1] + 2,
            ];
            if (piecePositionIsValid(newPostion)) {
              postion = newPostion;
              rotationstate = (rotationstate + 1) % 4;
            }
            break;
          case 1:
            newPostion = [
              postion[1] - rowslength,
              postion[1],
              postion[1] + rowslength,
              postion[1] +2 * rowslength,
            ];
            if (piecePositionIsValid(newPostion)) {
              postion = newPostion;
              rotationstate = (rotationstate + 1) % 4;
            }
            break;
          case 2:
            newPostion = [
              postion[1] + 1,
              postion[1],
              postion[1] - 1,
              postion[1] - 2,
            ];
            if (piecePositionIsValid(newPostion)) {
              postion = newPostion;
              rotationstate = (rotationstate + 1) % 4;
            }
            break;
          case 3:
            newPostion = [
              postion[1] + rowslength ,
              postion[1],
              postion[1] - rowslength,
              postion[1] -2 * rowslength,
            ];
            if (piecePositionIsValid(newPostion)) {
              postion = newPostion;
              rotationstate = (rotationstate + 1) % 4;
            }
            break;
        }
        break;

      default:
    }
  }

  bool positionIsValid(int position) {
    int row = (position / rowslength).floor();
    int col = position % rowslength;
    if (row < 0 || col < 0 || gameboard[row][col] != null) {
      return false;
    } else {
      return true;
    }
  }

  bool piecePositionIsValid(List<int> piecePosition) {
    bool firstCol = false;
    bool lastCol = false;

    for (int pos in piecePosition) {
      if (!positionIsValid(pos)) {
        return false;
      }
      int col = pos % rowslength;
      if (col == 0) {
        firstCol = true;
      }
      if (col == rowslength - 1) {
        lastCol = true;
      }
    }
    return !(firstCol && lastCol);
  }
}