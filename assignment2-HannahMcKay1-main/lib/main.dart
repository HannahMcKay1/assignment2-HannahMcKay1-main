import 'package:flutter/material.dart';
import 'models/pokemon.dart';
import 'pages/pokemon_detail_view.dart';
import 'services/pokemon_api.dart';

Future<Pokemon> _pokemonProvider({String name = 'pikachu'}) async {
  final dynamic jsonData = await getPokemonByName(pokemonName: name);
  return Pokemon.fromPokeApiData(jsonData);
}

void main() {
  runApp(const MainApp(provider: _pokemonProvider));
}

class MainApp extends StatelessWidget {
  const MainApp({required this.provider, super.key});

  final Future<Pokemon> Function({String name}) provider;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: PokemonDetailView(pokemonProvider: provider),
    );
  }
}
