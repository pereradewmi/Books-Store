import 'package:flutter/material.dart';

class ShoppingCartApp extends StatelessWidget {
  const ShoppingCartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping Cart',
      theme: ThemeData.light(),
      home: MyCartScreen(),
    );
  }
}

class MyCartScreen extends StatelessWidget {
  MyCartScreen({super.key});

  final List<CartItem> cartItems = [
    CartItem(
      title: 'The Heroes of Summer',
      author: 'Eric Ries',
      price: 15.99,
      image: const AssetImage('assets/book1.jpg'),
    ),
    CartItem(
      title: 'The Beauty Within',
      author: 'Eric Ries',
      price: 15.99,
      image: const AssetImage('assets/book2.jpg'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E293B),
      appBar: AppBar(
        title: const Text(
          'Shopping Cart',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xFF1E293B),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return CartItemWidget(item: item);
              },
            ),
          ),
          const BottomButtons(),
        ],
      ),
    );
  }
}

class CartItem {
  final String title;
  final String author;
  final double price;
  final AssetImage image;

  CartItem({
    required this.title,
    required this.author,
    required this.price,
    required this.image,
  });
}

class CartItemWidget extends StatelessWidget {
  final CartItem item;

  const CartItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Text(
                  item.title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  item.author,
                  style: TextStyle(fontSize: 14, color: Colors.grey[300]),
                ),
                const SizedBox(height: 5),
                Text(
                  '\$${item.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () {},
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF02ABB0),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
                ),
                child: const Text(
                  'Add to Wishlist',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: const Color(0xFF1E293B),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                //  Checkout
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF057F83),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text(
                'Checkout',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF02ABB0),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text(
                'Continue Shopping',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
