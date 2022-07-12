// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:pokedex_flutter/pages/home/model/pokemon.dart';
import 'package:pokedex_flutter/pages/home/widgets/type_label.dart';

class ListPokemonsWidget extends StatelessWidget {
  List<Pokemon> listPokemons = [];
  ListPokemonsWidget({Key? key, required this.listPokemons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeigth = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeigth * 0.26,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: getListOfCards(),
      ),
    );
  }

  getListOfCards() {
    List<Widget> listCards = [];
    for (Pokemon pokemon in listPokemons) {
      listCards.add(
        CardItemList(
          nome: pokemon.name,
          url: pokemon.imgUrl,
          type: pokemon.type,
          isFavorite: pokemon.isFavorite,
        ),
      );
    }
    return listCards;
  }
}

class CardItemList extends StatelessWidget {
  final String url;
  final String nome;
  final bool isFavorite;
  final PokemonType type;

  const CardItemList(
      {Key? key,
      required this.url,
      required this.nome,
      required this.type,
      this.isFavorite = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 13),
          child: Container(
            width: MediaQuery.of(context).size.width * .35,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white12, width: 0.7),
                color: const Color.fromARGB(5, 249, 250, 250),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(nome,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      TypeLabel(type: type),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.white,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Image.network(
            url,
            width: 120,
            height: 140,
          ),
        ),
      ],
    );
  }
}
