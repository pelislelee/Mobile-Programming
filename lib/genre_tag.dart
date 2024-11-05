import 'package:flutter/material.dart';

class GenreTag extends StatelessWidget {
  final String genre;

  GenreTag({required this.genre});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Color(0xFFF6B047),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        genre,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
      ),
      ),
    );
  }
}