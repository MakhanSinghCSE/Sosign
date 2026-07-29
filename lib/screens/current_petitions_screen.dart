import 'package:flutter/material.dart';
import '../widgets/top_bar.dart';
import '../widgets/sidebar.dart';
import '../widgets/footer_widget.dart';

class CurrentPetitionsScreen extends StatelessWidget {
  const CurrentPetitionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0f2f5),
      appBar: const TopBar(),
      drawer: const Sidebar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            _buildHeader(context),
            const SizedBox(height: 20),
            _buildContent(context),
            const SizedBox(height: 50),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xffFFF0F3),
        border: Border(
          bottom: BorderSide(
            color: const Color(0xffFCD5DF),
            width: 1,
          ),
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isSmallScreen = constraints.maxWidth < 600;
          
          if (isSmallScreen) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Current Petitions',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1a1a2e),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/');
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.grey[600],
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text('Home'),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.chevron_right,
                      size: 16,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Current Petitions',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1a1a2e),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
          
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Current Petitions',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1a1a2e),
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/');
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.grey[600],
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text('Home'),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.chevron_right,
                      size: 16,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Current Petitions',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1a1a2e),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: [
          const Text(
            'Current Petitions',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xff1a1a2e),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Browse and support active petitions making a difference in communities',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 24),
          // Petitions Grid
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 5;
              double childAspectRatio = 0.65;
              double crossAxisSpacing = 16;
              double mainAxisSpacing = 16;
              
              if (constraints.maxWidth < 480) {
                crossAxisCount = 1;
                childAspectRatio = 0.7;
              } else if (constraints.maxWidth < 768) {
                crossAxisCount = 2;
                childAspectRatio = 0.7;
              } else if (constraints.maxWidth < 992) {
                crossAxisCount = 3;
                childAspectRatio = 0.7;
              } else if (constraints.maxWidth < 1200) {
                crossAxisCount = 4;
                childAspectRatio = 0.7;
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: crossAxisSpacing,
                  mainAxisSpacing: mainAxisSpacing,
                  childAspectRatio: childAspectRatio,
                ),
                itemCount: petitions.length,
                itemBuilder: (context, index) {
                  final petition = petitions[index];
                  return _buildPetitionCard(petition, context);
                },
              );
            },
          ),
          const SizedBox(height: 24),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffF43676),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              child: const Text('Load More Petitions'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPetitionCard(PetitionModel petition, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to petition detail
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: const Color(0xffFCD5DF),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image Section
            Expanded(
              flex: 5,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      color: const Color(0xffFFF0F3),
                      child: petition.imageUrl != null
                          ? Image.network(
                              petition.imageUrl!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return const Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        const Color(0xffFFF0F3),
                                        Colors.grey.shade100,
                                      ],
                                    ),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.image,
                                      size: 40,
                                      color: Colors.grey,
                                    ),
                                  ),
                                );
                              },
                            )
                          : Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    const Color(0xffFFF0F3),
                                    Colors.grey.shade100,
                                  ],
                                ),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.image,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                    ),
                    // Signature Badge
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xffF43676),
                              Color(0xffe02a60),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.edit,
                              size: 10,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              petition.signatures.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Content Section
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        petition.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade700,
                          height: 1.3,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      petition.author,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1a1a2e),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      petition.authorType,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.location_pin,
                          size: 10,
                          color: Color(0xffF43676),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          petition.location,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Color(0xffF43676),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PetitionModel {
  final String id;
  final String title;
  final String description;
  final String author;
  final String authorType;
  final String location;
  final int signatures;
  final String? imageUrl;

  PetitionModel({
    required this.id,
    required this.title,
    required this.description,
    required this.author,
    required this.authorType,
    required this.location,
    required this.signatures,
    this.imageUrl,
  });
}

final List<PetitionModel> petitions = [
  PetitionModel(
    id: '1',
    title: 'Support the National Commission for Men Bill: A Step Toward Gender-Neutral Justice',
    description: '"We, the citizens of India, write this petition to formally express our profound gratitude to Rajya S"',
    author: 'Narendra Ramani',
    authorType: 'Citizen',
    location: 'India',
    signatures: 39,
    imageUrl: 'https://res.cloudinary.com/dhz4my0yx/image/upload/v1783839175/petition-images/l0darw5viaxnyc4ea2bt.jpg',
  ),
  PetitionModel(
    id: '2',
    title: 'Stop the Release of Kala Hiran: The Battle for Legacy',
    description: '"To issue an immediate stay and ban on the production, promotion, and public release of the upcoming "',
    author: 'Rohan Choudhury',
    authorType: 'Supporter',
    location: 'India',
    signatures: 87,
    imageUrl: 'https://res.cloudinary.com/dhz4my0yx/image/upload/v1783106187/petition-images/cjukihvcuydv6zpqfulm.jpg',
  ),
  PetitionModel(
    id: '3',
    title: 'Take Immediate Legal Action Against the Makers, Cast, and Certifying Bodies of the Song "Sarke Chunar Teri Sarke"',
    description: '"Demand for comprehensive legal prosecution, permanent blacklisting, and systemic accountability rega"',
    author: 'Meera',
    authorType: 'Citizen',
    location: 'India',
    signatures: 138,
    imageUrl: 'https://res.cloudinary.com/dhz4my0yx/image/upload/v1782587024/petition-images/ugnt2ruqlunhj9jdhmg0.jpg',
  ),
  PetitionModel(
    id: '4',
    title: 'Raghav Chadha Demands Demand the Immediate Resignation of Bhagwant Mann as CM of Punjab for Sacrilege and Deception',
    description: '"To the Proud People of Punjab, Esteemed Leaders, and the Global Sikh Sangat,We are writing this peti"',
    author: 'Shubhra',
    authorType: 'Citizen',
    location: 'India',
    signatures: 37,
    imageUrl: 'https://res.cloudinary.com/dhz4my0yx/image/upload/v1782564016/petition-images/iafut7bldsvn2ordhcln.png',
  ),
  PetitionModel(
    id: '5',
    title: 'Demand the Resignation of Education Minister Dharmendra Pradhan: Sign the Petition for NEET Exam Reform and Student Justice',
    description: '"Hold Leadership Accountable for India\'s Examination Crisis\n\nMillions of students across India dedica"',
    author: 'Kirti',
    authorType: 'Citizen',
    location: 'India',
    signatures: 97,
    imageUrl: 'https://res.cloudinary.com/dhz4my0yx/image/upload/v1782561755/petition-images/myqqnmgxgmahaj3gr1lc.png',
  ),
];