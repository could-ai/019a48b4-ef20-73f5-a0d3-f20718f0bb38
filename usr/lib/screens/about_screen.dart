import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About & Contact'),
      ),
      body: ListView(
        children: [
          _buildSectionHeader(context, 'About SRSM Lubricants'),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'SRSM Lubricants is a leading provider of premium quality automotive lubricants and car care products. Our mission is to provide our customers with the best products that enhance performance and longevity of their vehicles.',
              style: TextStyle(height: 1.5),
            ),
          ),
          const Divider(),
          _buildSectionHeader(context, 'Contact Information'),
          _buildContactTile(
            icon: Icons.location_on,
            title: 'Location',
            subtitle: 'Jaipur, Rajasthan, India',
            onTap: () => _launchUrl('https://maps.google.com/?q=Jaipur,Rajasthan,India'),
          ),
          _buildContactTile(
            icon: Icons.phone,
            title: 'WhatsApp',
            subtitle: '+91 12345 67890',
            onTap: () => _launchUrl('https://wa.me/911234567890'),
          ),
          _buildContactTile(
            icon: Icons.email,
            title: 'Email',
            subtitle: 'contact@srsm-lubricants.com',
            onTap: () => _launchUrl('mailto:contact@srsm-lubricants.com'),
          ),
          _buildContactTile(
            icon: Icons.camera_alt, // Placeholder for Instagram
            title: 'Instagram',
            subtitle: '@srsm_lubricants',
            onTap: () => _launchUrl('https://www.instagram.com/srsm_lubricants'),
          ),
          const Divider(),
          _buildSectionHeader(context, 'Forms & Support'),
          _buildContactTile(
            icon: Icons.handshake,
            title: 'Dealer Inquiry Form',
            subtitle: 'Partner with us',
            onTap: () => _showNotImplemented(context, 'Dealer Inquiry Form'),
          ),
          _buildContactTile(
            icon: Icons.list_alt,
            title: 'Online Order Request',
            subtitle: 'Request an order online',
            onTap: () => _showNotImplemented(context, 'Online Order Request'),
          ),
           _buildContactTile(
            icon: Icons.support_agent,
            title: 'Service & Support',
            subtitle: 'Get help from our team',
            onTap: () => _showNotImplemented(context, 'Service & Support'),
          ),
          _buildContactTile(
            icon: Icons.picture_as_pdf,
            title: 'Download Brochure',
            subtitle: 'View our product catalogue',
            onTap: () => _showNotImplemented(context, 'PDF Download'),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
      ),
    );
  }

  Widget _buildContactTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  void _showNotImplemented(BuildContext context, String feature) {
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature feature is not implemented yet.'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
