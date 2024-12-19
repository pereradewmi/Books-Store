import 'package:flutter/material.dart';
import 'book_details.dart'; // Import the book detail page
import 'profile.dart'; // Import your ProfileScreen
import 'mycart.dart'; // Import the MyCartScreen
import 'search.dart'; // Import the search page

class BookstoreScreen extends StatefulWidget {
  const BookstoreScreen({super.key});

  @override
  State<BookstoreScreen> createState() => _BookstoreScreenState();
}

class _BookstoreScreenState extends State<BookstoreScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to MyCartScreen when the "Shop" tab (index 3) is tapped
    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyCartScreen(),
        ),
      );
    }

    // Navigate to ProfileScreen when the "Account" tab (index 4) is tapped
    if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Bookstore',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, size: 28, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const SearchPage(), // Navigate to SearchPage
                ),
              );
            },
          ),
          const SizedBox(width: 15),
        ],

        // actions: const [
        //   Icon(Icons.search, size: 28, color: Colors.white),
        //   SizedBox(width: 15),
        // ],
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TabBar(
              isScrollable: false,
              indicatorColor: Colors.blueAccent,
              labelColor: Colors.blueAccent,
              unselectedLabelColor: Colors.white60,
              labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              tabs: [
                Tab(text: 'Latest'),
                Tab(text: 'Novels'),
                Tab(text: 'Fiction'),
                Tab(text: 'Articles'),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    _sectionTitle('Featured Books'),
                    const SizedBox(height: 20),
                    _buildHorizontalBookList(context),
                    const SizedBox(height: 20),
                    _sectionTitle('Bestsellers in Business'),
                    const SizedBox(height: 10),
                    _buildBestsellersBookList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1E293B),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 22, 96, 224),
        unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Handles the tab click events
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), label: 'My Library'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _buildHorizontalBookList(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailScreen(
                    title: _getBookTitle(index),
                    author: _getAuthorName(index),
                    imagePath: 'assets/${index + 1}.jpg',
                  ),
                ),
              );
            },
            child: Container(
              width: 150,
              margin: const EdgeInsets.only(right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _bookCover('assets/${index + 1}.jpg', height: 180),
                  const SizedBox(height: 5),
                  Text(
                    _getBookTitle(index),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _getAuthorName(index),
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBestsellersBookList() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 5,
        childAspectRatio: 0.75,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        String imagePath = 'assets/${index + 1}.jpg';
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookDetailScreen(
                  title: _getBookTitle(index),
                  author: _getAuthorName(index),
                  imagePath: 'assets/${index + 1}.jpg',
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _bookCover(imagePath, height: 150),
              const SizedBox(height: 5),
              Text(
                _getBookTitle(index),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                _getAuthorName(index),
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _bookCover(String imagePath, {double height = 150}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  String _getBookTitle(int index) {
    const bookTitles = [
      'Atomic Habits',
      'Meet Me',
      'Diary of a Wimpy Kid',
      'It Starts with Us',
      'Ugly Love',
    ];
    return bookTitles[index % bookTitles.length];
  }

  String _getAuthorName(int index) {
    const authors = [
      'James Clear',
      'Melissa Ferguson',
      'Jeff Kinney',
      'Colleen Hoover',
      'Colleen Hoover',
    ];
    return authors[index % authors.length];
  }
}
