import 'package:flutter/material.dart';
import 'package:pokedex_flutter/pages/home/widgets/item_list.dart';
import 'package:pokedex_flutter/pages/home/widgets/my_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeigth = MediaQuery.of(context).size.height;
    double screenWidth = (MediaQuery.of(context).size.width - 90) / 3;
    return Container(
      height: screenHeigth,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('./img/bg.png'), fit: BoxFit.fitWidth),
      ),
      child: Scaffold(
        backgroundColor: Color.fromARGB(199, 1, 10, 54),
        body: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            MyAppBar(),
            const ContentWidget(),
            Positioned(
              bottom: 0 + MediaQuery.of(context).padding.bottom,
              left: 0,
              right: 0,
              height: screenHeigth * 0.06,
              child: Container(
                color: Color.fromARGB(111, 19, 149, 255),
                width: 10,
                child: Row(
                  children: const [
                    SizedBox(width: 76),
                    Icon(Icons.home, size: 30),
                    SizedBox(width: 75),
                    Icon(Icons.search, size: 30),
                    SizedBox(width: 75),
                    Icon(Icons.heart_broken, size: 30),
                  ],
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
      left: 0,
      right: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Text('Kanto',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ],
          ),
          const ListPokemons(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Text('Jhoto',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ],
          ),
          const ListPokemons(),
        ],
      ),
    );
  }
}
