import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/product_category.dart';
import 'package:couldai_user_app/screens/product_list_screen.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProductCategory> categories = [
      ProductCategory(name: 'Engine Oils', icon: Icons.oil_barrel),
      ProductCategory(name: 'Gear Oils', icon: Icons.settings),
      ProductCategory(name: 'Coolant', icon: Icons.thermostat),
      ProductCategory(name: 'Brake Pads', icon: Icons.disc_full),
      ProductCategory(name: 'Oil Filters', icon: Icons.filter_alt),
      ProductCategory(name: 'Air Filters', icon: Icons.air),
      ProductCategory(name: 'Suspension', icon: Icons.directions_car),
      ProductCategory(name: 'Wiper Blades', icon: Icons.wb_sunny),
      ProductCategory(name: 'Headlight Bulbs', icon: Icons.lightbulb),
      ProductCategory(name: 'Other Parts', icon: Icons.build),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Catalogue'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.2,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductListScreen(category: category),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(category.icon, size: 48, color: Theme.of(context).colorScheme.secondary),
                  const SizedBox(height: 12),
                  Text(
                    category.name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall,
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
