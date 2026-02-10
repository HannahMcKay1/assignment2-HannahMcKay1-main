import 'package:flutter/material.dart';

class PokemonStats extends StatelessWidget {
  final int id;
  final double height;
  final double weight;

  const PokemonStats({
    super.key,
    required this.id,
    required this.height,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Column(
      children: [
        Text(
          '#$id', 
          style: textStyle.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          '${height.toStringAsFixed(1)} m',
          style: textStyle.bodyLarge,
        ),
        Text(
          '${weight.toStringAsFixed(1)} kg',
          style: textStyle.bodyLarge,
        ),
      ],
    );
  }
}