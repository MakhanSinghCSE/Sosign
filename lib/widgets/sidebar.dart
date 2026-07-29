import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';

import '../screens/start_petition_screen.dart';
import '../screens/start_crowdfunding_screen.dart';
import '../screens/my_petitions_screen.dart';
import '../screens/current_petitions_screen.dart';
import '../screens/crowdfunding_screen.dart';
import '../screens/success_stories_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/trending_screen.dart';
import '../screens/about_screen.dart';
import '../screens/contact_screen.dart';
import '../screens/successful_petitions_screen.dart'; // Add this import

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: MediaQuery.of(context).size.width * 0.75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with close button and logo
          Container(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade100, width: 1),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade200, width: 1),
                  ),
                  child: const Center(
                    child: Text(
                      "S",
                      style: TextStyle(
                        color: Color(0xff3047A6),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "SOSign",
                        style: TextStyle(
                          color: Color(0xff3047A6),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ".in",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // Close button
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.grey,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 5),

          // Menu Items - Using Expanded with ListView
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                _buildMenuItem(
                  context,
                  title: "Home",
                  isActive: true,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                    );
                  },
                ),
                _buildMenuItem(
                  context,
                  title: "Start a Petition",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const StartPetitionScreen(),
                      ),
                    );
                  },
                ),
                _buildMenuItem(
                  context,
                  title: "Start Crowdfunding",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const StartCrowdfundingScreen(),
                      ),
                    );
                  },
                ),
                _buildMenuItem(
                  context,
                  title: "My Petitions",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MyPetitionsScreen(),
                      ),
                    );
                  },
                ),
                _buildMenuItem(
                  context,
                  title: "Current Petitions",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CurrentPetitionsScreen(),
                      ),
                    );
                  },
                ),
                _buildMenuItem(
                  context,
                  title: "Crowdfunding",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CrowdfundingScreen(),
                      ),
                    );
                  },
                ),
                // Success Stories menu item - Added here
                _buildMenuItem(
                  context,
                  title: "Success Stories",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SuccessfulPetitionsScreen(),
                      ),
                    );
                  },
                ),
                _buildMenuItem(
                  context,
                  title: "Categories",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CategoriesScreen(),
                      ),
                    );
                  },
                ),
                _buildMenuItem(
                  context,
                  title: "Trending",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const TrendingScreen()),
                    );
                  },
                ),
                _buildMenuItem(
                  context,
                  title: "About Us",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AboutScreen()),
                    );
                  },
                ),
                _buildMenuItem(
                  context,
                  title: "Contact",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ContactScreen()),
                    );
                  },
                ),
              ],
            ),
          ),

          // Bottom section - Social Icons (Fixed position)
          Container(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Colors.grey.shade100, width: 1),
              ),
            ),
            child: Row(
              children: [
                _buildSocialIcon(
                  icon: Icons.facebook,
                  color: const Color(0xff3d3d5c),
                  onTap: () {
                    // Open Facebook
                  },
                ),
                const SizedBox(width: 10),
                _buildSocialIcon(
                  icon: Icons.telegram,
                  color: const Color(0xff3d3d5c),
                  onTap: () {
                    // Open Telegram
                  },
                ),
                const SizedBox(width: 10),
                _buildSocialIcon(
                  icon: Icons.abc,
                  color: const Color(0xff3d3d5c),
                  onTap: () {
                    // Open Instagram
                  },
                ),
                const SizedBox(width: 10),
                _buildSocialIcon(
                  icon: Icons.youtube_searched_for,
                  color: const Color(0xff3d3d5c),
                  onTap: () {
                    // Open YouTube
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required String title,
    bool isActive = false,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? Colors.transparent : Colors.transparent,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isActive ? const Color(0xffF43676) : const Color(0xff302d55),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200, width: 1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color, size: 14),
      ),
    );
  }
}