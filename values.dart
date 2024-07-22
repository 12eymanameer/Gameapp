import 'dart:ui';

int collength =14;
int rowslength = 10;

enum boxipieces {
  L,
  J,
  I,
  O,
  S,
  Z,
  T,
}
enum directions{
  left,
  right,
  down,
}
const Color myPink = Color(0xFFF06292); // Pink
const Color myRed = Color(0xFFFF5252); // Red
const Color myPurple = Color(0xFF673AB7); // Purple
const Color myCyan = Color(0xFF00BCD4); // Cyan
const Color myAmber = Color(0xFFFFC107); // Amber
const Color myGreen = Color(0xFF4CAF50); // Green
const Color myDeepOrange = Color(0xFFFF5722); // Deep Orange


const Map<boxipieces, Color> boxicolors = {
  boxipieces.I: myRed,
  boxipieces.J: myPink,
  boxipieces.S: myPurple,
  boxipieces.T: myCyan,
  boxipieces.O: myAmber ,
  boxipieces.Z: myGreen,
  boxipieces.L: myDeepOrange,
};