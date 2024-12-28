import 'package:flutter/material.dart';
import 'bookstore.dart';
import 'read.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Favourties',
      theme: ThemeData.light(),
      home: LibraryScreenItems(),
    );
  }
}

class LibraryScreenItems extends StatelessWidget {
  LibraryScreenItems({super.key});

  final List<BookItem> cartItems = [
    BookItem(
      title: 'The Heroes of Summer',
      author: 'Eric Ries',
      progress: 0.75,
      image: const AssetImage('assets/book1.jpg'),
    ),
    BookItem(
      title: 'The Beauty Within',
      author: 'Eric Ries',
      progress: 0.45,
      image: const AssetImage('assets/book2.jpg'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E293B),
      appBar: AppBar(
        title: const Text(
          'My Favourties',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
            builder: (context) => const BookstoreScreen(),
          ),
        );
          },
        ),
        backgroundColor: const Color(0xFF1E293B),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return BookItemWidget(item: item);
        },
      ),
    );
  }
}

class BookItem {
  final String title;
  final String author;
  final double progress;
  final AssetImage image;

  BookItem({
    required this.title,
    required this.author,
    required this.progress,
    required this.image,
  });
}

class BookItemWidget extends StatelessWidget {
  final BookItem item;

  const BookItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BookReaderScreen(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image(
              image: item.image,
              height: 75,
              width: 55,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          item.title,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BookReaderScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF02ABB0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                        ),
                        child: const Text(
                          'Read',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
              
                  Text(
                    item.author,
                    style: TextStyle(fontSize: 14, color: Colors.grey[300]),
                  ),
                  const SizedBox(height: 5),
             
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: SizedBox(
                      height: 8,
                      child: LinearProgressIndicator(
                        value: item.progress,
                        backgroundColor: Colors.grey[600],
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
