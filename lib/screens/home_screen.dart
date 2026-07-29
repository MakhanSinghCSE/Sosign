import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../widgets/top_bar.dart';
import '../widgets/sidebar.dart';
import '../widgets/footer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> sliderImages = [
    "https://res.cloudinary.com/dhz4my0yx/image/upload/v1782130946/petition-images/ixbhndcg6xoyervmpdjy.jpg",
    "https://res.cloudinary.com/dhz4my0yx/image/upload/v1783839175/petition-images/l0darw5viaxnyc4ea2bt.jpg",
    "https://res.cloudinary.com/dhz4my0yx/image/upload/v1783106187/petition-images/cjukihvcuydv6zpqfulm.jpg",
    "https://res.cloudinary.com/dhz4my0yx/image/upload/v1782587024/petition-images/ugnt2ruqlunhj9jdhmg0.jpg",
  ];

  // Top Stories data
  final List<Map<String, dynamic>> topStories = [
    {
      'title': 'Support the National Commission for Men Bill',
      'date': 'July 12, 2026',
      'image': 'https://res.cloudinary.com/dhz4my0yx/image/upload/v1783839175/petition-images/l0darw5viaxnyc4ea2bt.jpg'
    },
    {
      'title': 'Stop the Release of Kala Hiran',
      'date': 'July 4, 2026',
      'image': 'https://res.cloudinary.com/dhz4my0yx/image/upload/v1783106187/petition-images/cjukihvcuydv6zpqfulm.jpg'
    },
    {
      'title': 'Take Immediate Legal Action Against Sarke Chunar',
      'date': 'June 28, 2026',
      'image': 'https://res.cloudinary.com/dhz4my0yx/image/upload/v1782587024/petition-images/ugnt2ruqlunhj9jdhmg0.jpg'
    },
    {
      'title': 'Raghav Chadha Demands Resignation of Bhagwant Mann',
      'date': 'June 27, 2026',
      'image': 'https://res.cloudinary.com/dhz4my0yx/image/upload/v1782564016/petition-images/iafut7bldsvn2ordhcln.png'
    },
  ];

  // Petition data for carousel
  final List<Map<String, dynamic>> petitionSlides = [
    {
      'category': 'Environment',
      'title': 'Stop Illegal Waste Dumping and Improve Garbage Management',
      'description':
          'Illegal dumping of waste and poor garbage management have become serious environmental and public health concerns in many parts of India.',
      'date': 'June 22, 2026',
      'comments': 'Comments',
      'signatures': 1,
      'signers': ['Nikita Palande', 'Varad', 'Riya Mehta'],
      'image':
          'https://res.cloudinary.com/dhz4my0yx/image/upload/v1782130946/petition-images/ixbhndcg6xoyervmpdjy.jpg',
    },
    {
      'category': 'Human Rights',
      'title': 'Support the National Commission for Men Bill',
      'description':
          'We, the citizens of India, write this petition to formally express our profound gratitude to Rajya Sabha MP Dr. Ashok Kumar Mittal for his historic initiative.',
      'date': 'July 12, 2026',
      'comments': 'Comments',
      'signatures': 39,
      'signers': ['Narendra Ram'],
      'image':
          'https://res.cloudinary.com/dhz4my0yx/image/upload/v1783839175/petition-images/l0darw5viaxnyc4ea2bt.jpg',
    },
    {
      'category': 'Politics',
      'title': 'Stop the Release of Kala Hiran: The Battle for Legacy',
      'description':
          'To issue an immediate stay and ban on the production, promotion, and public release of the upcoming film Kala Hiran.',
      'date': 'July 4, 2026',
      'comments': 'Comments',
      'signatures': 87,
      'signers': ['Rohan Choudhury'],
      'image':
          'https://res.cloudinary.com/dhz4my0yx/image/upload/v1783106187/petition-images/cjukihvcuydv6zpqfulm.jpg',
    },
  ];

  // Recent Petitions
  final List<Map<String, dynamic>> recentPetitions = [
    {
      'title': 'Support the National Commission for Men Bill',
      'category': 'Human Rights',
      'categories': ['Human Rights', 'Politics'],
      'date': 'July 12, 2026',
      'signatures': 39,
      'image': 'https://res.cloudinary.com/dhz4my0yx/image/upload/v1783839175/petition-images/l0darw5viaxnyc4ea2bt.jpg',
      'author': 'Narendra Ram',
    },
    {
      'title': 'Stop the Release of Kala Hiran: The Battle for Legacy',
      'category': 'Human Rights',
      'categories': ['Human Rights', 'Politics'],
      'date': 'July 4, 2026',
      'signatures': 87,
      'image': 'https://res.cloudinary.com/dhz4my0yx/image/upload/v1783106187/petition-images/cjukihvcuydv6zpqfulm.jpg',
      'author': 'Rohan Choudhury',
    },
    {
      'title': 'Take Immediate Legal Action Against Sarke Chunar',
      'category': 'General',
      'categories': ['General'],
      'date': 'June 28, 2026',
      'signatures': 138,
      'image': 'https://res.cloudinary.com/dhz4my0yx/image/upload/v1782587024/petition-images/ugnt2ruqlunhj9jdhmg0.jpg',
      'author': 'Meera',
    },
    {
      'title': 'Raghav Chadha Demands Resignation of Bhagwant Mann',
      'category': 'Politics',
      'categories': ['Politics'],
      'date': 'June 27, 2026',
      'signatures': 37,
      'image': 'https://res.cloudinary.com/dhz4my0yx/image/upload/v1782564016/petition-images/iafut7bldsvn2ordhcln.png',
      'author': 'Shubhra',
    },
    {
      'title': 'Demand Resignation of Education Minister Dharmendra Pradhan',
      'category': 'Education',
      'categories': ['Education'],
      'date': 'June 27, 2026',
      'signatures': 97,
      'image': 'https://res.cloudinary.com/dhz4my0yx/image/upload/v1782561755/petition-images/myqqnmgxgmahaj3gr1lc.png',
      'author': 'Kirti',
    },
    {
      'title': 'Ensure Transparency in Online Account Blocking',
      'category': 'Human Rights',
      'categories': ['Human Rights'],
      'date': 'June 23, 2026',
      'signatures': 2,
      'image': 'https://res.cloudinary.com/dhz4my0yx/image/upload/v1782205071/petition-images/vddbdhdq3eo2mbhvv6m1.jpg',
      'author': 'Kirti',
    },
    {
      'title': 'Urgent Repair of Dangerous Pothole-Ridden Roads',
      'category': 'Road',
      'categories': ['Road'],
      'date': 'June 22, 2026',
      'signatures': 1,
      'image': 'https://res.cloudinary.com/dhz4my0yx/image/upload/v1782201617/petition-images/zmrqoa67ucmmstzi5hsn.jpg',
      'author': 'Veda',
    },
    {
      'title': 'Increase ICU Beds and Critical Care Facilities',
      'category': 'Health',
      'categories': ['Health'],
      'date': 'June 22, 2026',
      'signatures': 1,
      'image': 'https://res.cloudinary.com/dhz4my0yx/image/upload/v1782131768/petition-images/agc29qnyodoems52fdd2.jpg',
      'author': 'Aarya',
    },
  ];

  // Categories
  final List<Map<String, dynamic>> categories = [
    {'name': 'Animals', 'count': 1},
    {'name': 'Education', 'count': 3},
    {'name': 'Environment', 'count': 6},
    {'name': 'Health', 'count': 3},
    {'name': 'Human Rights', 'count': 9},
    {'name': 'Politics', 'count': 3},
    {'name': 'Technology', 'count': 3},
    {'name': 'Employment', 'count': 2},
  ];

  // Trending Petitions
  final List<Map<String, dynamic>> trendingPetitions = [
    {
      'title': 'Take Immediate Legal Action Against Sarke Chunar',
      'signatures': 138,
    },
    {
      'title': 'Demand Resignation of Education Minister',
      'signatures': 97,
    },
    {
      'title': 'Stop the Release of Kala Hiran',
      'signatures': 87,
    },
  ];

  // You May Have Missed
  final List<Map<String, dynamic>> missedPetitions = [
    {
      'title': 'Take Immediate Legal Action Against Sarke Chunar',
      'author': 'Meera',
      'date': 'Jun 28',
      'image': 'https://res.cloudinary.com/dhz4my0yx/image/upload/v1782587024/petition-images/ugnt2ruqlunhj9jdhmg0.jpg',
    },
    {
      'title': 'Demand Resignation of Education Minister',
      'author': 'Kirti',
      'date': 'Jun 27',
      'image': 'https://res.cloudinary.com/dhz4my0yx/image/upload/v1782561755/petition-images/myqqnmgxgmahaj3gr1lc.png',
    },
    {
      'title': 'Stop the Release of Kala Hiran',
      'author': 'Rohan Choudhury',
      'date': 'Jul 4',
      'image': 'https://res.cloudinary.com/dhz4my0yx/image/upload/v1783106187/petition-images/cjukihvcuydv6zpqfulm.jpg',
    },
    {
      'title': 'Support the National Commission for Men Bill',
      'author': 'Narendra Ramani',
      'date': 'Jul 12',
      'image': 'https://res.cloudinary.com/dhz4my0yx/image/upload/v1783839175/petition-images/l0darw5viaxnyc4ea2bt.jpg',
    },
  ];

  // Success Stories
  final List<Map<String, dynamic>> successStories = [
    {
      'title': 'Publish the Gauniti Law in the Official Gazette',
      'author': 'Nikita Palande',
      'location': 'India',
      'image': 'https://res.cloudinary.com/dhz4my0yx/image/upload/v1782204612/petition-images/p38lzso6qyzy5gqwi0jy.jpg',
    },
    {
      'title': 'Expand Career Guidance and Counseling Services',
      'author': 'Nikita Palande',
      'location': 'India',
      'image': 'https://res.cloudinary.com/dhz4my0yx/image/upload/v1782192406/petition-images/e7om6rfbtdhqta90dbmh.jpg',
    },
  ];

  bool _isPlaying = true;
  late ScrollController _scrollController;
  bool _isScrolling = false;
  int _currentSlide = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    if (!_isPlaying || _isScrolling) return;

    Future.delayed(const Duration(milliseconds: 500), () {
      if (_isPlaying && _scrollController.hasClients && !_isScrolling) {
        final maxScroll = _scrollController.position.maxScrollExtent;
        if (maxScroll > 0) {
          _isScrolling = true;
          _scrollController
              .animateTo(
                maxScroll,
                duration: const Duration(seconds: 15),
                curve: Curves.linear,
              )
              .then((_) {
                _isScrolling = false;
                if (_isPlaying && _scrollController.hasClients) {
                  _scrollController.jumpTo(0);
                  _startAutoScroll();
                }
              })
              .catchError((e) {
                _isScrolling = false;
              });
        }
      }
    });
  }

  void _togglePlayPause() {
    setState(() {
      _isPlaying = !_isPlaying;
    });

    if (_isPlaying) {
      _isScrolling = false;
      _startAutoScroll();
    } else {
      _isScrolling = true;
      _scrollController.animateTo(
        _scrollController.position.pixels,
        duration: const Duration(milliseconds: 100),
        curve: Curves.linear,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0f2f5),
      appBar: const TopBar(),
      drawer: const Sidebar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top Stories with Marquee Effect
            _buildTopStories(),
            const SizedBox(height: 16),
            // Carousel Slider - Featured Petition
            _buildCarouselSlider(),
            const SizedBox(height: 24),
            // Main Content - Petitions Section
            _buildMainContent(),
            const SizedBox(height: 24),
            // You May Have Missed
            _buildYouMayHaveMissed(),
            const SizedBox(height: 24),
            // Success Stories
            _buildSuccessStories(),
            const SizedBox(height: 20),
            // Footer
            const FooterWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopStories() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;
    final storyWidth = isSmallScreen ? 180.0 : 220.0;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: const BoxDecoration(
              color: Color(0xffF43676),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                const Text(
                  "Top Stories",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 48,
              color: Colors.white,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SingleChildScrollView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                child: Row(
                  children: topStories.asMap().entries.map((entry) {
                    final story = entry.value;
                    return Container(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        children: [
                          Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.grey.shade200,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.network(
                                story['image'],
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey.shade200,
                                    child: const Icon(Icons.image, color: Colors.grey, size: 16),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: storyWidth,
                                child: Text(
                                  story['title'],
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff002050),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 4,
                                    height: 4,
                                    decoration: const BoxDecoration(
                                      color: Color(0xffF43676),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    story['date'],
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: _togglePlayPause,
            child: Container(
              width: 36,
              height: 48,
              decoration: const BoxDecoration(
                color: Color(0xff2D3A8C),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Icon(
                _isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
                size: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselSlider() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final carouselHeight = isMobile ? screenWidth * 0.9 : screenWidth * 0.5;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: carouselHeight,
              autoPlay: true,
              enlargeCenterPage: false,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentSlide = index;
                });
              },
            ),
            items: petitionSlides.map((petition) {
              return _buildPetitionSlide(petition);
            }).toList(),
          ),
          // Dot indicators
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: petitionSlides.asMap().entries.map((entry) {
                return Container(
                  width: entry.key == _currentSlide ? 20 : 6,
                  height: 6,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    color: entry.key == _currentSlide
                        ? const Color(0xffF43676)
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(3),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPetitionSlide(Map<String, dynamic> petition) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      padding: const EdgeInsets.all(12),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Image Section
                Container(
                  height: screenWidth * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: NetworkImage(petition['image']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // Content Section
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffF43676).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          petition['category'],
                          style: const TextStyle(
                            color: Color(0xffF43676),
                            fontWeight: FontWeight.w600,
                            fontSize: 11,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        petition['title'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff002050),
                          height: 1.2,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        petition['description'],
                        style: TextStyle(
                          color: const Color(0xff302d55),
                          fontSize: 13,
                          height: 1.4,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Continue Reading",
                        style: TextStyle(
                          color: const Color(0xff002050),
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Sign this Petition Button
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xffF43676), Color(0xffe02a60)],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 14,
                            ),
                            const SizedBox(width: 6),
                            const Text(
                              "Sign this Petition",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Date and Comments
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            color: Color(0xff302d55),
                            size: 12,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            petition['date'],
                            style: const TextStyle(
                              color: Color(0xff302d55),
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Icon(
                            Icons.comment_outlined,
                            color: Color(0xff302d55),
                            size: 12,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            petition['comments'],
                            style: const TextStyle(
                              color: Color(0xff302d55),
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Live Signatures
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xff002050), Color(0xff1a2b5e)],
                          ),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xffF43676).withOpacity(0.2),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: Colors.green.withOpacity(0.3),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 5,
                                    height: 5,
                                    decoration: const BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  const Text(
                                    "LIVE",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 7,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "${petition['signatures']} Total",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      // Signers
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: [
                          ...petition['signers'].map<Widget>((signer) {
                            return Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Color(0xffF43676), Color(0xff2D3A8C)],
                                ),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xff002050),
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  signer[0],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 9,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                          Text(
                            " signed this petition",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Section
                Expanded(
                  flex: 4,
                  child: Container(
                    height: screenWidth * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: NetworkImage(petition['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                // Content Section
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffF43676).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          petition['category'],
                          style: const TextStyle(
                            color: Color(0xffF43676),
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        petition['title'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff002050),
                          height: 1.2,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        petition['description'],
                        style: TextStyle(
                          color: const Color(0xff302d55),
                          fontSize: 13,
                          height: 1.4,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Continue Reading",
                        style: TextStyle(
                          color: const Color(0xff002050),
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xffF43676), Color(0xffe02a60)],
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 14,
                            ),
                            const SizedBox(width: 6),
                            const Text(
                              "Sign this Petition",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            color: Color(0xff302d55),
                            size: 12,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            petition['date'],
                            style: const TextStyle(
                              color: Color(0xff302d55),
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Icon(
                            Icons.comment_outlined,
                            color: Color(0xff302d55),
                            size: 12,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            petition['comments'],
                            style: const TextStyle(
                              color: Color(0xff302d55),
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xff002050), Color(0xff1a2b5e)],
                          ),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xffF43676).withOpacity(0.2),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: Colors.green.withOpacity(0.3),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 5,
                                    height: 5,
                                    decoration: const BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  const Text(
                                    "LIVE",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 7,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "${petition['signatures']} Total",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: [
                          ...petition['signers'].map<Widget>((signer) {
                            return Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Color(0xffF43676), Color(0xff2D3A8C)],
                                ),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xff002050),
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  signer[0],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 9,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                          Text(
                            " signed this petition",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildMainContent() {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tab Navigation
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffF43676),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xffF43676).withOpacity(0.2),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: const Text(
                      "Petitions",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "Crowdfunding",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff302d55),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Petition Cards
          Column(
            mainAxisSize: MainAxisSize.min,
            children: recentPetitions.map((petition) {
              return _buildPetitionCard(petition);
            }).toList(),
          ),

          const SizedBox(height: 16),

          // Pagination
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: Color(0xffF43676),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    "1",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: const Center(
                  child: Text(
                    "2",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              "Showing 1 - ${recentPetitions.length} of ${recentPetitions.length} petitions",
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPetitionCard(Map<String, dynamic> petition) {
    final isFeatured = petition['title'].contains('National Commission');
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    // Get categories - handle both string and list formats
    List<String> categories = [];
    if (petition['categories'] != null && petition['categories'] is List) {
      categories = List<String>.from(petition['categories']);
    } else if (petition['category'] != null) {
      if (petition['category'] is String && petition['category'].contains(',')) {
        categories = petition['category'].split(',').map((e) => e.trim()).toList();
      } else {
        categories = [petition['category'].toString()];
      }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
        border: isFeatured
            ? Border.all(color: const Color(0xffF43676), width: 2)
            : null,
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Image
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(petition['image']),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      if (isFeatured)
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: const BoxDecoration(
                              color: Color(0xffF43676),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Categories
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: categories.map((cat) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xfffce4ec),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              cat.trim(),
                              style: const TextStyle(
                                color: Color(0xffF43676),
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        petition['title'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff002050),
                          height: 1.2,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://ui-avatars.com/api/?name=${petition['author'].replaceAll(' ', '%20')}&background=random&size=28',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              petition['author'],
                              style: const TextStyle(
                                color: Color(0xff302d55),
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "•",
                            style: TextStyle(color: Colors.grey.shade400),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.calendar_today,
                            size: 10,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            petition['date'].split(',').first,
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xffF43676), Color(0xffe02a60)],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 12,
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              "Sign this Petition",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Image
                  SizedBox(
                    width: screenWidth * 0.2,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      child: Image.network(
                        petition['image'],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade200,
                            child: const Icon(Icons.image, color: Colors.grey),
                          );
                        },
                      ),
                    ),
                  ),
                  // Content
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Categories
                          Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: categories.map((cat) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xfffce4ec),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(
                                  cat.trim(),
                                  style: const TextStyle(
                                    color: Color(0xffF43676),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            petition['title'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff002050),
                              height: 1.2,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://ui-avatars.com/api/?name=${petition['author'].replaceAll(' ', '%20')}&background=random&size=24',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                petition['author'],
                                style: const TextStyle(
                                  color: Color(0xff302d55),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                "•",
                                style: TextStyle(color: Colors.grey.shade400),
                              ),
                              const SizedBox(width: 6),
                              const Icon(
                                Icons.calendar_today,
                                size: 10,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                petition['date'],
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xffF43676), Color(0xffe02a60)],
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 12,
                                ),
                                const SizedBox(width: 4),
                                const Text(
                                  "Sign this Petition",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (isFeatured)
                    Container(
                      width: 4,
                      decoration: const BoxDecoration(
                        color: Color(0xffF43676),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                ],
              ),
            ),
    );
  }

  Widget _buildYouMayHaveMissed() {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth < 400 ? 2 : (screenWidth < 768 ? 2 : 4);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "You May Have Missed",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1a1a2e),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xffF43676),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.9,
            ),
            itemCount: missedPetitions.length,
            itemBuilder: (context, index) {
              final petition = missedPetitions[index];
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  image: DecorationImage(
                    image: NetworkImage(petition['image']),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        gradient: const LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black87,
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            petition['title'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              height: 1.2,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Container(
                                width: 14,
                                height: 14,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://ui-avatars.com/api/?name=${petition['author'].replaceAll(' ', '%20')}&background=random&size=14',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  petition['author'],
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                "•",
                                style: TextStyle(
                                  color: const Color(0xffF43676),
                                  fontSize: 9,
                                ),
                              ),
                              Text(
                                petition['date'],
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 9,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xffF43676), Color(0xffe02a60)],
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 8,
                                ),
                                const SizedBox(width: 3),
                                const Text(
                                  "Sign Petition",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessStories() {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth < 400 ? 1 : (screenWidth < 768 ? 2 : 4);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    "Success Stories",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1a1a2e),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xffF43676),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffF43676),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.9,
            ),
            itemCount: successStories.length,
            itemBuilder: (context, index) {
              final story = successStories[index];
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  image: DecorationImage(
                    image: NetworkImage(story['image']),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        gradient: const LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black87,
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xffF43676), Color(0xffe02a60)],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.emoji_events,
                              color: Colors.yellow,
                              size: 10,
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              "Victory!",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 9,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xfffce4ec),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              "Other",
                              style: TextStyle(
                                color: Color(0xffF43676),
                                fontSize: 9,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            story['title'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              height: 1.2,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Container(
                                width: 14,
                                height: 14,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://ui-avatars.com/api/?name=${story['author'].replaceAll(' ', '%20')}&background=random&size=14',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  story['author'],
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                "•",
                                style: TextStyle(
                                  color: const Color(0xffF43676),
                                  fontSize: 9,
                                ),
                              ),
                              Text(
                                story['location'],
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 9,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}