class Pokemon {
  final String name;
  final PokemonType type;
  final String imgUrl;
  final bool isFavorite;
  const Pokemon(this.name, this.type, this.imgUrl, this.isFavorite);
}

enum PokemonType { Water, Normal, Fire, Steel, Psychic, Ice, Eletric }
