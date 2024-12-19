import 'package:flutter/material.dart';
import 'sign_in&sign_up.dart';
import 'bookstore.dart'; // Import bookstore.dart to use the BookstoreScreen// Import the login and sign-up file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bookstore',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF607AFB)),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white),
        ),
        scaffoldBackgroundColor: const Color(0xFF0F172A),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(), // Register Page route
      },
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text(
              'Welcome to Bookstore',
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            const SizedBox(height: 40),
            const Text(
              'Get lost in a good book',
              style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Text(
              'Enjoy your favorite books, or discover something new.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 40),
// Apple button with icon
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BookstoreScreen()),
                );
              },
              icon: const Icon(Icons.apple, color: Colors.white), // Apple icon
              label: const Text(
                'Continue with Apple',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E293B),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
            const SizedBox(height: 15),
// Facebook button with icon
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.facebook, color: Colors.white),
              label: const Text(
                'Continue with Facebook',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1877F2),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
            const SizedBox(height: 20),
// Google button with icon
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.white),
              label: const Text(
                'Continue with Google',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4285F4),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
            const SizedBox(height: 15),
            // Sign up button with icon
            TextButton.icon(
              onPressed: () {
                // Navigate to Login Page
                Navigator.pushNamed(context, '/login');
              },
              icon: const Icon(Icons.account_circle, color: Colors.white),
              label: const Text(
                'Sign up for free',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'By continuing, you agree to the Terms of Use. Read our Privacy Policy.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
