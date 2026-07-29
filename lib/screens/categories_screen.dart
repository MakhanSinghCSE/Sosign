import 'package:flutter/material.dart';
import '../widgets/top_bar.dart';
import '../widgets/sidebar.dart';
import '../widgets/footer_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0f2f5),
      appBar: const TopBar(),
      drawer: const Sidebar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 48),
            _buildHeroSection(),
            const SizedBox(height: 32),
            _buildSearchBar(),
            const SizedBox(height: 24),
            _buildCategoriesGrid(context),
            const SizedBox(height: 50),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff002050),
            Color(0xff1C2A69),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background radial gradient
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    const Color(0xffF43676).withOpacity(0.15),
                    Colors.transparent,
                  ],
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xffF43676),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Campaign Topics',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Explore Petition Categories',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                'Find and support verified petitions that align with your passions. Choose a category below to see active campaigns, or launch your own movement today.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffE5E7EB),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      constraints: const BoxConstraints(maxWidth: 600),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search petition categories...',
          hintStyle: const TextStyle(
            color: Color(0xff9CA3AF),
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xff9CA3AF),
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Color(0xffF43676),
              width: 2,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }

  Widget _buildCategoriesGrid(BuildContext context) {
    final categories = [
      _CategoryData(
        icon: Icons.pets,
        title: 'Animals',
        description: 'Support animal welfare, combat animal abuse, stop cruelty, and protect wildlife habitats.',
        count: 1,
        color: Colors.green.shade50,
        iconColor: Colors.green.shade700,
        borderColor: Colors.green.shade100,
        gradientColors: [Colors.green.shade500, Colors.teal.shade600],
      ),
      _CategoryData(
        icon: Icons.school,
        title: 'Education',
        description: 'Advocate for school infrastructure, educational reform, student rights, tuition relief, and digital learning devices.',
        count: 3,
        color: Colors.indigo.shade50,
        iconColor: Colors.indigo.shade700,
        borderColor: Colors.indigo.shade100,
        gradientColors: [Colors.blue.shade500, Colors.indigo.shade600],
      ),
      _CategoryData(
        icon: Icons.nature,
        title: 'Environment',
        description: 'Combat climate change, reduce plastic pollution, protect forests, clean oceans, and support renewable energy.',
        count: 6,
        color: Colors.green.shade50,
        iconColor: Colors.green.shade700,
        borderColor: Colors.green.shade100,
        gradientColors: [Colors.green.shade500, Colors.teal.shade600],
      ),
      _CategoryData(
        icon: Icons.sports_esports,
        title: 'Game',
        description: 'Support digital safety in multiplayer environments, e-sports growth, and fair monetization practices.',
        count: 0,
        color: Colors.red.shade50,
        iconColor: Colors.red.shade700,
        borderColor: Colors.red.shade100,
        gradientColors: [Colors.red.shade500, Colors.orange.shade600],
      ),
      _CategoryData(
        icon: Icons.health_and_safety,
        title: 'Health',
        description: 'Advocate for hospital infrastructure, public health awareness, critical care funding, and mental health resources.',
        count: 3,
        color: Colors.pink.shade50,
        iconColor: Colors.pink.shade700,
        borderColor: Colors.pink.shade100,
        gradientColors: [Colors.pink.shade500, Colors.red.shade600],
      ),
      _CategoryData(
        icon: Icons.gavel,
        title: 'Human Rights',
        description: 'Fight for social justice, civil rights, gender equality, marginalized communities, and freedom of expression.',
        count: 9,
        color: Colors.purple.shade50,
        iconColor: Colors.purple.shade700,
        borderColor: Colors.purple.shade100,
        gradientColors: [Colors.purple.shade500, Colors.deepPurple.shade600],
      ),
      _CategoryData(
        icon: Icons.house,
        title: 'Interior',
        description: 'Advocate for urban beautification, public parks space designs, and standard accessible housing plans.',
        count: 0,
        color: Colors.brown.shade50,
        iconColor: Colors.brown.shade700,
        borderColor: Colors.brown.shade100,
        gradientColors: [Colors.brown.shade500, Colors.grey.shade600],
      ),
      _CategoryData(
        icon: Icons.favorite,
        title: 'Lifestyle',
        description: 'Promote healthy eating, sustainable green living, wellness accessibility, and mindfulness education.',
        count: 0,
        color: Colors.pink.shade50,
        iconColor: Colors.pink.shade700,
        borderColor: Colors.pink.shade100,
        gradientColors: [Colors.pink.shade500, Colors.red.shade600],
      ),
      _CategoryData(
        icon: Icons.gavel_outlined,
        title: 'Politics',
        description: 'Advocate for policy reforms, state governance accountability, voting rights, and civic action.',
        count: 3,
        color: Colors.amber.shade50,
        iconColor: Colors.amber.shade700,
        borderColor: Colors.amber.shade100,
        gradientColors: [Colors.amber.shade500, Colors.orange.shade600],
      ),
      _CategoryData(
        icon: Icons.sports,
        title: 'Sports',
        description: 'Advocate for public athletic facilities, school sports funding, and positive community recreation programs.',
        count: 0,
        color: Colors.cyan.shade50,
        iconColor: Colors.cyan.shade700,
        borderColor: Colors.cyan.shade100,
        gradientColors: [Colors.cyan.shade500, Colors.blue.shade600],
      ),
      _CategoryData(
        icon: Icons.computer,
        title: 'Technology',
        description: 'Defend digital privacy, raise scam awareness, support rural broadband connectivity, and fight internet censorship.',
        count: 3,
        color: Colors.deepPurple.shade50,
        iconColor: Colors.deepPurple.shade700,
        borderColor: Colors.deepPurple.shade100,
        gradientColors: [Colors.deepPurple.shade500, Colors.purple.shade600],
      ),
      _CategoryData(
        icon: Icons.flight,
        title: 'Travel',
        description: 'Advocate for sustainable eco-tourism, improved public transport safety, and local community infrastructure.',
        count: 0,
        color: Colors.lightBlue.shade50,
        iconColor: Colors.lightBlue.shade700,
        borderColor: Colors.lightBlue.shade100,
        gradientColors: [Colors.lightBlue.shade500, Colors.cyan.shade600],
      ),
      _CategoryData(
        icon: Icons.work,
        title: 'Employment',
        description: 'Join hands with others to make a positive impact and drive change in this category.',
        count: 2,
        color: Colors.grey.shade50,
        iconColor: Colors.grey.shade700,
        borderColor: Colors.grey.shade200,
        gradientColors: [Colors.grey.shade500, Colors.blueGrey.shade600],
      ),
      _CategoryData(
        icon: Icons.category,
        title: 'ZENZ',
        description: 'Join hands with others to make a positive impact and drive change in this category.',
        count: 0,
        color: Colors.grey.shade50,
        iconColor: Colors.grey.shade700,
        borderColor: Colors.grey.shade200,
        gradientColors: [Colors.grey.shade500, Colors.blueGrey.shade600],
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width > 768 ? 2 : 1,
          childAspectRatio: 1.4,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return _buildCategoryCard(category);
        },
      ),
    );
  }

  Widget _buildCategoryCard(_CategoryData category) {
    return GestureDetector(
      onTap: () {
        // Navigate to category detail
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.grey.shade100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Decorative gradient circle
            Positioned(
              top: -20,
              right: -20,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      category.gradientColors[0].withOpacity(0.2),
                      category.gradientColors[1].withOpacity(0.2),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: category.color,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: category.borderColor),
                        ),
                        child: Icon(
                          category.icon,
                          color: category.iconColor,
                          size: 24,
                        ),
                      ),
                      const Spacer(),
                      if (category.count > 0)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xffFDF2F6),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '${category.count}',
                            style: const TextStyle(
                              color: Color(0xffF43676),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    category.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff002050),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Expanded(
                    child: Text(
                      category.description,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xff6B7280),
                        height: 1.4,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Text(
                        'Active Petitions',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff9CA3AF),
                          letterSpacing: 0.5,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xffFDF2F6),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '${category.count}',
                          style: const TextStyle(
                            color: Color(0xffF43676),
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryData {
  final IconData icon;
  final String title;
  final String description;
  final int count;
  final Color color;
  final Color iconColor;
  final Color borderColor;
  final List<Color> gradientColors;

  _CategoryData({
    required this.icon,
    required this.title,
    required this.description,
    required this.count,
    required this.color,
    required this.iconColor,
    required this.borderColor,
    required this.gradientColors,
  });
}