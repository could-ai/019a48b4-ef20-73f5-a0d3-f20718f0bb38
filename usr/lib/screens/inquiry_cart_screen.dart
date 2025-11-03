import 'package:flutter/material.dart';

class InquiryCartScreen extends StatelessWidget {
  const InquiryCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inquiry Cart'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.white54),
            const SizedBox(height: 20),
            Text(
              'Your Inquiry Cart is Empty',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            const Text(
              'Add products to the cart to send an inquiry.',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                 // This should navigate to the products tab
              },
              icon: const Icon(Icons.shopping_bag),
              label: const Text('Browse Products'),
            ),
          ],
        ),
      ),
    );
  }
}
