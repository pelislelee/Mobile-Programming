import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            // Image Container
            Container(
              margin: const EdgeInsets.all(16),
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage('assets/book_image.jpg'), // Ganti dengan gambar Anda
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Filter Chips Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Wrap(
                spacing: 0.1, // Jarak antar chip
                runSpacing: 4.0, // Jarak antar baris
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
            const SectionTitle(title: 'Continue Reading'),
            const BookGrid(
              books: [
                {'title': 'Harry Potter', 'image': 'assets/hp_cover.jpg'},
                {'title': 'Jurassic Park', 'image': 'assets/jp_cover.jpg'},
                {'title': 'The Seven Husbands of Evelyn Hugo', 'image': 'assets/evelyn_hugo_cover.jpg'},
              ],
            ),
            const SectionTitle(title: 'Popular'),
            const BookGrid(
              books: [
                {'title': 'Nights in Sicily', 'image': 'assets/nights_in_sicily_cover.jpg'},
                {'title': 'The King of Kings', 'image': 'assets/king_of_kings_cover.jpg'},
                {'title': 'The Haunted', 'image': 'assets/the_haunted_cover.jpg'},
              ],
            ),
          ],
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
        style: const TextStyle(color: Colors.black), // Teks berwarna hitam
      ),
      selected: false,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Membuat border lonjong/bulat
        side: BorderSide(color: Colors.grey.shade300), // Menambahkan warna border abu-abu
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
  final List<Map<String, String>> books; // Updated to accept both title and image URL/Asset

  const BookGrid({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: books.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 2 / 3,
        ),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 100,
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
          );
        },
      ),
    );
  }
}
