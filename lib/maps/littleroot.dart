import "package:flutter/material.dart";

// Clase Littleroot que representa el mapa de Littleroot en el juego.
class Littleroot extends StatelessWidget {
  final double x;
  final double y; // Coordenadas de alineación en el contenedor
  final String
      currentMap; // Nombre del mapa actual en el que se encuentra el jugador

  Littleroot(
      {required this.x,
      required this.y,
      required this.currentMap}); // Constructor que requiere los parámetros x, y y currentMap

  @override
  Widget build(BuildContext context) {
    // Verifica si el mapa actual es "littleroot"
    if (currentMap == "littleroot") {
      return Container(
        // Alinea el contenido con las coordenadas proporcionadas
        alignment: Alignment(x, y),
        child: Image.asset(
          "lib/images/littleroot.png",
          width: MediaQuery.of(context).size.width * 0.75,
          fit: BoxFit.cover,
        ),
      );
    } else {
      // Si no está en "littleroot", retorna un contenedor vacío
      return Container();
    }
  }
}
