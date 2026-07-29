import 'package:flutter/material.dart';
import '../widgets/top_bar.dart';
import '../widgets/sidebar.dart';
import '../widgets/footer_widget.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    return Scaffold(
      backgroundColor: const Color(0xfff0f2f5),
      appBar: const TopBar(),
      drawer: const Sidebar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 48),
            _buildHeader(context),
            const SizedBox(height: 40),
            _buildSearchBar(context),
            const SizedBox(height: 40),
            _buildPetitionList(context),
            const SizedBox(height: 40),
            _buildPagination(context),
            const SizedBox(height: 50),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }

  // Header Section
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1024),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width < 768 ? 24 : 48,
          vertical: MediaQuery.of(context).size.width < 768 ? 32 : 48,
        ),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffF43676),
              Color(0xffFF5722),
              Color(0xffFF9800),
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
            // Animated background effect
            Positioned(
              right: -50,
              top: -50,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Colors.white.withOpacity(0.15),
                      Colors.white.withOpacity(0),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                // Hot & Active Badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.local_fire_department,
                        color: const Color(0xffffc107),
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Hot & Active',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Title
                Text(
                  'Trending Petitions',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width < 768 ? 28 : 48,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                // Subtitle
                Container(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Text(
                    'See what campaigns are driving the most action across the country. Add your signature to make these voices impossible to ignore!',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width < 768 ? 14 : 16,
                      color: Colors.white.withOpacity(0.9),
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Search Bar
  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 600),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Filter trending petitions...',
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey[400],
              size: 20,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Color(0xffe0e0e0),
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: Colors.grey[200]!,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Color(0xffF43676),
                width: 2,
              ),
            ),
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  // Petition List
  Widget _buildPetitionList(BuildContext context) {
    final petitions = _getPetitionData();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1024),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: petitions.map((petition) {
            return _buildPetitionCard(context, petition);
          }).toList(),
        ),
      ),
    );
  }

  // Individual Petition Card
  Widget _buildPetitionCard(BuildContext context, PetitionData petition) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final rankColor = _getRankColor(petition.rank);

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xfff0f0f0),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallScreen = constraints.maxWidth < 600;
          return isSmallScreen
              ? _buildMobilePetitionCard(context, petition, rankColor)
              : _buildDesktopPetitionCard(context, petition, rankColor);
        },
      ),
    );
  }

  // Desktop Petition Card
  Widget _buildDesktopPetitionCard(
      BuildContext context, PetitionData petition, Color rankColor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Rank Badge
        _buildRankBadge(petition.rank, rankColor),
        const SizedBox(width: 16),
        // Image
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            petition.imageUrl,
            width: 180,
            height: 135,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 20),
        // Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tags
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: petition.tags.map((tag) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xfffff0f2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(
                        color: Color(0xffF43676),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              // Title
              Text(
                petition.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff002050),
                  height: 1.3,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              // Description
              Text(
                petition.description,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[500],
                  height: 1.5,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              // Author & Date
              Row(
                children: [
                  Text(
                    'By ${petition.author}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '•',
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.calendar_today,
                    size: 12,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(width: 4),
                  Text(
                    petition.date,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Progress and Button
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${petition.signed} signed',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff757575),
                              ),
                            ),
                            Text(
                              'Target ${petition.target}',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff757575),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: petition.signed / petition.target,
                            backgroundColor: const Color(0xfff5f5f5),
                            color: const Color(0xffF43676),
                            minHeight: 8,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Sign Button
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xffF43676), Color(0xffe02a60)],
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          'Sign Petition',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Mobile Petition Card
  Widget _buildMobilePetitionCard(
      BuildContext context, PetitionData petition, Color rankColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Rank Badge
        _buildRankBadge(petition.rank, rankColor),
        const SizedBox(height: 12),
        // Image
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            petition.imageUrl,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 16),
        // Tags
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: petition.tags.map((tag) {
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: const Color(0xfffff0f2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                tag,
                style: const TextStyle(
                  color: Color(0xffF43676),
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        // Title
        Text(
          petition.title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff002050),
            height: 1.3,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        // Description
        Text(
          petition.description,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[500],
            height: 1.5,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 12),
        // Author & Date
        Row(
          children: [
            Text(
              'By ${petition.author}',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '•',
              style: TextStyle(color: Colors.grey[400]),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.calendar_today,
              size: 12,
              color: Colors.grey[400],
            ),
            const SizedBox(width: 4),
            Text(
              petition.date,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Progress
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${petition.signed} signed',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff757575),
                  ),
                ),
                Text(
                  'Target ${petition.target}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff757575),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: petition.signed / petition.target,
                backgroundColor: const Color(0xfff5f5f5),
                color: const Color(0xffF43676),
                minHeight: 8,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Sign Button
        Center(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xffF43676), Color(0xffe02a60)],
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 16,
                ),
                const SizedBox(width: 6),
                const Text(
                  'Sign Petition',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Rank Badge
  Widget _buildRankBadge(int rank, Color rankColor) {
    IconData icon;
    if (rank <= 3) {
      icon = Icons.emoji_events;
    } else {
      icon = Icons.tag;
    }

    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: rankColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: rankColor.withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: rankColor.withOpacity(0.2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Center(
        child: rank <= 3
            ? Icon(
                icon,
                color: Colors.white,
                size: 14,
              )
            : Text(
                '#$rank',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: _getTextColor(rankColor),
                ),
              ),
      ),
    );
  }

  // Pagination
  Widget _buildPagination(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1024),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Previous button (disabled)
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xfff5f5f5),
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xfff0f0f0),
                  width: 1,
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 14,
                  color: Color(0xffbdbdbd),
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Page 1 (active)
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xffF43676),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xffF43676).withOpacity(0.3),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  '1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Page 2
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xffe0e0e0),
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  '2',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Page 3
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xffe0e0e0),
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  '3',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Page 4
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xffe0e0e0),
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  '4',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Next button
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xffe0e0e0),
                  width: 1,
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Color(0xff757575),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper methods
  Color _getRankColor(int rank) {
    switch (rank) {
      case 1:
        return const Color(0xffffc107);
      case 2:
        return const Color(0xff9e9e9e);
      case 3:
        return const Color(0xffff9800);
      default:
        return const Color(0xffe0e0e0);
    }
  }

  Color _getTextColor(Color color) {
    return color.computeLuminance() > 0.5
        ? const Color(0xff424242)
        : Colors.white;
  }

  // Petition Data
  List<PetitionData> _getPetitionData() {
    return [
      PetitionData(
        rank: 1,
        title:
            'Take Immediate Legal Action Against the Makers, Cast, and Certifying Bodies of the Song "Sarke Chunar Teri Sarke"',
        description:
            'Demand for comprehensive legal prosecution, permanent blacklisting, and systemic accountability regarding the highly obscene and vulgar song "Sarke Chunar Teri Sarke". We, the citizens of India, write this petition to demand stringent, non-negotiable legal action against all active entities responsible for the conceptualisation, execution, and public exhibition of the song...',
        author: 'Meera',
        date: 'June 28, 2026',
        signed: 138,
        target: 1000,
        tags: ['General'],
        imageUrl:
            'https://res.cloudinary.com/dhz4my0yx/image/upload/v1782587024/petition-images/ugnt2ruqlunhj9jdhmg0.jpg',
      ),
      PetitionData(
        rank: 2,
        title:
            'Demand the Resignation of Education Minister Dharmendra Pradhan: Sign the Petition for NEET Exam Reform and Student Justice',
        description:
            'Hold Leadership Accountable for India\'s Examination Crisis. Millions of students across India dedicate years of hard work, sacrifice, and determination to prepare for competitive exams like NEET, JEE, UGC NET, and other government entrance examinations...',
        author: 'Kirti',
        date: 'June 27, 2026',
        signed: 97,
        target: 10000,
        tags: ['Education'],
        imageUrl:
            'https://res.cloudinary.com/dhz4my0yx/image/upload/v1782561755/petition-images/myqqnmgxgmahaj3gr1lc.png',
      ),
      PetitionData(
        rank: 3,
        title: 'Stop the Release of Kala Hiran: The Battle for Legacy',
        description:
          'To issue an immediate stay and ban on the production, promotion, and public release of the upcoming film Kala Hiran: The Battle for Legacy. This film exploits ongoing sub-judice legal matters, infringes upon legally protected personality rights...',
        author: 'Rohan Choudhury',
        date: 'July 4, 2026',
        signed: 87,
        target: 1000,
        tags: ['Human Rights', 'Politics'],
        imageUrl:
            'https://res.cloudinary.com/dhz4my0yx/image/upload/v1783106187/petition-images/cjukihvcuydv6zpqfulm.jpg',
      ),
      PetitionData(
        rank: 4,
        title:
            'Support the National Commission for Men Bill: A Step Toward Gender-Neutral Justice',
        description:
          'We, the citizens of India, write this petition to formally express our profound gratitude to Rajya Sabha MP Dr. Ashok Kumar Mittal for his historic and courageous initiative in introducing the National Commission for Men Bill...',
        author: 'Narendra Ram',
        date: 'July 12, 2026',
        signed: 39,
        target: 1000,
        tags: ['Human Rights', 'Politics'],
        imageUrl:
            'https://res.cloudinary.com/dhz4my0yx/image/upload/v1783839175/petition-images/l0darw5viaxnyc4ea2bt.jpg',
      ),
      PetitionData(
        rank: 5,
        title:
            'Raghav Chadha Demands Demand the Immediate Resignation of Bhagwant Mann as CM of Punjab for Sacrilege and Deception',
        description:
          'To the Proud People of Punjab, Esteemed Leaders, and the Global Sikh Sangat,We are writing this petition at a critical crossroads for the state of Punjab. A sacred line has been crossed, demanding collective outrage, action, and accountability...',
        author: 'Shubhra',
        date: 'June 27, 2026',
        signed: 37,
        target: 1000,
        tags: ['Politics'],
        imageUrl:
            'https://res.cloudinary.com/dhz4my0yx/image/upload/v1782564016/petition-images/iafut7bldsvn2ordhcln.png',
      ),
      PetitionData(
        rank: 6,
        title: 'Address Regional Water Shortages and Improve Water Management',
        description:
          'Many regions across India face water-related challenges such as shortages of drinking water, declining groundwater levels, unequal water distribution, drought conditions, and inadequate water infrastructure...',
        author: 'Pooja',
        date: 'June 22, 2026',
        signed: 2,
        target: 1000,
        tags: ['Environment'],
        imageUrl:
            'https://res.cloudinary.com/dhz4my0yx/image/upload/v1782123002/petition-images/htrcobhdcsvrqsdcyqsj.jpg',
      ),
      PetitionData(
        rank: 7,
        title:
            'Request to Vacate and Restore Alwar Kisan Bhavan for Farmers\' Use',
        description:
          'Alwar Kisan Bhavan was established to support farmers by providing a dedicated venue for agricultural meetings, training programs, awareness campaigns, and community activities...',
        author: 'Rajeev Haldar',
        date: 'June 23, 2026',
        signed: 2,
        target: 1000,
        tags: ['Human Rights'],
        imageUrl:
            'https://res.cloudinary.com/dhz4my0yx/image/upload/v1782200919/petition-images/abgzgmktlfug0i7nqm5j.jpg',
      ),
      PetitionData(
        rank: 8,
        title:
            'Ensure Transparency in Online Account Blocking and Protect Digital Rights',
        description:
          'Concerns have been raised regarding the blocking and restriction of several social media accounts and online platforms in India. Many citizens, journalists, content creators, and civil society groups believe that the lack of clear public explanations...',
        author: 'Kirti',
        date: 'June 23, 2026',
        signed: 2,
        target: 1000,
        tags: ['Human Rights'],
        imageUrl:
            'https://res.cloudinary.com/dhz4my0yx/image/upload/v1782205071/petition-images/vddbdhdq3eo2mbhvv6m1.jpg',
      ),
      PetitionData(
        rank: 9,
        title:
            'Speed Up Government Recruitment Processes and Fill Vacant Posts',
        description:
          'Millions of job seekers across the country are facing significant hardships due to delays in government recruitment processes. Many government departments have thousands of vacant positions that remain unfilled for years...',
        author: 'Veda',
        date: 'June 22, 2026',
        signed: 2,
        target: 1000,
        tags: ['Employment'],
        imageUrl:
            'https://res.cloudinary.com/dhz4my0yx/image/upload/v1782113630/petition-images/jv5d1xumd75oauvmymtv.png',
      ),
      PetitionData(
        rank: 10,
        title:
            'Improve Railway Passenger Safety and Infrastructure Across India',
        description:
          'Millions of people rely on India\'s railway network for daily travel, but concerns regarding passenger safety and railway infrastructure continue to exist...',
        author: 'Sakhi',
        date: 'June 22, 2026',
        signed: 2,
        target: 1000,
        tags: ['Human Rights'],
        imageUrl:
            'https://res.cloudinary.com/dhz4my0yx/image/upload/v1782122049/petition-images/wxvptbauwpztvo0muxqq.jpg',
      ),
    ];
  }
}

// Petition Data Model
class PetitionData {
  final int rank;
  final String title;
  final String description;
  final String author;
  final String date;
  final int signed;
  final int target;
  final List<String> tags;
  final String imageUrl;

  PetitionData({
    required this.rank,
    required this.title,
    required this.description,
    required this.author,
    required this.date,
    required this.signed,
    required this.target,
    required this.tags,
    required this.imageUrl,
  });
}