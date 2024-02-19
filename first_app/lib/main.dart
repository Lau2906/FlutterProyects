import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';

void main() {
  runApp(
     const MaterialApp(
      home: Scaffold(
        body: GradientContainer( colors: [
                Color.fromRGBO(239, 28, 98, 1),
                Color.fromARGB(255, 233, 67, 122),
                Color.fromARGB(255, 255, 171, 199)
              ],
            ),
      ),
    ),
  );
}

