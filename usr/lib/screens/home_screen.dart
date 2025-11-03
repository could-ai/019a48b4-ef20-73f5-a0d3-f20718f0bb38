import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SRSM LUBRICANTS'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to SRSM Lubricants',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Premium Quality Lubricants & Car Care Products',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 24),
            _buildFeatureCard(
              context,
              icon: Icons.category,
              title: 'Browse Products',
              subtitle: 'Explore our wide range of products',
              onTap: () {
                // This will be handled by the MainScreen's navigation
              },
            ),
            const SizedBox(height: 16),
            _buildFeatureCard(
              context,
              icon: Icons.support_agent,
              title: 'Service & Support',
              subtitle: 'Get help and support from our team',
              onTap: () {},
            ),
            const SizedBox(height: 16),
            _buildFeatureCard(
              context,
              icon: Icons.handshake,
              title: 'Dealer Inquiry',
              subtitle: 'Become a partner with us',
              onTap: () {},
            ),
            const SizedBox(height: 24),
            Text(
              'Featured Categories',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _CategoryChip(label: 'Engine Oils', icon: Icons.oil_barrel),
                  _CategoryChip(label: 'Gear Oils', icon: Icons.settings),
                  _CategoryChip(label: 'Coolants', icon: Icons.thermostat),
                  _CategoryChip(label: 'Filters', icon: Icons.filter_alt),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context,
      {required IconData icon,
      required String title,
      required String subtitle,
      required VoidCallback onTap}) {
    return Card(
      child: ListTile(
        leading: Icon(icon, size: 40, color: Theme.of(context).colorScheme.secondary),
        title: Text(title, style: Theme.of(context).textTheme.titleMedium),
        subtitle: Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final IconData icon;

  const _CategoryChip({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Theme.of(context).cardTheme.color,
            child: Icon(icon, size: 30, color: Theme.of(context).colorScheme.secondary),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
