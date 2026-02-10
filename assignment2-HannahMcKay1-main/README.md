[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/umVrpUB7)
# DMIT2504 Assignment 02 - Flutter Widgets and Gestures (Pokemon Edition)
Weight: 10% of final mark

## Submission Requirements
On or before the deadline, push your final solution to the GitHub repository. You must commit and push to the classroom assignment repository supplied for the assignment; do not create your own repository. It is your responsibility to ensure that your work is in the correct repository. Work not in the repository will not be graded.

## Pokemon App UI
This assignment will build off the previous one and put your PokeAPI library to use. You will design and build a simple UI for displaying Pokemon information for a search query. For inspiration, you can check out various Pokedex app designs online.

This project shell contains a `lib/services/` directory with a `static_pokemon.dart` file. This file exposes a `getStaticPokemonByName(name)` function that can be used to develop the app if you do not have a functioning Pokemon API library. There is also a default `pokemon.dart` file provided in the `models/` directory for you to use if you don't have a functioning Pokemon class. Note, the Pokemon class performs no validation on any fields. Use the automated tests as a guide while building your solution ($ flutter test -r expanded automated_tests_do_not_touch).

## Requirements

### Create a PokemonDetailView Widget
Create this widget in the `lib/pages/` directory (you will also need to create the pages/ directory).
- This widget must be implemented as a **StatefulWidget** (to support the fetching and rendering of Pokemon data).
- This widget will act as the main home page of the app.
- This widget must accept a single named param `pokemonProvider`.
- The `pokemonProvider` param must be an async function that accepts a String `name` named param and returns a `Future<Pokemon>` object when called.
- A default function, `_pokemonProvider({name})`, has been created for you to use in the `main.dart` file (replace the implementation with your own Pokemon library API function and Pokemon class if they are operational).
- This widget must create an instance of Pokemon (i.e. call the `pokemonProvider` param) when first initialized to be used by this and other widgets for display.
- This widget must display the Pokemon name in a Text widget.
- This widget must display the Pokemon types in a Text widget.
- This widget must render a PokemonStats widget (see below).
- This widget must render a PokemonCaptureInfo widget (see below).
- This widget must have a list of at least 3 `String` pokemon names to cycle through. i.e. `['Charmander', 'Bulbasaur', 'Squirtle']`
- This widget must render a button (use one of TextButton, ElevatedButton, or OutlinedButton) that when pressed will fetch the Pokemon data for the next pokemon in the list. You must cycle back to the start after hitting the end of the list.
- This widget must render at least one local asset image.

### Create a PokemonStats Widget
Create this widget in the `lib/widgets/` directory (you will also need to create the widgets/ directory).
- This widget must be implemented as a **StatelessWidget**.
- This widget must accept three named params: `id` (an integer value), `height` (a double value), and `weight` (a double value); all params are required.
- This widget must display the Pokemon ID with a "#" prefix.
- The height must be displayed in "N.N m" format, where 'N.N' is the height in meters with one decimal place.
- The weight must be displayed in "N.N kg" format, where 'N.N' is the weight in kilograms with one decimal place.

### Create a PokemonCaptureInfo Widget
Create this widget in the `lib/widgets/` directory.
- This widget must be implemented as a **StatefulWidget** (to support the toggle of the experience info).
- This widget must accept two named params: `baseExperience` (an integer value) and `captureDate` (a date time value); both params are required.
- This widget must display the capture date for the Pokemon in a Text widget in "MMM d, yyyy" format, where 'MMM' is the short month name (e.g. Aug), 'd' is the day number (e.g. 1, 5, 11, etc.), and 'yyyy' is the full year (e.g. 2025).
- When tapped, this widget must toggle the display of the base experience points in "Base XP: N" format, where 'N' is the base experience value.
- The base experience points and capture date must be rendered in a Text widget.

## Application Theme and Style
The application must make use of custom styles and theming
- You are free to style and theme the application any way you like, but at a minimum the application must demonstrate the following:
  - Customized default widget display (e.g. change the size, shape, borders, etc. of a widget)
  - Customized theme colors
- **Include an additional `STYLE.txt` file in the root of your project in which you must detail how you have implemented the style and theming requirements.**

## Submission Requirements

