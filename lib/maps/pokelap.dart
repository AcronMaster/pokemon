import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyPokelap extends StatefulWidget {
  double x;
  double y;
  String currteMap;

  MyPokelap({required this.x, required this.y, required this.currteMap});

  @override
  // ignore: override_on_non_overriding_member
  Widget build(BuildContext context) {
    if (currteMap == "pokelap") {
      return Container(
        alignment: Alignment(x, y),
        child: Image.asset(
          "lib/images/pokelap.png",
          width: MediaQuery.of(context).size.width * 0.75,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
