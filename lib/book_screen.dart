import 'package:flutter/material.dart';
import 'genre_tag.dart';

class BookScreen extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;
  final List<String> genres;

  const BookScreen({
    super.key,
    required this.title,
    required this.imagePath,
    required this.description,
    required this.genres,
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6B047),
        title: Text(title),
        ),
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 16),

                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: genres
                  .map((genre) => GenreTag(
                    genre: genre,
                  backgroundColor: Colors.orange[300]!,
                  ))
                  .toList(),
                ),
                const SizedBox(height: 16),

                Text(
                  'Description:',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                )
              ],
            )),
        ),
      );
  }
}