import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            // App header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              alignment: Alignment.centerLeft,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ShoeVogue',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20, // Increased from 10 to 20
                    ),
                  ),
                  Icon(Icons.settings, color: Colors.red, size: 24), // Increased size
                ],
              ),
            ),

            // Product showcase
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'WE OFFER UNIQUE BRAND',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18, // Increased from 10 to 18
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.3), // Light shadow
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20), // Ensure image is rounded
                        child: Image.asset(
                          'assets/images/shoess.png',
                          height: 200, // Increased from 100 to 200
                          width: 200, // Added width to keep proportions
                          fit: BoxFit.cover, // Ensures proper fit
                          errorBuilder: (context, error, stackTrace) {
                            return const Text(
                              'Image not found',
                              style: TextStyle(color: Colors.white),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // CTA Section
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(30), // Increased padding
                decoration: const BoxDecoration(
                  color: Color(0xFFFF5640),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Shoes For ALL',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 42, // Increased from 36 to 42
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Get started pressed!')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFFFF5640),
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 18), // Bigger button
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)), // More rounded
                        ),
                        child: const Text(
                          'Get started',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), // Increased from 16 to 18
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
