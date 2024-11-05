import 'package:flutter/material.dart';
import 'genre_tag.dart';

class BookScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Color(0xFFF6B047),
        elevation: 0,
        title: Text('Hi user!',
        style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white,),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.pink[100],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 100,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Yellow Hearts',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GenreTag(genre: 'Romance'),
                  GenreTag(genre: 'High-School'),
                  GenreTag(genre: 'Comedy'),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'In a bright Monday morning.....',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.white, fontFamily: 'Cursive'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}