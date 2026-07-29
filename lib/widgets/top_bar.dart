import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../widgets/sidebar.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      toolbarHeight: 92,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            // Logo
            GestureDetector(
              onTap: () {
                // Navigate to home
              },
              child: Image.asset(
                'assets/logo.webp', // Make sure to add your logo image
                height: 40,
                width: 120,
                fit: BoxFit.contain,
              ),
            ),
            
            const Spacer(),
            
            // Desktop Navigation - Hidden on mobile
            if (MediaQuery.of(context).size.width >= 1024) ...[
              _buildNavButton(context, 'Start Campaign'),
              const SizedBox(width: 12),
              _buildNavButton(context, 'Pages'),
              const SizedBox(width: 12),
              _buildNavButton(context, 'Contact'),
              const SizedBox(width: 20),
            ],
            
            // Social Media Icons - Hidden on mobile
            if (MediaQuery.of(context).size.width >= 768) ...[
              _buildSocialIcon(
                icon: Icons.facebook,
                onTap: () {
                  // Open Facebook
                },
              ),
              _buildSocialIcon(
                icon: Icons.crop_square_sharp,
                onTap: () {
                  // Open X (Twitter)
                },
              ),
              _buildSocialIcon(
                icon: Icons.telegram,
                onTap: () {
                  // Open Telegram
                },
              ),
              _buildSocialIcon(
                icon: Icons.install_desktop,
                onTap: () {
                  // Open Instagram
                },
              ),
              _buildSocialIcon(
                icon: Icons.youtube_searched_for,
                onTap: () {
                  // Open YouTube
                },
              ),
              const SizedBox(width: 12),
            ],
            
            // Search Button
            Container(
              width: 28,
              height: 28,
              decoration: const BoxDecoration(
                color: Color(0xffF43676),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 14,
                ),
                onPressed: () {
                  // Search functionality
                },
              ),
            ),
            
            const SizedBox(width: 8),
            
            // Login Button
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xffF43676),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 16,
                    ),
                    SizedBox(width: 6),
                    Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(width: 4),
            
            // Menu Button - Shows on mobile and tablet
            Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Color(0xff302d55),
                    size: 24,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        // Navigate to respective page
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xff302d55),
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          Container(
            height: 2,
            width: 0,
            color: const Color(0xffF43676),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      width: 32,
      height: 32,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        icon: Icon(
          icon,
          color: const Color(0xff3d3d5c),
          size: 14,
        ),
        onPressed: onTap,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(92);
}