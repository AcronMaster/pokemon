import "package:flutter/material.dart";

// Clase MyBoy que representa un personaje en el juego
// ignore: must_be_immutable
class MyBoy extends StatelessWidget {
  final int boySpriteCount;
  final String direction;
  final String location;
  double heigth = 20;

  // Constructor de la clase MyBoy, requiere los parámetros boySpriteCount, direction y location
  MyBoy(
      {super.key,
      required this.boySpriteCount,
      required this.direction,
      required this.location});

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    // Asigna la altura del personaje según su ubicación
    if (location == "littleroot") {
      heigth = 20;
    } else if (location == "pokelab") {
      heigth = 30;
    } else if (location == "battleground") {
      location == "attackoptions";
      location == "battlefinishedscreen";
      heigth = 0;
    }
    return Container(
      height: heigth,
      child: Image.asset(
        "lib/images/boy" + direction + boySpriteCount.toString() + ".png",
        fit: BoxFit.cover,
      ),
    );
  }
}
