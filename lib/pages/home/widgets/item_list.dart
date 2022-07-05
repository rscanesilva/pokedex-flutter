import 'package:flutter/material.dart';

class ListPokemons extends StatelessWidget {
  const ListPokemons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeigth = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeigth * 0.26,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: const <Widget>[
          CardItemList(
            nome: 'Squirtle',
            url:
                'https://www.seekpng.com/png/full/147-1474793_squirtle-pokemon-squirtle.png',
          ),
          CardItemList(
            nome: 'Charmander',
            url:
                'https://capturegobr.files.wordpress.com/2017/02/pokemon-go-getters-charmander.png',
          ),
          CardItemList(
            nome: 'Mewtwo',
            url:
                'https://www.pngmart.com/files/13/Mewtwo-Pokemon-Species-PNG-File.png',
          ),
          CardItemList(
            nome: 'Charizard',
            url:
                'http://www.pintarcolorir.com.br/wp-content/uploads/2015/04/Desenhos-para-colorir-Charizard-01-172x168.png',
          ),
        ],
      ),
    );
  }
}

class CardItemList extends StatelessWidget {
  final String url;
  final String nome;
  const CardItemList({Key? key, required this.url, required this.nome})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Container(
        width: MediaQuery.of(context).size.width * .35,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white12, width: 0.6),
            color: const Color.fromARGB(17, 19, 149, 255),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(nome),
              Image.network(url, height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [const Icon(Icons.heart_broken)],
              )
            ],
          ),
        ),
      ),
    );
  }
}
