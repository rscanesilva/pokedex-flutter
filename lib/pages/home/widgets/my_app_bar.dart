// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        Container(
          height: MediaQuery.of(context).size.height * .15,
          //color: Color.fromARGB(103, 41, 181, 246),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                'https://3.bp.blogspot.com/-18875iR4Xs0/V6_43NnrV-I/AAAAAAAAp2k/n2lHRQARYb8sqKi-dQQD8ywjdqKbLWNoACLcB/s1600/pokebola.png',
                height: 50,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Pokemons',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
