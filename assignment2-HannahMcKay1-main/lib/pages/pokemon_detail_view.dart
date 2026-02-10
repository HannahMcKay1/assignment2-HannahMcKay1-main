import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import '../widgets/pokemon_stats.dart';
import '../widgets/pokemon_capture_info.dart';

class PokemonDetailView extends StatefulWidget {
  final Future<Pokemon> Function({String name}) pokemonProvider;

  const PokemonDetailView({super.key, required this.pokemonProvider});

  @override
  State<PokemonDetailView> createState() => _PokemonDetailViewState();
}

class _PokemonDetailViewState extends State<PokemonDetailView> {
  final List<String> _names = ['pikachu', 'bulbasaur', 'charmander'];
  int _currentIndex = 0;

  Pokemon? _pokemon;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPokemon();
  }

  Future<void> _loadPokemon() async {
    setState(() => _isLoading = true);
    final result = await widget.pokemonProvider(name: _names[_currentIndex]);

    setState(() {
      _pokemon = result;
      _isLoading = false;
    });
  }

  void _nextPokemon() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _names.length;
      _loadPokemon();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon Detail'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _pokemon == null
              ? const Center(child: Text("No Data"))
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 100,
                      ),

                      Text(
                        _pokemon!.name,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text('Types: ${_pokemon!.types.join(", ")}'),

                      const SizedBox(height: 16),
                      PokemonStats(
                        id: _pokemon!.id,
                        height: _pokemon!.height,
                        weight: _pokemon!.weight,
                      ),
                      PokemonCaptureInfo(
                        baseExperience: _pokemon!.baseExperience,
                        captureDate: _pokemon!.captureDate,
                      ),

                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _nextPokemon,
                        child: const Text('Next Pokemon'),
                      ),
                    ],
                  ),
                ),
    );
  }
}