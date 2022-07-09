import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pokedex_flutter/pages/home/model/pokemon.dart';
import 'package:pokedex_flutter/pages/home/widgets/item_list.dart';
import 'package:pokedex_flutter/pages/home/widgets/my_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeigth = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeigth,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('./images/bg3.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Color.fromARGB(214, 1, 37, 80),
        body: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            MyAppBar(),
            const ContentWidget(),
            Positioned(
              bottom: 0 + MediaQuery.of(context).padding.bottom,
              left: 0,
              right: 0,
              height: screenHeigth * 0.07,
              child: Container(
                color: Color.fromARGB(44, 2, 141, 175),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: (screenWidth - 90) / 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(Icons.home, size: 30),
                      Icon(
                        Icons.search_sharp,
                        size: 30,
                        color: Color.fromARGB(120, 255, 255, 255),
                      ),
                      Icon(
                        Icons.favorite,
                        size: 30,
                        color: Color.fromARGB(120, 235, 223, 223),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  const ContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeigth = MediaQuery.of(context).size.height;
    return Positioned(
      top: screenHeigth * .18,
      left: 12,
      right: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: getList(),
      ),
    );
  }

  getList() {
    List<Widget> list = [];
    final Map<String, List<Pokemon>> map = HashMap();
    List<Pokemon> list1 = [];
    List<Pokemon> list2 = [];

    var squirtle = const Pokemon(
        "Squirtle",
        PokemonType.Water,
        "https://www.pngkey.com/png/full/154-1542418_banner-transparent-download-shiny-squirtle-pok-dex-pokemon.png",
        false);
    list1.add(squirtle);
    var charmander = const Pokemon(
        "Charmander",
        PokemonType.Fire,
        "https://www.pngkey.com/png/full/154-1542418_banner-transparent-download-shiny-squirtle-pok-dex-pokemon.png",
        true);
    list1.add(charmander);
    var charizard = const Pokemon(
        "Charmander",
        PokemonType.Fire,
        "http://www.pintarcolorir.com.br/wp-content/uploads/2015/04/Desenhos-para-colorir-Charizard-01-172x168.png",
        false);
    list1.add(charizard);

    var totodile = const Pokemon(
        "Totodile",
        PokemonType.Water,
        "https://static.wikia.nocookie.net/pokedex/images/e/e7/Totodile.png/revision/latest?cb=20141027203245&path-prefix=pt-br",
        true);
    list2.add(totodile);
    var croconaw = const Pokemon(
        "Croconaw",
        PokemonType.Water,
        "https://static.wikia.nocookie.net/pokedex/images/e/e7/Totodile.png/revision/latest?cb=20141027203245&path-prefix=pt-br",
        false);
    list2.add(croconaw);
    var pichu = const Pokemon(
        "Pichu",
        PokemonType.Water,
        "https://i.pinimg.com/originals/7d/22/d6/7d22d6f4a9510183539bb571cd9bc85b.png",
        true);
    list2.add(pichu);

    map["Kanto"] = list1;
    map["Johto"] = list2;

    map.forEach((key, value) {
      list.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(key,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ],
        ),
      );
      list.add(ListPokemonsWidget(listPokemons: value));
    });

    return list;
  }
}
