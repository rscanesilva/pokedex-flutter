import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:pokedex_flutter/pages/home/model/pokemon.dart';

class ApiService {
  Future getPokemonsByRegion() async {
    try {
      var url = Uri.parse("https://eo2823n47yg0zuk.m.pipedream.net");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List jsonResult = jsonDecode(response.body);
        Map<String, List<Pokemon>> map = {};

        for (var element in jsonResult) {
          List<dynamic> listDynamic = element['listPokemons'];
          List<Pokemon> list = [];
          for (var e in listDynamic) {
            var type = getTypeFromString(e['type']);
            list.add(Pokemon(e['name'], type, e['img'], e['favorite']));
          }

          map[element['region']] = list;
        }

        return map;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  PokemonType getTypeFromString(String type) {
    for (PokemonType element in PokemonType.values) {
      if (element.toString().split('.')[1] == type) {
        return element;
      }
    }
    return PokemonType.Normal;
  }
}
