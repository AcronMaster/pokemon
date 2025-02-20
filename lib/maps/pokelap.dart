import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyPokelap extends StatelessWidget {
  double x;
  double y;
  String currentMap;

  MyPokelap({
    required this.x,
    required this.y,
    required this.currentMap,
  });

  @override
  Widget build(BuildContext context) {
    print("Pokelab: x=$x, y=$y, currentMap=$currentMap"); // Debug

    if (currentMap == "pokelap") {
      return Container(
        alignment: Alignment(x, y),
        child: Image.asset(
          "lib/images/pokelab.png",
          width: MediaQuery.of(context).size.width * 0.75,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Container();
    }
  }
}
