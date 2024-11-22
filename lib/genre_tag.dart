import 'package:flutter/material.dart';

class GenreTag extends StatelessWidget {
  final String genre;
  final Color backgroundColor;

  const GenreTag({
    super.key, 
    required this.genre,
    this.backgroundColor = const Color(0xFFF6B047),
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF6B047),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        genre,
        style: const TextStyle(
          color: Colors.white, 
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}