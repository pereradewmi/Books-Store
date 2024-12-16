import 'package:flutter/material.dart';

class BookstoreScreen extends StatefulWidget {
  const BookstoreScreen({super.key});

  @override
  State<BookstoreScreen> createState() => _BookstoreScreenState();
}

class _BookstoreScreenState extends State<BookstoreScreen> {
  int _selectedIndex =
      0; // To track the current index of the BottomNavigationBar

  // Method to handle bottom navigation item tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // Background Color
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        automaticallyImplyLeading: false, // Remove the back button
        title: const Text(
          'Bookstore',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: const [
          Icon(Icons.search, size: 28, color: Colors.white),
          SizedBox(width: 15),
        ],
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Tabs
            const TabBar(
              isScrollable: false,
              indicatorColor: Colors.blueAccent,
              labelColor: Colors.blueAccent,
              unselectedLabelColor: Colors.white60,
              labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              tabs: [
                Tab(text: 'New'),
                Tab(text: 'Novels'),
                Tab(text: 'Fiction'),
                Tab(text: 'Articles'),
              ],
            ),
            const SizedBox(height: 10),

            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ListView(
                  children: [
                    _sectionTitle('Featured Books'),
                    const SizedBox(height: 20),
                    _buildHorizontalBookList(),
                    const SizedBox(height: 30),
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
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1E293B),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 22, 96, 224),
        unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        showUnselectedLabels: true,
        currentIndex: _selectedIndex, // Current index
        onTap: _onItemTapped, // Handle taps
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

  // Section title widget
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

  // Horizontal ListView for Featured Books
  Widget _buildHorizontalBookList() {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5, // Adjust this number to the total number of books
        itemBuilder: (context, index) {
          return Container(
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
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  _getAuthorName(index),
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // GridView for Bestsellers in Business
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
      itemCount: 4, // Adjust this number to the total number of books
      itemBuilder: (context, index) {
        // Correct path for bestsellers in business images
        String imagePath = 'assets/${index + 1}.jpg';
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _bookCover(imagePath, height: 150),
            const SizedBox(height: 5),
            Text(
              _getBookTitle(index),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              _getAuthorName(index),
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        );
      },
    );
  }

  // Book Cover Widget
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

  // Method to get book titles
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

  // Method to get author names
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
