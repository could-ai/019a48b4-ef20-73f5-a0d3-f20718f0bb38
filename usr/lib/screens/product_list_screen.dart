import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/product_category.dart';
import 'package:couldai_user_app/models/product.dart';
import 'package:couldai_user_app/data/mock_data.dart';

class ProductListScreen extends StatelessWidget {
  final ProductCategory category;

  const ProductListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = mockProducts
        .where((product) => product.category == category.name)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: categoryProducts.isEmpty
          ? Center(
              child: Text(
                'No products found in this category yet.',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: categoryProducts.length,
              itemBuilder: (context, index) {
                final product = categoryProducts[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          color: Colors.black26,
                          child: Icon(Icons.oil_barrel, size: 50, color: Theme.of(context).colorScheme.secondary),
                          // TODO: Replace with Image.asset(product.image)
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                product.description,
                                style: Theme.of(context).textTheme.bodySmall,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: OutlinedButton(
                                  onPressed: () {
                                    // TODO: Implement Add to Inquiry Cart
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('${product.name} added to inquiry cart (simulation).'),
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );
                                  },
                                  child: const Text('Add to Inquiry'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
