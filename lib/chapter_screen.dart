import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'theme_provider.dart'; // Import ThemeProvider
import 'text_size_provider.dart'; // Import TextSizeProvider

class ChapterScreen extends StatelessWidget {
  final int chapterIndex; // Index untuk chapter

  const ChapterScreen({super.key, required this.chapterIndex});

  @override
  Widget build(BuildContext context) {
    final chapters = [
      {'title': 'Chapter 1: Introduction', 'content': loremIpsum(paragraphs: 3, words: 150)},
      {'title': 'Chapter 2: Advanced Concepts', 'content': loremIpsum(paragraphs: 4, words: 200)},
      {'title': 'Chapter 3: Final Thoughts', 'content': loremIpsum(paragraphs: 3, words: 150)},
    ];

    return Consumer2<ThemeProvider, TextSizeProvider>(
      builder: (context, themeProvider, textSizeProvider, child) {
        return Scaffold(
          backgroundColor: themeProvider.isDarkMode
              ? const Color(0xFF121212) // Dark mode background
              : const Color(0xFFFef3f1), // Light mode background
          appBar: AppBar(
            backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.orange),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                icon: Icon(
                  themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                  color: themeProvider.isDarkMode ? Colors.yellow : Colors.orange,
                ),
                onPressed: () {
                  themeProvider.toogleTheme(); // Toggle dark/light mode
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        themeProvider.isDarkMode
                            ? 'Switched to Dark Mode'
                            : 'Switched to Light Mode',
                      ),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.format_size, color: Colors.red),
                onPressed: () {
                  // Logic to adjust text size
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Adjust Text Size'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.zoom_out),
                                onPressed: textSizeProvider.decreaseTextSize,
                              ),
                              IconButton(
                                icon: const Icon(Icons.zoom_in),
                                onPressed: textSizeProvider.increaseTextSize,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Current Size: ${textSizeProvider.textSize.toStringAsFixed(1)}',
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    chapters[chapterIndex]['title'] as String,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      chapters[chapterIndex]['content'] as String,
                      style: TextStyle(
                        fontSize: textSizeProvider.textSize,
                        height: 1.8,
                        color: themeProvider.isDarkMode
                            ? Colors.white
                            : Colors.black87,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (chapterIndex > 0)
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChapterScreen(
                                chapterIndex: chapterIndex - 1,
                              ),
                            ),
                          );
                        },
                        child: const Text('Previous Chapter'),
                      ),
                    if (chapterIndex < chapters.length - 1)
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChapterScreen(
                                chapterIndex: chapterIndex + 1,
                              ),
                            ),
                          );
                        },
                        child: const Text('Next Chapter'),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
