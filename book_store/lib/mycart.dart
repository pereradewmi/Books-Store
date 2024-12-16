import 'package:flutter/material.dart';

void main() {
  runApp(ShoppingCartApp());
}

class ShoppingCartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping Cart',
      theme: ThemeData.dark(),
      home: ShoppingCartPage(),
    );
  }
}

class ShoppingCartPage extends StatelessWidget {
  final List<CartItem> cartItems = [
    CartItem(
      title: 'The Heroes of Summer',
      author: 'Eric Ries',
      price: 15.99,
      image: AssetImage('assets/book1.jpg'),
    ),
    CartItem(
      title: 'The Beauty Within',
      author: 'Eric Ries',
      price: 15.99,
      image: AssetImage('assets/book2.jpg'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E293B),
      appBar: AppBar(
        title: Text('Shopping Cart'),
        leading: Icon(Icons.arrow_back),
        backgroundColor: const Color(0xFF1E293B),
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
          BottomButtons(),
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

  const CartItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // Local Image
          Image(
            image: item.image,
            height: 75,
            width: 55,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10),
          // Item Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  item.author,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: 5),
                Text(
                  '\$${item.price.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Wishlist Button and Delete Icon
          Column(
            children: [
              SizedBox(height: 5),
              GestureDetector(
                onTap: () {
                  // Handle delete action
                },
                child: Icon(Icons.delete, color: Colors.white),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[800],
                  padding: EdgeInsets.symmetric(horizontal: 13, vertical: 4),
                ),
                child: Text(
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
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: const Color(0xFF1E293B),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // Handle Checkout
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
              child: Text(
                'Checkout',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // Handle Continue Shopping
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[800],
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
              child: Text(
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
