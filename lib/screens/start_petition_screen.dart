import 'package:flutter/material.dart';
import '../widgets/top_bar.dart';
import '../widgets/sidebar.dart';
import '../widgets/footer_widget.dart';

class StartPetitionScreen extends StatelessWidget {
  const StartPetitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      drawer: const Sidebar(),
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                "Start Petition Screen",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const FooterWidget(),
        ],
      ),
    );
  }
}