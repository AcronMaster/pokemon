import 'package:flutter/material.dart';

// Clase MyButton: Un botón personalizado con bordes redondeados y funcionalidad táctil.
class MyButton extends StatelessWidget {
  final text; // Texto que se mostrará dentro del botón.
  final function; // Función que se ejecutará cuando se presione el botón.

  MyButton({this.function, this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Se ejecuta la función proporcionada cuando el usuario toca el botón.
      onTap: function,
      child: ClipRRect(
        // Borde redondeado con un radio de 10 píxeles.
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 2, color: Colors.white)),
          height: 50, // Altura del botón.
          width: 50, // Ancho del botón.
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
