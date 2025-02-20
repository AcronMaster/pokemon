//Librerias necesarias para el juego
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pokemon/button.dart';
import 'package:pokemon/charaters/boy.dart';
import 'package:pokemon/maps/littleroot.dart';
import 'package:pokemon/maps/pokelap.dart';

void main() {
  runApp(const MyApp());
}

// Clase principal que inicia la aplicación Flutter
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // Página principal del juego
    );
  }
}

// Widget con estado para manejar la pantalla principal del juego
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Coordenadas del mapa y personaje
  double mapX = 0.85;
  double mapY = 0.375;

  double lapMapX = 0;
  double lapMapY = 0;

  String currentLocation = "littleroot"; // Ubicación actual del jugador
  double step = 0.25; // Tamaño del paso al moverse

  // ignore: unused_field
  static double steplab = 0.43;

  List<List<double>> noMansLandLab = [
    [0.5, 0.5],
  ];
  // Lista de coordenadas que representan áreas inaccesibles (colisiones) en el mapa
  List<List<double>> noMansLandlitteroot = [
    [2.1, 0.375],
    [2.1, 0.625],
    [2.1, 0.875],
    [2.1, 1.125],
    [0.3500000000000001, 1.625],
    [0.10000000000000009, 1.625],
    [0.8500000000000001, 1.625],
    [0.6000000000000001, 1.625],
    [1.1, 1.625],
    [1.35, 1.625],
    [1.6, 1.625],
    [1.6, 1.375],
    [1.6, 1.125],
    [1.85, 1.375],
    [2.1, 0.125],
    [2.1, -0.125],
    [2.1, -0.375],
    [2.1, -0.625],
    [2.1, -0.875],
    [1.85, -0.875],
    [1.6, -0.875],
    [1.6, -1.125],
    [1.35, -1.125],
    [1.1, -1.125],
    [0.8500000000000001, -1.125],
    [0.6000000000000001, -1.125],
    [0.3500000000000001, -1.125],
    [0.10000000000000009, -1.125],
    [-0.1499999999999999, -1.125],
    [-0.3999999999999999, -1.125],
    [-0.6499999999999999, -1.125],
    [-0.8999999999999999, -1.125],
    [-1.15, -1.125],
    [-1.4, -1.125],
    [-1.4, -0.875],
    [-1.65, -0.875],
    [-1.65, -0.625],
    [-1.9, -0.625],
    [-1.9, -0.625],
    [-2.15, -0.375],
    [-2.15, -0.125],
    [-2.15, 0.125],
    [-2.15, 0.375],
    [-2.15, 0.625],
    [-2.15, 0.875],
    [-2.15, 1.125],
    [-2.15, 1.375],
    [-1.9, 1.375],
    [-1.65, 1.375],
    [-1.65, 1.625],
    [-1.4, 1.625],
    [-1.15, 1.625],
    [-0.8999999999999999, 1.625],
    [-0.6499999999999999, 1.625],
    [1.1, -0.625],
    [1.35, -0.625],
    [1.35, -0.375],
    [1.35, -0.125],
    [1.1, -0.125],
    [0.8500000000000001, -0.125],
    [0.6000000000000001, -0.125],
    [0.3500000000000001, -0.125],
    [0.10000000000000009, -0.125],
    [0.10000000000000009, -0.375],
    [0.10000000000000009, -0.625],
    [0.8500000000000001, -0.625],
    [0.8500000000000001, 0.625],
    [1.1, 0.625],
    [1.35, 0.625],
    [1.35, 0.875],
    [1.1, 0.875],
    [0.8500000000000001, 0.875],
    [0.6000000000000001, 0.875],
    [0.6000000000000001, 0.625],
    [-0.8999999999999999, 0.625],
    [-1.15, 0.625],
    [-1.4, 0.625],
    [-1.4, 0.875],
    [-1.15, 0.875],
    [-0.8999999999, 999999, 0.875],
    [-0.8999999999999999, 0.785],
    [0.3500000000000001, -0, 375],
    [0.6000000000000001, -0.375],
    [-0.65, 0.875],
    [0.35, -0.375],
  ]; //coordenadas de áreas restringidas

  int boySpriteCount = 0; // Contador de animaciones del personaje
  String boyDirection = "Dow"; // Dirección inicial del personaje

  // Función para mover al personaje hacia arriba
  void moveUp() {
    boyDirection = "Up";
    if (currentLocation == "littleroot") {
      if (canMove(boyDirection, noMansLandlitteroot, mapX, mapY)) {
        setState(() {
          mapY += step;
        });
      }
      if (double.parse((mapX).toStringAsFixed(4)) == 0.35 &&
          double.parse((mapY).toStringAsFixed(4)) == -0.625) {
        setState(() {
          currentLocation = "pokelap";
          lapMapX = 0;
          lapMapY = -2.73;
        });
      }
    } else if (currentLocation == "pokelap") {
      if (canMove(boyDirection, noMansLandLab, lapMapX, lapMapY)) {
        setState(() {
          lapMapY += step;
        });
      }
    }
    animeWalk();
  }

  void moveDown() {
    boyDirection = "Dow";
    if (currentLocation == "littleroot") {
      if (canMove(boyDirection, noMansLandlitteroot, mapX, mapY)) {
        setState(() {
          mapY -= step;
        });
      }
    } else if (currentLocation == "pokelap") {
      if (canMove(boyDirection, noMansLandLab, lapMapX, lapMapY)) {
        setState(() {
          lapMapY -= step;
        });
      }
    }
    if (currentLocation == "pokelap") {
      if (double.parse((lapMapX).toStringAsFixed(4)) == 0.0 &&
          double.parse((lapMapY).toStringAsFixed(4)) == -2.73) {
        setState(() {
          currentLocation = "littleroot";
          mapX = 0.35;
          mapY = -0.625;
        });
      }
    }

    animeWalk();
  }

  void moveLeft() {
    boyDirection = "Left";
    if (currentLocation == "littleroot") {
      if (canMove(boyDirection, noMansLandlitteroot, mapX, mapY)) {
        setState(() {
          mapX += step;
        });
      }
    } else if (currentLocation == "pokelap") {
      if (canMove(boyDirection, noMansLandLab, lapMapX, lapMapY)) {
        setState(() {
          lapMapX += step;
        });
      }
    }
    animeWalk();
  }

  void moveRigth() {
    boyDirection = "Rigth";
    if (currentLocation == "littleroot") {
      if (canMove(boyDirection, noMansLandlitteroot, mapX, mapY)) {
        setState(() {
          mapX -= step;
        });
      }
    } else if (currentLocation == "pokelap") {
      if (canMove(boyDirection, noMansLandLab, lapMapX, lapMapY)) {
        setState(() {
          lapMapX -= step;
        });
      }
    }
    animeWalk();
  }

  void pressedA() {} // Acción cuando se presiona el botón "A"
  void pressedB() {} // Acción cuando se presiona el botón "B"

  // Función para animar el movimiento del personaje
  void animeWalk() {
    print("x:" + mapX.toString() + "y:" + mapY.toString());

    Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        boySpriteCount++;
      });
      if (boySpriteCount == 3) {
        boySpriteCount = 0;
        timer.cancel();
      }
    });
  }

  // Función para limpiar los valores numéricos y evitar errores de precisión
  double cleanNum(double num) {
    return double.parse(num.toStringAsFixed(2));
  }

  // Función para verificar si el personaje puede moverse a la siguiente posición
  bool canMove(String direction, var noMosLand, double x, double y) {
    double stepX = 0;
    double stepY = 0;

    if (direction == "Left") {
      stepX = step;
      stepY = 0;
    } else if (direction == "Rigth") {
      stepX = -step;
      stepY = 0;
    } else if (direction == "Up") {
      stepX = 0;
      stepY = step;
    } else if (direction == "Dow") {
      stepX = 0;
      stepY = -step;
    }

    for (int i = 0; i < noMosLand.length; i++) {
      if ((cleanNum(noMosLand[i][0]) == cleanNum(x + stepX)) &&
          (cleanNum(noMosLand[i][1]) == cleanNum(y + stepY))) {
        return false; // No puede moverse a la siguiente posición
      }
    }
    return true; // Puede moverse
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              color: Colors.black,
              child: Stack(
                children: [
                  Littleroot(
                    x: mapX,
                    y: mapY,
                    currentMap: currentLocation,
                  ),
                  //Laboratorio pokemon
                  MyPokelap(
                    x: lapMapX,
                    y: lapMapY,
                    currentMap: currentLocation,
                  ),
                  Container(
                      alignment: Alignment(0, 0),
                      child: MyBoy(
                        location: currentLocation,
                        boySpriteCount: boySpriteCount,
                        direction: boyDirection,
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[900],
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "G A M E B O Y",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Text(" あ ",
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 20)),
                            Text("F L U T T E R",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                          ],
                        ),
                        // Controles del juego (botones de dirección y acciones)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Botones direccionales
                            Row(
                              children: [
                                Column(children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                  ),
                                  MyButton(
                                    text: "←",
                                    function: moveLeft,
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                  ),
                                ]),
                                Column(children: [
                                  MyButton(
                                    text: "↑",
                                    function: moveUp,
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                  ),
                                  MyButton(
                                    text: "↓",
                                    function: moveDown,
                                  ),
                                ]),
                                Column(children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                  ),
                                  MyButton(
                                    text: "→",
                                    function: moveRigth,
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                  ),
                                ]),
                              ],
                            ),
                            // Botones de acción A y B
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                    ),
                                    MyButton(
                                      text: "b",
                                      function: pressedB,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    MyButton(
                                      text: "a",
                                      function: pressedA,
                                    ),
                                    Container(
                                      height: 50,
                                      width: 50,
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        Text(
                          "C R E A T E D B Y A D R I A N",
                          style: TextStyle(color: Colors.white),
                        ),
                      ])),
            ),
          ),
        ],
      ),
    );
  }
}
