import 'package:flutter/material.dart';
import '../model/pokemon.dart';

class TypeLabel extends StatelessWidget {
  final PokemonType type;
  const TypeLabel({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? color;
    switch (type) {
      case PokemonType.Water:
        color = const Color.fromARGB(255, 7, 98, 218);
        break;
      case PokemonType.Fire:
        color = const Color.fromARGB(255, 180, 76, 6);
        break;
      case PokemonType.Normal:
        color = const Color.fromARGB(255, 88, 84, 65);
        break;
      case PokemonType.Steel:
        color = const Color.fromARGB(255, 51, 52, 54);
        break;
      case PokemonType.Ice:
        color = const Color.fromARGB(255, 2, 171, 201);
        break;
      case PokemonType.Psychic:
        color = const Color.fromARGB(255, 131, 7, 189);
        break;
      case PokemonType.Eletric:
        color = Color.fromARGB(255, 118, 131, 4);
        break;
    }

    return Container(
      width: 40,
      height: 15,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      child: Column(
        // Vertically center the widget inside the column
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            type.name,
            style: const TextStyle(fontSize: 11),
          ),
        ],
      ),
    );
  }
}
