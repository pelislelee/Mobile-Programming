import 'package:flutter/material.dart';
import 'genre_tag.dart';
import 'chapter_screen.dart';

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
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: BoxDecoration(
                color: Colors.pink[100],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Center(
                      child: Container(
                        width: 120,
                        height: 180,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(imagePath),
                            fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                        ),),),
                        const SizedBox(height: 16),

                    Center(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16),

                    Center(
                      child: Wrap(
                        spacing: 8,
                        children: genres
                        .map(
                          (genre) => GenreTag(
                          genre: genre,
                          backgroundColor: Colors.orange,
                          ),
                      )
                      .toList(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  Expanded(child: SingleChildScrollView(
                    child: Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
