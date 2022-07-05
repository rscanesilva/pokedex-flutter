import 'package:flutter/material.dart';
import 'package:pokedex_flutter/pages/home/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:
          ThemeData(primarySwatch: Colors.purple, brightness: Brightness.dark),
      home: const HomePage(),
    );
  }
}
