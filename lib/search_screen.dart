import 'package:flutter/material.dart';
import 'book_screen.dart'; // Pastikan untuk mengimpor halaman detail buku

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // Daftar buku yang tersedia
  final List<Map<String, String>> books = [
    // Young Adult Romance
    {
      'title': 'The Fault \n in Our Stars',
      'image': 'lib/images/bookcovers/thefaultinourstars.jpg',
      'description': 'blablabla',
      'genres': 'Romance',
    },
    {
      'title': 'Eleanor & Park',
      'image': 'lib/images/bookcovers/eleanorandpark.jpeg',
      'description': 'blablabla',
      'genres': 'Romance',
    },
    {
      'title': 'Five Feet Apart',
      'image': 'lib/images/bookcovers/five-feet-apart-cover.jpg',
      'description': 'blablabla',
      'genres': 'Romance',
    },
    {
      'title': 'Anna and \n the French Kiss',
      'image': 'lib/images/bookcovers/annaandthefrenchkiss.jpeg',
      'description': 'blablabla',
      'genres': 'Romance',
    },
    {
      'title': 'To All the Boys \n I’ve Loved Before',
      'image': 'lib/images/bookcovers/toalltheboys.jpg',
      'description': 'blablabla',
      'genres': 'Romance',
    },

    // Fantasy Adventure
    {
      'title': 'Percy Jackson \n & The Olympians: \n The Lightning Thief',
      'image': 'lib/images/bookcovers/percyjackson.jpeg',
      'description': 'blablabla',
      'genres': 'Fantasy, Adventure',
    },
    {
      'title': 'Harry Potter and \n the Sorcerers Stone',
      'image': 'lib/images/bookcovers/harrypotter.jpg',
      'description': 'blablabla',
      'genres': 'Fantasy, Adventure',
    },
    {
      'title': 'Six of Crows',
      'image': 'lib/images/bookcovers/sixofcrows.jpg',
      'description': 'blablabla',
      'genres': 'Fantasy, Crime',
    },
    {
      'title': 'The Maze Runner',
      'image': 'assets/the_haunted_cover.jpg',
      'description': 'blablabla',
      'genres': 'Sci-fi, Adventure',
    },
    {
      'title': 'The Hunger Games',
      'image': 'lib/images/bookcovers/thehungergames.jpg',
      'description': 'blablabla',
      'genres': 'Dystopian, Adventure',
    },

    // Coming of Age
    {
      'title': 'The Perks \n of Being a Wallflower',
      'image': 'lib/images/bookcovers/theperksofbeingawallflower.jpg',
      'description': 'blablabla',
      'genres': 'Sci-fi',
    },
    {
      'title': 'Looking for Alaska',
      'image': 'lib/images/bookcovers/lookingforalaska.webp',
      'description': 'blablabla',
      'genres': 'Sci-fi',
    },
    {
      'title': 'Simon vs. \n the Homo Sapiens Agenda',
      'image': 'lib/images/bookcovers/simonvs.jpg',
      'description': 'blablabla',
      'genres': 'Sci-fi',
    },
    {
      'title': 'Wonder',
      'image': 'lib/images/bookcovers/wonder.webp',
      'description': 'blablabla',
      'genres': 'Sci-fi',
    },
    {
      'title': 'All the Bright Places',
      'image': 'lib/images/bookcovers/allthebrightplaces.jpeg',
      'description': 'blablabla',
      'genres': 'Sci-fi',
    },

    // Mystery & Thriller
    {
      'title': 'One of Us Is Lying',
      'image': 'lib/images/bookcovers/oneofusislying.jpg',
      'description': 'blablabla',
      'genres': 'Sci-fi',
    },
    {
      'title': 'A Good Girls \n Guide to Murder',
      'image': 'lib/images/bookcovers/agoodgirlsguide.jpeg',
      'description': 'blablabla',
      'genres': 'Sci-fi',
    },
    {
      'title': 'We Were Liars',
      'image': 'lib/images/bookcovers/wewereliars.jpg',
      'description': 'blablabla',
      'genres': 'Sci-fi',
    },
    {
      'title': 'Truly Devious',
      'image': 'lib/images/bookcovers/trulydevious.webp',
      'description': 'blablabla',
      'genres': 'Sci-fi',
    },
    {
      'title': 'The Inheritance \n Games',
      'image': 'lib/images/bookcovers/theinheritancegames.jpg',
      'description': 'blablabla',
      'genres': 'Sci-fi',
    },

    // Science Fiction & Dystopian
    {
      'title': 'Divergent',
      'image': 'lib/images/bookcovers/divergent.jpeg',
      'description': 'blablabla',
      'genres': 'Sci-fi',
    },
    {
      'title': 'The Giver',
      'image': 'lib/images/bookcovers/thegiver.png',
      'description': 'blablabla',
      'genres': 'Sci-fi',
    },
    {
      'title': 'Legend',
      'image': 'lib/images/bookcovers/legend.jpeg',
      'description': 'blablabla',
      'genres': 'Sci-fi',
    },
    {
      'title': 'Red Queen',
      'image': 'lib/images/bookcovers/redqueen.jpg',
      'description': 'blablabla',
      'genres': 'Sci-fi',
    },
    {
      'title': 'Scythe',
      'image': 'lib/images/bookcovers/scythe.jpg',
      'description': 'blablabla',
      'genres': 'Sci-fi',
    },

    // Friendship & Life Lessons
    {
      'title': 'I’ll Give You \n the Sun',
      'image': 'lib/images/bookcovers/illgiveyouthesun.jpg',
      'description': 'blablabla',
      'genres': 'Sci-fi',
    },
    {
      'title': 'Paper Towns',
      'image': 'lib/images/bookcovers/papertowns.jpg',
      'description': 'blablabla',
      'genres': 'Sci-fi',
    },
    {
      'title': 'The Sisterhood of \n the Traveling Pants',
      'image': 'lib/images/bookcovers/thesisterhood.jpg',
      'description': 'blablabla',
      'genres': 'Sci-fi',
    },
    {
      'title': 'If I Stay',
      'image': 'lib/images/bookcovers/ifistay.png',
      'description': 'blablabla',
      'genres': 'Sci-fi',
    },
    {
      'title': 'The Outsiders',
      'image': 'lib/images/bookcovers/theoutsiders.jpg',
      'description': 'blablabla',
      'genres': 'Sci-fi',
    },
  ];

  List<Map<String, String>> filteredBooks = []; // Daftar buku yang sudah difilter
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Awalnya, tampilkan 3 buku favorit
    filteredBooks = books.take(3).toList();
    _searchController.addListener(_filterBooks);
  }

  // Fungsi untuk memfilter buku berdasarkan input pencarian
  void _filterBooks() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        // Jika tidak ada input pencarian, tampilkan 3 buku favorit
        filteredBooks = books.take(3).toList();
      } else {
        // Jika ada pencarian, filter buku berdasarkan judul dan batasi menjadi 5 hasil
        filteredBooks = books
            .where((book) => book['title']!.toLowerCase().contains(query)) // Filter berdasarkan nama buku
            .take(5) // Batasi hasil pencarian hanya 5 buku
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF99B5BD),
        title: const Text('Search Books'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search TextField
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for a book...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Menampilkan judul "Top 3 Favorite Books" jika tidak ada pencarian
            if (_searchController.text.isEmpty)
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Top 3 Favorite Books',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            // Menampilkan hasil pencarian lainnya (selain rekomendasi)
            const SizedBox(height: 16),
            Expanded(
              child: filteredBooks.isEmpty && _searchController.text.isNotEmpty
                  ? const Center(child: Text('No results found'))
                  : ListView.builder(
                      itemCount: filteredBooks.length,
                      itemBuilder: (context, index) {
                        final book = filteredBooks[index];
                        return ListTile(
                          leading: Image.asset(
                            book['image']!,
                            width: 50,
                            height: 75,
                            fit: BoxFit.cover,
                          ),
                          title: Text(book['title']!),
                          onTap: () {
                            // Arahkan ke halaman detail buku saat diklik
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookScreen(
                                  title: book['title']!,
                                  imagePath: book['image']!,
                                  description: book['description']!,
                                  genres: [book['genres']!],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
