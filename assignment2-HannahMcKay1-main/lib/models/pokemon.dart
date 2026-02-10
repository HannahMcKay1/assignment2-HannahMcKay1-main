//Create a pokemon class
class Pokemon {
  //Create a master list that contains all of the pokemon types.
  static const List<String> _validPokemonTypes = [
    "normal",
    "fire",
    "water",
    "electric",
    "grass",
    "ice",
    "fighting",
    "poison",
    "ground",
    "flying",
    "psychic",
    "bug",
    "rock",
    "ghost",
    "dragon",
    "dark",
    "steel",
    "fairy",
  ];
  // Private fields to encapsulate data.
  late String _name;
  late int _id;
  late double _height;
  late double _weight;
  late int _baseExperience;
  late List<String> _types;
  late DateTime _captureDate;
  // Factory constructor to handle the mapping of JSON data
  factory Pokemon.fromPokeApiData(Map<String, dynamic> data) {
    // Navigates the nested API structure
    List<String> typeList =
        (data['types'] as List)
            .map((typeEntry) => typeEntry['type']['name'] as String)
            .toList();

    return Pokemon(
      name: data['name'],
      id: data['id'],
      // Convert decimeters into meters
      height: data['height'] / 10.0,
      // Convert hectograms into kilograms
      weight: data['weight'] / 10.0,
      baseExperience: data['base_experience'],
      types: typeList,
      captureDate: DateTime.now(),
    );
  }

  // Standard constructor
  Pokemon({
    required String name,
    required int id,
    required double height,
    required double weight,
    required int baseExperience,
    required List<String> types,
    required DateTime captureDate,
  }) {
    this.name = name;
    this.id = id;
    this.height = height;
    this.weight = weight;
    this.baseExperience = baseExperience;
    this.types = types;
    this.captureDate = captureDate;
  }
  // Getters
  String get name => _name;
  int get id => _id;
  double get height => _height;
  double get weight => _weight;
  int get baseExperience => _baseExperience;
  List<String> get types => _types;
  DateTime get captureDate => _captureDate;

  // Setters
  set name(String value) {
    //Checks that the name isn't left blank
    if (value.isEmpty) throw Exception('Pokemon name cannot be empty');
    _name = value;
  }

  set id(int value) {
    //Ensures the ID is a valid positive number
    if (value <= 0) throw Exception('Pokemon ID must be positive');
    _id = value;
  }

  set height(double value) {
    // Keeps height within a realistic range of 0.1 to 20 meters
    if (value < 0.1 || value > 20.0) {
      throw Exception('Pokemon height must be between 0.1 and 20.0 meters');
    }
    _height = value;
  }

  set weight(double value) {
    //Keeps weight within a realistic range of 0.1 to 1000 kilograms
    if (value < 0.1 || value > 1000.0) {
      throw Exception(
        'Pokemon weight must be between 0.1 and 1000.0 kilograms',
      );
    }
    _weight = value;
  }

  set types(List<String> value) {
    // Confirms the Pokemon has 1-2 types and that they are real Pokemon types
    if (value.isEmpty || value.length > 2) {
      throw Exception('Pokemon must have between 1 and 2 types');
    }
    for (var type in value) {
      if (!_validPokemonTypes.contains(type.toLowerCase())) {
        throw Exception('Invalid Pokemon type: $type');
      }
    }
    _types = value;
  }

  set baseExperience(int value) {
    // Limits base experience to a standard range of 1 to 1000
    if (value < 1 || value > 1000) {
      throw Exception('Base experience must be between 1 and 1000');
    }
    _baseExperience = value;
  }

  set captureDate(DateTime value) {
    // Rejects any capture date that is set in the future
    if (value.isAfter(DateTime.now())) {
      throw Exception('Capture date cannot be in the future');
    }
    _captureDate = value;
  }

  // Combines all Pokemon info into a single string
  @override
  String toString() {
    String typeString = types.join(', ');
    return "Pokemon: $name (#$id), Type(s): [$typeString], Height: ${height}m, Weight: ${weight}kg, Base Experience: $baseExperience, Captured: $captureDate";
  }
}
