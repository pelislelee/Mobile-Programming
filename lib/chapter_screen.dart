import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'theme_provider.dart'; // impor ThemeProvider
import 'text_size_provider.dart'; // impor TextSizeProvider

class ChapterScreen extends StatelessWidget {
  const ChapterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, TextSizeProvider>(
      builder: (context, themeProvider, textSizeProvider, child) {
        return Scaffold(
          backgroundColor: themeProvider.isDarkMode
              ? const Color(0xFF121212) // Dark mode background
              : const Color(0xFFFef3f1), // Light mode background
          appBar: AppBar(
            backgroundColor: themeProvider.isDarkMode
                ? Colors.black
                : Colors.white,
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
                  themeProvider.isDarkMode
                      ? Icons.dark_mode
                      : Icons.light_mode,
                  color: themeProvider.isDarkMode
                      ? Colors.yellow
                      : Colors.orange,
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
                  //logika untuk mengubah ukuran teks
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
                                onPressed: () {
                                  textSizeProvider.decreaseTextSize();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Text size decreased'),
                                      duration: Duration(seconds: 1),
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.zoom_in),
                                onPressed: () {
                                  textSizeProvider.increaseTextSize();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Text size increased'),
                                      duration: Duration(seconds: 1),
                                    ),
                                  );
                                },
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
                const Center(
                  child: Text(
                    'Chapter 1: Introduction',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: themeProvider.isDarkMode
                          ? Colors.grey[850]
                          : Colors.white,
                      border: Border.all(
                          color: themeProvider.isDarkMode
                              ? Colors.purpleAccent
                              : Colors.purple,
                          width: 2),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Text(
                        loremIpsum(paragraphs: 3, words: 150), // Placeholder teks
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
