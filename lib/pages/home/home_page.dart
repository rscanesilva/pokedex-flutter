import 'package:flutter/material.dart';
import 'package:pokedex_flutter/pages/home/api_service.dart';
import 'package:pokedex_flutter/pages/home/model/pokemon.dart';
import 'package:pokedex_flutter/pages/home/widgets/item_list.dart';
import 'package:pokedex_flutter/pages/home/widgets/my_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, List<Pokemon>> map = {};

  @override
  void initState() {
    super.initState();
    getList();
  }

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
            ContentWidget(
              map: map,
            ),
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

  getList() async {
    map = (await ApiService().getPokemonsByRegion())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }
}

class ContentWidget extends StatelessWidget {
  Map<String, List<Pokemon>> map = {};

  ContentWidget({Key? key, required this.map}) : super(key: key);

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
    map.forEach(
      (key, value) {
        list.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Text(key,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ],
          ),
        );
        list.add(ListPokemonsWidget(listPokemons: value));
      },
    );
    return list;
  }
}
