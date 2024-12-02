import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:flutter/gestures.dart'; // Pastikan Anda mengimpor ini
import 'package:shared_preferences/shared_preferences.dart'; // Impor SharedPreferences
import 'theme_provider.dart'; // Import ThemeProvider
import 'text_size_provider.dart'; // Import TextSizeProvider

class ChapterScreen extends StatefulWidget {
  final int chapterIndex; // Index untuk chapter

  const ChapterScreen({super.key, required this.chapterIndex});

  @override
  _ChapterScreenState createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  List<int> highlightedWords = [];
  bool isHighlightEnabled = true; // Variabel untuk mengaktifkan/mematikan highlight

  @override
  void initState() {
    super.initState();
    _loadHighlights();
  }

  // Muat highlight yang sudah disimpan dari SharedPreferences
  Future<void> _loadHighlights() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedHighlights = prefs.getStringList('highlightedWords_${widget.chapterIndex}');
    if (savedHighlights != null) {
      setState(() {
        highlightedWords = savedHighlights.map((e) => int.parse(e)).toList();
      });
    }
  }

  // Simpan highlight ke SharedPreferences
  Future<void> _saveHighlights() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedWords = highlightedWords.map((e) => e.toString()).toList();
    prefs.setStringList('highlightedWords_${widget.chapterIndex}', savedWords);
  }

  void _highlightText(int index) {
    if (!isHighlightEnabled) return; // Tidak melakukan apapun jika highlight dimatikan
    
    setState(() {
      if (highlightedWords.contains(index)) {
        highlightedWords.remove(index); // Hapus highlight jika sudah ada
      } else {
        highlightedWords.add(index); // Tambahkan highlight
      }
    });

    // Simpan highlight setelah perubahan
    _saveHighlights();
  }

  @override
  Widget build(BuildContext context) {
    final chapters = [
      {'title': 'Chapter 1: Introduction', 'content': loremIpsum(paragraphs: 3, words: 150)},
      {'title': 'Chapter 2: Advanced Concepts', 'content': loremIpsum(paragraphs: 4, words: 200)},
      {'title': 'Chapter 3: Final Thoughts', 'content': loremIpsum(paragraphs: 3, words: 150)},
    ];

    return Consumer2<ThemeProvider, TextSizeProvider>(
      builder: (context, themeProvider, textSizeProvider, child) {
        final content = chapters[widget.chapterIndex]['content'] as String;
        final words = content.split(' ');

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
              // Button untuk mengaktifkan/mematikan highlight
              IconButton(
                icon: Icon(
                  isHighlightEnabled ? Icons.highlight_off : Icons.highlight,
                  color: Colors.orange,
                ),
                onPressed: () {
                  setState(() {
                    isHighlightEnabled = !isHighlightEnabled; // Toggle highlight state
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        isHighlightEnabled
                            ? 'Highlighting Enabled'
                            : 'Highlighting Disabled',
                      ),
                      duration: const Duration(seconds: 1),
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
                    chapters[widget.chapterIndex]['title'] as String,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: SingleChildScrollView(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: textSizeProvider.textSize,
                          height: 1.8,
                          color: themeProvider.isDarkMode
                              ? Colors.white
                              : Colors.black87,
                        ),
                        children: words.map((word) {
                          int index = words.indexOf(word);
                          return TextSpan(
                            text: '$word ',
                            style: TextStyle(
                              backgroundColor: highlightedWords.contains(index)
                                  ? Colors.yellow
                                  : Colors.transparent,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                _highlightText(index);
                              },
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (widget.chapterIndex > 0)
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChapterScreen(
                                chapterIndex: widget.chapterIndex - 1,
                              ),
                            ),
                          );
                        },
                        child: const Text('Previous Chapter'),
                      ),
                    if (widget.chapterIndex < chapters.length - 1)
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChapterScreen(
                                chapterIndex: widget.chapterIndex + 1,
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
