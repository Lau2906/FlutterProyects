import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = 2;

  void rollDice(){
    
    //el setState recargar la funcion de builden donde se cambio la img
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1; // 1 - 6
    });
  }

  @override
  Widget build(context) {
    return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/dice-$currentDiceRoll.jpg',
                  width: 200,
                ),
                //Se crea un nuevo widget de tipo sizedBox para lograr una separaciíne entre el botón y la img
                const SizedBox(height: 20),
                TextButton(
                  onPressed: rollDice, 
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white, 
                    textStyle: const TextStyle(
                      fontSize: 28
                    ),
                  ),
                  child: const Text("Oprimeme"),
                  )
              ],
          );
  }
}