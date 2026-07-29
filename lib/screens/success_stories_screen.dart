import 'package:flutter/material.dart';
import '../widgets/top_bar.dart';
import '../widgets/sidebar.dart';
import '../widgets/footer_widget.dart';

class SuccessStoriesScreen extends StatelessWidget {
  const SuccessStoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF6F8),
      appBar: const TopBar(),
      drawer: const Sidebar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            _content(Icons.emoji_events, "Success Stories"),
            const SizedBox(height: 50),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }

  Widget _content(IconData icon, String title) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1000),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Icon(
              icon,
              size: 80,
              color: const Color(0xffF43676),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Coming Soon",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}