Follow Dart programming conventions [Effective Dart](https://dart.dev/guides/language/effective-dart). Your code must compile and not throw unexpected runtime exceptions. Code that does not compile will not be graded. Code must be committed and pushed to the GitHub classroom assignment repository before the deadline.

If you require clarification or have any questions about the assignment requirements, be sure to contact your instructor as soon as possible. Use the provided automated tests (`$ flutter test automated_tests_do_not_touch`) and built-in analyzer (`$ dart analyze ./lib`) to check your current work status as you progress on your assignment. The formatting of your code, analysis of your code, and automated tests will all be checked when you push to your assignment repository.

**NOTE: You must demonstrate incremental development of your solution. This means that you must begin work on your solution as soon as possible and commit often to the assignment repository. Each commit must demonstrate functional improvements to the solution. Failure to show incremental work during the assignment period will result in loss of marks of up to 20%.**
 
**Additionally, you are encouraged to use external resources to help you learn what is needed for the assignment. However, if you submit code that differs greatly from what was demonstrated in class it must be documented (e.g. comments, citations, etc.) and you may be asked to provide a verbal explanation of how the code works to your instructor. Failure to explain any code you submitted will be considered as potential evidence of academic misconduct and may trigger an investigation, potentially resulting in further consequences.**

# Marking Rubrics [Assignment total 10]

## PokemonDetailView Widget Implementation [4%]

| Mark | Description |
| ---- | ----------- |
| 4 | **Outstanding** – Correctly renders all required elements (Pokemon name, types, child widgets); implements list of at least 3 Pokemon names with proper cycling functionality; includes button to fetch next Pokemon; displays at least one local asset image; demonstrates proper state management and error handling; follows Flutter best practices with well-structured UI. |
| 3.5 | **Excellent** – Includes all required functionality with only minor issues in code organization or state management; Pokemon cycling works correctly; follows most Flutter best practices with good UI implementation. |
| 3 | **Good** – Satisfies core requirements but has room for improvement; may have inconsistencies in state handling or Pokemon cycling implementation; UI works but could be refined. |
| 2.5 | **Satisfactory** – Works for basic usage but has notable gaps in error handling, state management, or Pokemon cycling; may use approaches that differ from class examples without justification. |
| 2 | **Basic** – Has significant shortcomings; missing required elements or has structural issues that affect usability; Pokemon cycling may be incomplete or buggy. |
| 1 | **Needs Improvement** – Contains only minimal functionality; fails to properly use the Pokemon provider or implement core requirements; major implementation flaws. |
| 0 | **Unsatisfactory** – Doesn't compile, is missing entirely, or fails fundamental requirements. |

## PokemonCaptureInfo Widget Implementation [3%]

| Mark | Description |
| ---- | ----------- |
| 3 | **Outstanding** – Correctly displays capture date in "MMM d, yyyy" format; properly implements toggle functionality for base experience; uses appropriate state management; widget is properly encapsulated with required parameters; UI is well-designed and functional. |
| 2.5 | **Excellent** – Includes all required functionality with only minor issues in state handling or formatting; toggle functionality works properly; follows most Flutter best practices. |
| 2 | **Good** – Satisfies core requirements with room for improvement; may have minor inconsistencies in state management or date formatting; toggle behavior works but implementation could be refined. |
| 1.5 | **Satisfactory** – Works for basic usage but has notable gaps in date formatting or toggle behavior; state management could be improved. |
| 1 | **Basic** – Has significant shortcomings in formatting or toggle functionality; improper state management or structural issues that affect usability. |
| 0.5 | **Needs Improvement** – Contains only minimal functionality; fails to properly format date or implement toggle functionality; crashes on basic interaction. |
| 0 | **Unsatisfactory** – Doesn't compile, is missing entirely, or fails fundamental requirements. |

## PokemonStats Widget Implementation [2%]

| Mark | Description |
| ---- | ----------- |
| 2 | **Outstanding** – Correctly displays Pokemon ID with "#" prefix; formats height in "N.N m" format and weight in "N.N kg" format with one decimal place; properly handles all parameters; follows Flutter best practices with good UI design. |
| 1.75 | **Excellent** – Includes all required functionality with only minor formatting issues; properly handles parameters; follows most Flutter best practices. |
| 1.5 | **Good** – Satisfies core requirements with room for improvement; may have minor inconsistencies in formatting or display implementation. |
| 1.25 | **Satisfactory** – Works for basic usage but has notable gaps in number formatting or unit display; implementation could be more elegant. |
| 1 | **Basic** – Has significant shortcomings in formatting or parameter handling; UI has layout or display issues. |
| 0.5 | **Needs Improvement** – Fails to properly format or display required information; major implementation flaws. |
| 0 | **Unsatisfactory** – Doesn't compile, is missing entirely, or fails fundamental requirements. |

## Application Theme and Style Implementation [1%]

| Mark | Description |
| ---- | ----------- |
| 1 | **Outstanding** – Demonstrates comprehensive theming with at least three customized theme elements; customizes multiple widgets with unique styles; includes detailed STYLE.txt file explaining all customizations; theming is consistent throughout the application. |
| 0.75 | **Good** – Satisfies requirements with customized theme elements and at least one customized widget; provides adequate STYLE.txt explanation; shows understanding of Flutter theming principles. |
| 0.5 | **Satisfactory** – Meets minimum requirements of either theme elements OR widget customization; STYLE.txt is present but may lack detail; application has some consistent styling. |
| 0.25 | **Basic** – Has significant shortcomings with minimal customization; inadequate STYLE.txt file; limited understanding of Flutter theming. |
| 0 | **Unsatisfactory** – Missing entirely or fails to meet requirements; no STYLE.txt file provided. |

**Acknowledgment:**  
This assignment was developed with assistance from Claude AI (Claude 3.7 Sonnet, Anthropic, accessed May 7, 2025). The assignment structure, requirements, technical specifications, and starter code were in part refined through collaborative prompting to create an educational exercise that meets the course learning objectives.