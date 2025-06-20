import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  Widget section(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 27, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(content, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('About', style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            section('Our Mission',
                'Our mission is to provide users with a comprehensive and reliable source of information on a wide range of topics. We strive to make knowledge accessible to everyone, fostering curiosity and lifelong learning.'),
            section('Background',
                'This app was developed by a team of passionate individuals dedicated to creating a valuable resource for users seeking information. We believe in the power of knowledge to empower individuals and contribute to a more informed society.'),
            section('Contact Us',
                'If you have any questions, feedback, or suggestions, please don’t hesitate to reach out to us at support@infoapp.com. We value your input and are committed to continuously improving our app.'),
          ],
        ),
      ),
      // bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }
}
