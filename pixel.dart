import 'package:flutter/material.dart';

class pixel extends StatelessWidget {
  var color;
  var child;

  pixel({super.key,required this.child,required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color:color,borderRadius:BorderRadius.circular(4))
      ,margin: EdgeInsets.all(1),

    );
  }
}
