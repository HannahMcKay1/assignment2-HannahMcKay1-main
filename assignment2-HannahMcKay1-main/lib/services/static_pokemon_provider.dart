// A static data provider for Pokemon information to use during development
// if the actual API integration is not working.

final _pokemonData = {
  'id': 25,
  'name': 'pikachu',
  'height': 4, // decimeters (0.4m)
  'weight': 60, // hectograms (6.0kg)
  'base_experience': 112,
  'types': [
    {
      'slot': 1,
      'type': {'name': 'electric', 'url': 'https://pokeapi.co/api/v2/type/13/'},
    },
  ],
  'sprites': {
    'front_default':
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png',
    'back_default':
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/25.png',
  },
};

// Returns static Pokemon data for the given name in PokeAPI format
// Will always return pikachu
Map<String, dynamic> getStaticPokemonByName({String name = 'pikachu'}) {
  _pokemonData['name'] = name;

  return _pokemonData;
}
