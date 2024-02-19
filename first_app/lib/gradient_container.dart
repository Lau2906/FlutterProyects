import 'package:flutter/material.dart';
import 'package:first_app/roll_dice.dart';

const starAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget{
  const GradientContainer({super.key, required this.colors});

  final List<Color> colors;
  

  @override
  Widget build(context) {
    return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: starAlignment,
              end: endAlignment,
            ),
          ),
          child:  const Center(
            child: DiceRoller(),
          ),
    );
  }
}

