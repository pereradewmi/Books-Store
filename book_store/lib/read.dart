import 'package:flutter/material.dart';

class BookReaderScreen extends StatefulWidget {
  const BookReaderScreen({super.key});

  @override
  _BookReaderScreenState createState() => _BookReaderScreenState();
}

class _BookReaderScreenState extends State<BookReaderScreen> {

  final List<String> bookPages = List.generate(
    6,
    (index) => 'assets/book_pages/page${index + 1}.png',
  );

  int currentPage = 0; 

  void nextPage() {
    setState(() {
      if (currentPage < bookPages.length - 1) {
        currentPage++;
      }
    });
  }

  void previousPage() {
    setState(() {
      if (currentPage > 0) {
        currentPage--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A192F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A192F),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Final Count Down',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      width: 350,
                      height: 600,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(bookPages[currentPage]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 610,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_left,
                        size: 40,
                        color: Colors.white,
                      ),
                      onPressed: previousPage,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 610,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_right,
                        size: 40,
                        color: Colors.white,
                      ),
                      onPressed: currentPage < bookPages.length - 1
                          ? nextPage
                          : null, 
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              'page ${currentPage + 1} / ${bookPages.length}',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    //  download 
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF02ABB0),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: const Icon(Icons.download, color: Colors.white),
                  label: const Text(
                    'Download Book',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    //  share 
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF02ABB0),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: const Icon(Icons.share, color: Colors.white),
                  label: const Text(
                    'Share Book',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
