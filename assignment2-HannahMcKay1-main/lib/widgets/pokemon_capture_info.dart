import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PokemonCaptureInfo extends StatefulWidget {
  final int baseExperience;
  final DateTime captureDate;

  const PokemonCaptureInfo({
    super.key,
    required this.baseExperience,
    required this.captureDate,
  });

  @override
  State<PokemonCaptureInfo> createState() => _PokemonCaptureInfoState();
}

class _PokemonCaptureInfoState extends State<PokemonCaptureInfo> {
  bool _isExpanded = false;

  void _toggleXP() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('MMM d, yyyy').format(widget.captureDate);

    return Column(
      children: [
        GestureDetector(
          onTap: _toggleXP,
          child: Text(
            'Capture Date: $formattedDate',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        if (_isExpanded)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: GestureDetector(
              onTap: _toggleXP,
              child: Text(
                'Base XP: ${widget.baseExperience}',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
          ),
      ],
    );
  }
}