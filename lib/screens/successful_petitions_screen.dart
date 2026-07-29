import 'package:flutter/material.dart';
import '../widgets/top_bar.dart';
import '../widgets/sidebar.dart';
import '../widgets/footer_widget.dart';

class SuccessfulPetitionsScreen extends StatelessWidget {
  const SuccessfulPetitionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: const TopBar(),
      drawer: const Sidebar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                children: [
                  // Header Section
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1150),
                        child: Column(
                          children: [
                            const Text(
                              'Successful Petitions',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff1A1A2E),
                                letterSpacing: -0.5,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              child: Text(
                                'Celebrate the victories! These petitions have successfully achieved their goals and made a real difference in communities around the world.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: constraints.maxWidth < 600 ? 16 : 18,
                                  color: const Color(0xff6B7280),
                                  height: 1.6,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Filter Bar
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1150),
                        child: _buildFilterBar(context, constraints.maxWidth),
                      ),
                    ),
                  ),

                  // Petitions Grid
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1150),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Successful Petitions',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff1A1A2E),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'These petitions have successfully achieved their goals and made a difference.',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff6B7280),
                              ),
                            ),
                            const SizedBox(height: 32),
                            _buildPetitionsGrid(context, constraints.maxWidth),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Impact Statistics
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1150),
                        child: Column(
                          children: [
                            const Text(
                              'Impact Statistics',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff1A1A2E),
                              ),
                            ),
                            const SizedBox(height: 48),
                            _buildImpactStats(constraints.maxWidth),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const FooterWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFilterBar(BuildContext context, double maxWidth) {
    bool isSmallScreen = maxWidth < 768;
    
    if (isSmallScreen) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search by title...',
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                            isDense: true,
                          ),
                        ),
                      ),
                      Container(
                        width: 42,
                        height: 42,
                        decoration: const BoxDecoration(
                          color: Color(0xffF43676),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.search, color: Colors.white, size: 20),
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 120,
                height: 42,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: null,
                    hint: const Text('Category'),
                    isExpanded: true,
                    items: const [
                      'All',
                      'Environment',
                      'Education',
                      'Healthcare',
                      'Social Justice',
                      'Politics',
                      'Animal Rights',
                      'Human Rights',
                      'Technology',
                      'Other',
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value == 'All' ? null : value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {},
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            height: 42,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: 'newest',
                isExpanded: true,
                items: const [
                  DropdownMenuItem(value: 'newest', child: Text('Newest First')),
                  DropdownMenuItem(value: 'oldest', child: Text('Oldest First')),
                  DropdownMenuItem(value: 'signatures', child: Text('Most Signatures')),
                  DropdownMenuItem(value: 'title', child: Text('Alphabetical')),
                ],
                onChanged: (String? newValue) {},
              ),
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Container(
            width: 180,
            height: 42,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: null,
                hint: const Text('All Categories'),
                isExpanded: true,
                items: const [
                  'All Categories',
                  'Environment',
                  'Education',
                  'Healthcare',
                  'Social Justice',
                  'Politics',
                  'Animal Rights',
                  'Human Rights',
                  'Technology',
                  'Other',
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value == 'All Categories' ? null : value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {},
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              height: 42,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search by title...',
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                        isDense: true,
                      ),
                    ),
                  ),
                  Container(
                    width: 42,
                    height: 42,
                    decoration: const BoxDecoration(
                      color: Color(0xffF43676),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.search, color: Colors.white, size: 20),
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 160,
            height: 42,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: 'newest',
                isExpanded: true,
                items: const [
                  DropdownMenuItem(value: 'newest', child: Text('Newest First')),
                  DropdownMenuItem(value: 'oldest', child: Text('Oldest First')),
                  DropdownMenuItem(value: 'signatures', child: Text('Most Signatures')),
                  DropdownMenuItem(value: 'title', child: Text('Alphabetical')),
                ],
                onChanged: (String? newValue) {},
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildPetitionsGrid(BuildContext context, double maxWidth) {
    int crossAxisCount = 1;
    if (maxWidth >= 1200) {
      crossAxisCount = 3;
    } else if (maxWidth >= 768) {
      crossAxisCount = 2;
    }

    // Sample data
    final List<Map<String, dynamic>> petitions = [
      {
        'title': 'Publish the Gauniti Law in the Official Gazette',
        'signatures': 5,
        'country': 'India',
        'description': 'Supporters of the proposed Gauniti Law have raised concerns that the law has not yet been officially published in the Government Gazette. They believe that the delay in notification has created uncertainty regarding its implementation and enforcement.',
        'creator': 'Nikita Palande',
        'date': 'Started: 6/23/2026',
        'category': 'Other',
        'imageUrl': 'https://res.cloudinary.com/dhz4my0yx/image/upload/v1782204612/petition-images/p38lzso6qyzy5gqwi0jy.jpg',
      },
      {
        'title': 'Expand Career Guidance and Counseling Services',
        'signatures': 1,
        'country': 'India',
        'description': 'Many students and young job seekers lack access to proper career guidance and counseling, making it difficult for them to make informed decisions about education, skills, and employment opportunities.',
        'creator': 'Nikita Palande',
        'date': 'Started: 6/23/2026',
        'category': 'Other',
        'imageUrl': 'https://res.cloudinary.com/dhz4my0yx/image/upload/v1782192406/petition-images/e7om6rfbtdhqta90dbmh.jpg',
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: 0.75,
      ),
      itemCount: petitions.length,
      itemBuilder: (context, index) {
        return _buildPetitionCard(context, petitions[index]);
      },
    );
  }

  Widget _buildPetitionCard(BuildContext context, Map<String, dynamic> petition) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with Success Badge
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  petition['imageUrl'],
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 160,
                      color: Colors.grey[200],
                      child: const Center(
                        child: Icon(Icons.image_not_supported, size: 48, color: Colors.grey),
                      ),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: 160,
                      color: Colors.grey[200],
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Success',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    petition['title'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1A1A2E),
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        '${petition['signatures']} signatures',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xff6B7280),
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        '•',
                        style: TextStyle(color: Color(0xff9CA3AF), fontSize: 12),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        petition['country'],
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xff6B7280),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Flexible(
                    child: Text(
                      petition['description'],
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xff6B7280),
                        height: 1.4,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),
                  const Divider(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            petition['creator'],
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff1A1A2E),
                            ),
                          ),
                          const Text(
                            'Change Maker',
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xff6B7280),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        petition['date'],
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xff6B7280),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      petition['category'],
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImpactStats(double maxWidth) {
    bool isSmallScreen = maxWidth < 768;
    
    final stats = [
      {'label': 'Success', 'subtitle': 'Petitions Won', 'color': Colors.green},
      {'label': 'Change', 'subtitle': 'Real World Impact', 'color': Colors.blue},
      {'label': 'Community', 'subtitle': 'People Empowered', 'color': Colors.purple},
      {'label': 'Hope', 'subtitle': 'For the Future', 'color': Colors.orange},
    ];

    if (isSmallScreen) {
      return Column(
        children: stats.map((stat) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: _buildStatCard(stat['label'] as String, stat['subtitle'] as String, stat['color'] as Color),
          );
        }).toList(),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: stats.map((stat) {
          return _buildStatCard(stat['label'] as String, stat['subtitle'] as String, stat['color'] as Color);
        }).toList(),
      );
    }
  }

  Widget _buildStatCard(String label, String subtitle, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xff6B7280),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}