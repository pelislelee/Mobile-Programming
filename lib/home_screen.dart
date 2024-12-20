import 'dart:async';
import 'package:flutter/material.dart';
import 'package:uas_mobprog/login.dart';
import 'book_screen.dart';
import 'search_screen.dart';
 
 
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Color(0xFFFef3f1)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
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
 
 
            // Section Title and Book Grid
            const SectionTitle(title: 'Young Adult Romance'),
            const BookGrid(
              books: [
                {
                  'title': 'The Fault \n in Our Stars',
                  'image': 'lib/images/bookcovers/thefaultinourstars.jpg',
                  'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  'genres': ['Romance',]
                },
                {
                  'title': 'Eleanor & Park',
                  'image': 'lib/images/bookcovers/eleanorandpark.jpeg',
                  'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  'genres': ['Romance']
                },
                {
                  'title': 'Five Feet Apart',
                  'image': 'lib/images/bookcovers/five-feet-apart-cover.jpg',
                  'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  'genres': ['Romance']
                },
                {
                  'title': 'Anna and \n the French Kiss',
                  'image': 'lib/images/bookcovers/annaandthefrenchkiss.jpeg',
                  'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  'genres': ['Romance']
                },
                {
                  'title': 'To All the Boys \n I’ve Loved Before',
                  'image': 'lib/images/bookcovers/toalltheboys.jpg',
                  'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  'genres': ['Romance']
                },
              ],
            ),
            const SectionTitle(title: 'Fantasy Adventure'),
            const BookGrid(
              books: [
                {
                  'title': 'Percy Jackson \n & The Olympians: \n The Lightning Thief',
                  'image': 'lib/images/bookcovers/percyjackson.jpeg',
                  'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  'genres': ['Fantasy', 'Adventure']
                },
                {
                  'title': 'Harry Potter and \n the Sorcerers Stone',
                  'image': 'lib/images/bookcovers/harrypotter.jpg',
                  'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  'genres': ['Fantasy', 'Adventure']
                },
                {
                  'title': 'Six of Crows',
                  'image': 'lib/images/bookcovers/sixofcrows.jpg',
                  'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  'genres': ['Fantasy', 'Crime']
                },
                {
                  'title': 'The Maze Runner',
                  'image': 'assets/the_haunted_cover.jpg',
                  'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  'genres': ['Sci-fi', 'Adventure']
                },
                {
                  'title': 'The Hunger Games',
                  'image': 'lib/images/bookcovers/thehungergames.jpg',
                  'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  'genres': ['Dystopian', 'Adventure']
                },
              ],
            ),
 
            const SectionTitle(title: 'Coming of Age'),
            const BookGrid(
              books: [
                {
                  'title': 'The Perks \n of Being a Wallflower',
                  'image': 'lib/images/bookcovers/theperksofbeingawallflower.jpg',
                  'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  'genres': ['Romance', 'Comedy']
                },
                {
                  'title': 'Looking for Alaska',
                  'image': 'lib/images/bookcovers/lookingforalaska.webp',
                  'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  'genres': ['Young Adult', 'Fiction', 'Romance']
                },
                {
                  'title': 'Simon vs. \n the Homo Sapiens Agenda',
                  'image': 'lib/images/bookcovers/simonvs.jpg',
                  'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  'genres': ['Young Adult', 'Romance', 'Drama']
                },
                {
                  'title': 'Wonder',
                  'image': 'lib/images/bookcovers/wonder.webp',
                  'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  'genres': ['Childrens literature']
                },
                {
                  'title': 'All the Bright Places',
                  'image': 'lib/images/bookcovers/allthebrightplaces.jpeg',
                  'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  'genres': ['Romance', 'Drama', 'Teen', 'Melodrama']
                },
              ],
            ),
 
            const SectionTitle(title: 'Mystery & Thriller'),
            const BookGrid(
              books: [
                {
                  'title': 'One of Us Is Lying',
                  'image': 'lib/images/bookcovers/oneofusislying.jpg',
                  'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  'genres': ['Mystery', 'Young adult literature']
                },
                {
                  'title': 'A Good Girls \n Guide to Murder',
                  'image': 'lib/images/bookcovers/agoodgirlsguide.jpeg',
                  'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  'genres': ['Mystery', 'Thriller', 'Horror', 'Drama']
                },
                {
                  'title': 'We Were Liars',
                  'image': 'lib/images/bookcovers/wewereliars.jpg',
                  'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  'genres': ['Thriller', 'Young adult literature']
                },
                {
                  'title': 'Truly Devious',
                  'image': 'lib/images/bookcovers/trulydevious.webp',
                  'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  'genres': ['Mystery', 'Fiction']
                },
                {
                  'title': 'The Inheritance \n Games',
                  'image': 'lib/images/bookcovers/theinheritancegames.jpg',
                  'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  'genres': ['Mystery', 'Fiction']
                },
              ],
            ),
 
            const SectionTitle(title: 'Science Fiction & Dystopian'),
            const BookGrid(
              books: [
                {
                  'title': ' Divergent ',
                  'image': 'lib/images/bookcovers/divergent.jpeg',
                  'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  'genres': ['Sci-fi']
                },
                {
                  'title': ' The Giver ',
                  'image': 'lib/images/bookcovers/thegiver.png',
                  'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  'genres': ['Sci-fi', 'Action', 'Drama', 'Adventure']
                },
                {
                  'title': ' Legend ',
                  'image': 'lib/images/bookcovers/legend.jpeg',
                  'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  'genres': ['Sci-fi', 'Dystopian', 'Young adult literature']
                },
                {
                  'title': ' Red Queen ',
                  'image': 'lib/images/bookcovers/redqueen.jpg',
                  'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.a',
                  'genres': ['Sci-fi', 'Fantasy']
                },
                {
                  'title': ' Scythe ',
                  'image': 'lib/images/bookcovers/scythe.jpg',
                  'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  'genres': ['Scifi', 'Adventure', 'Dystopian']
                },
              ],
            ),
 
            const SectionTitle(title: 'Friendship & Life Lessons'),
            const BookGrid(
              books: [
                {
                  'title': 'I’ll Give You \n the Sun',
                  'image': 'lib/images/bookcovers/illgiveyouthesun.jpg',
                  'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  'genres': ['Young adult', 'Romance']
                },
                {
                  'title': 'Paper Towns',
                  'image': 'lib/images/bookcovers/papertowns.jpg',
                  'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  'genres': ['Romance', 'Comedy', 'Melodrama', 'Adventure']
                },
                {
                  'title': 'The Sisterhood of \n the Traveling Pants',
                  'image': 'lib/images/bookcovers/thesisterhood.jpg',
                  'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  'genres': ['Comedy', 'Romance', 'Melodrama']
                },
                {
                  'title': 'If I Stay',
                  'image': 'lib/images/bookcovers/ifistay.png',
                  'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  'genres': ['Drama', 'Fantasy', 'Music', 'Romance']
                },
                {
                  'title': 'The Outsiders',
                  'image': 'lib/images/bookcovers/theoutsiders.jpg',
                  'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  'genres': ['Young adult literature', 'Drama']
                },
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
  final List<Map<String, dynamic>> books;
 
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
            final book = books[index];
            return GestureDetector(
              onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => BookScreen(
                      title: book['title']!,
                      imagePath: book['image']!,
                      description: book['description']!,
                      genres: List<String>.from(book['genres']),
                    ),
                  );
              },      
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(book['image']!),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    book['title']!,
                    style: const TextStyle(fontSize: 14, color: Colors.orange),
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