import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  final List<String> _images = [
    'lib/images/slides/slide1.jpeg',
    'lib/images/slides/slide2.jpeg',
    'lib/images/slides/slide3.jpeg',
    'lib/images/slides/slide4.jpeg',
    'lib/images/slides/slide5.jpeg',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF99B5BD),
        elevation: 0,
        title: const Text(
          'Hi user!\nWhat are we feeling like today?',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontFamily: 'Knewave',
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Color(0xFFFef3f1)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Slideshow Section
            Container(
              height: 180,
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: PageView.builder(
                controller: _pageController,
                itemCount: _images.length,
                itemBuilder: (context, index) {
                  return SlideshowImage(imagePath: _images[index]);
                },
              ),
            ),

            // Filter Chips Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Wrap(
                spacing: 0.1,
                runSpacing: 4.0,
                children: const [
                  FilterChipWidget(label: 'All', backgroundColor: Color(0xFFB2DFDB)),
                  FilterChipWidget(label: 'Romance', backgroundColor: Color(0xFFF8BBD0)),
                  FilterChipWidget(label: 'Fantasy', backgroundColor: Color(0xFFE1BEE7)),
                  FilterChipWidget(label: 'Horror', backgroundColor: Color(0xFFFFCDD2)),
                  FilterChipWidget(label: 'Mystery', backgroundColor: Color(0xFFBBDEFB)),
                  FilterChipWidget(label: 'Comedy', backgroundColor: Color(0xFFFFF9C4)),
                ],
              ),
            ),

            // Section Title and Book Grid
            const SectionTitle(title: 'Young Adult Romance'),
            const BookGrid(
              books: [
                {'title': 'The Fault \n in Our Stars', 'image': 'lib/images/bookcovers/thefaultinourstars.jpg'},
                {'title': 'Eleanor & Park', 'image': 'lib/images/bookcovers/eleanorandpark.jpeg'},
                {'title': 'Five Feet Apart', 'image': 'lib/images/bookcovers/five-feet-apart-cover.jpg'},
                {'title': 'Anna and \n the French Kiss', 'image': 'lib/images/bookcovers/annaandthefrenchkiss.jpeg'},
                {'title': 'To All the Boys \n I’ve Loved Before', 'image': 'lib/images/bookcovers/toalltheboys.jpg'},
              ],
            ),
            const SectionTitle(title: 'Fantasy Adventure'),
            const BookGrid(
              books: [
                {'title': 'Percy Jackson \n & The Olympians: \n The Lightning Thief', 'image': 'lib/images/bookcovers/percyjackson.jpeg'},
                {'title': 'Harry Potter and \n the Sorcerers Stone', 'image': 'lib/images/bookcovers/harrypotter.jpg'},
                {'title': 'Six of Crows', 'image': 'lib/images/bookcovers/sixofcrows.jpg'},
                {'title': 'The Maze Runner', 'image': 'assets/the_haunted_cover.jpg'},
                {'title': 'The Hunger Games', 'image': 'lib/images/bookcovers/thehungergames.jpg'},
              ],
            ),
            const SectionTitle(title: 'Coming of Age'),
            const BookGrid(
              books: [
                {'title': 'The Perks \n of Being a Wallflower', 'image': 'lib/images/bookcovers/theperksofbeingawallflower.jpg'},
                {'title': 'Looking for Alaska', 'image': 'lib/images/bookcovers/lookingforalaska.webp'},
                {'title': 'Simon vs. \n the Homo Sapiens Agenda', 'image': 'lib/images/bookcovers/simonvs.jpg'},
                {'title': 'Wonder', 'image': 'lib/images/bookcovers/wonder.webp'},
                {'title': 'All the Bright Places', 'image': 'lib/images/bookcovers/allthebrightplaces.jpeg'},
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// SlideshowImage Widget
class SlideshowImage extends StatelessWidget {
  final String imagePath;

  const SlideshowImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// FilterChipWidget Class
class FilterChipWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;

  const FilterChipWidget({
    super.key,
    required this.label,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(
        label,
        style: const TextStyle(color: Colors.black),
      ),
      selected: false,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      onSelected: (selected) {},
    );
  }
}

// SectionTitle Class
class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.orange[800],
          ),
        ),
      ),
    );
  }
}

// BookGrid Class
class BookGrid extends StatelessWidget {
  final List<Map<String, String>> books;

  const BookGrid({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        height: 220, // Tinggi container untuk memastikan layout tetap rapi
        child: ListView.builder(
          scrollDirection: Axis.horizontal, // Mengatur agar dapat digeser horizontal
          itemCount: books.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8), // Spasi antar item
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: 100, // Menentukan lebar untuk item agar konsisten
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(books[index]['image']!),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    books[index]['title']!,
                    style: TextStyle(fontSize: 14, color: Colors.orange[800]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
