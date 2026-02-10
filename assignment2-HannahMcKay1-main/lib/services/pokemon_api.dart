//Importing http so we can call the web tools and importing dart:convert to help me turn long strings of text into data.
import 'package:http/http.dart' as http;
import 'dart:convert';

//address for pokemon API
const String pokemonEndpoint = 'https://pokeapi.co/api/v2/pokemon';

// function to find a specific Pokemons data
Future<dynamic> getPokemonByName({required String pokemonName}) async {
  try {
    //I combined the address with the pokemon name to get the full website link
    final url = Uri.parse('$pokemonEndpoint/$pokemonName');
    //awaiting a response
    final response = await http.get(url);
    //checking the status. 200 is good
    if (response.statusCode != 200) {
      //if the website is down or the name is spelled incorrectly, there needs to be an explanation.
      throw Exception(
        'There was a problem with the request: status ${response.statusCode} received',
      );
    }

    //taking text from the website and turning it into a map.
    return jsonDecode(response.body);
  } catch (e) {
    // Exception
    if (e.toString().contains('status')) {
      throw Exception('The server returned a status error: ${e.toString()}');
    }

    // For any other unexpected errors.
    throw Exception(
      'There was a problem with the request: ${e.toString().replaceFirst('Exception: ', '')}',
    );
  }
}
