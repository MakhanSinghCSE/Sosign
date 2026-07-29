import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    int crossAxisCount = 1;

    if (width >= 1200) {
      crossAxisCount = 4;
    } else if (width >= 800) {
      crossAxisCount = 2;
    }

    return Container(
  color: const Color(0xff302D55),
  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
  child: LayoutBuilder(
    builder: (context, constraints) {
      final isDesktop = constraints.maxWidth >= 1200;
      final isTablet = constraints.maxWidth >= 800;

      double sectionWidth;

      if (isDesktop) {
        sectionWidth = (constraints.maxWidth - 90) / 4;
      } else if (isTablet) {
        sectionWidth = (constraints.maxWidth - 30) / 2;
      } else {
        sectionWidth = constraints.maxWidth;
      }

      return Wrap(
        spacing: 30,
        runSpacing: 30,
        children: [
          /// ABOUT
          SizedBox(
            width: sectionWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "About Sosign",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Sosign is a platform dedicated to empowering voices and creating meaningful change through petitions and campaigns that matter to communities worldwide.",
                  style: TextStyle(
                    color: Colors.white70,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    socialButton("Facebook", const Color(0xff3b5998), () {}),
                    socialButton("X", Colors.black, () {}),
                    socialButton("Telegram", const Color(0xff0088cc), () {}),
                    socialButton("Instagram", const Color(0xffE4405F), () {}),
                    socialButton("LinkedIn", const Color(0xff0077B5), () {}),
                    socialButton("YouTube", Colors.red, () {}),
                    socialButton("Pinterest", const Color(0xffE60023), () {}),
                  ],
                ),
              ],
            ),
          ),

          /// Categories
          SizedBox(
            width: sectionWidth,
            child: footerList(
              title: "Categories",
              items: const [
                "Animals",
                "Environment",
                "Education",
                "Health",
                "Politics",
                "Human Rights",
                "Technology",
              ],
            ),
          ),

          /// Quick Links
          SizedBox(
            width: sectionWidth,
            child: footerList(
              title: "Quick Links",
              items: const [
                "About Us",
                "Current Petitions",
                "Success Stories",
                "Start a Petition",
                "Blog",
                "FAQs",
                "Contact",
                "Privacy Policy",
                "Terms & Conditions",
              ],
            ),
          ),

          /// Latest Petitions
          SizedBox(
            width: sectionWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Latest Petitions",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),

                petitionCard(
                  image:
                      "https://res.cloudinary.com/dhz4my0yx/image/upload/v1783839175/petition-images/l0darw5viaxnyc4ea2bt.jpg",
                  title:
                      "Support the National Commission for Men Bill: A Step Toward Gender-Neutral Justice",
                  signatures: "39 signatures",
                  date: "Jul 12, 2026",
                ),

                const SizedBox(height: 15),

                petitionCard(
                  image:
                      "https://res.cloudinary.com/dhz4my0yx/image/upload/v1783106187/petition-images/cjukihvcuydv6zpqfulm.jpg",
                  title:
                      "Stop the Release of Kala Hiran: The Battle for Legacy",
                  signatures: "87 signatures",
                  date: "Jul 4, 2026",
                ),

                const SizedBox(height: 15),

                petitionCard(
                  image:
                      "https://res.cloudinary.com/dhz4my0yx/image/upload/v1782587024/petition-images/ugnt2ruqlunhj9jdhmg0.jpg",
                  title:
                      'Take Immediate Legal Action Against the Makers of "Sarke Chunar Teri Sarke"',
                  signatures: "138 signatures",
                  date: "Jun 28, 2026",
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

  static Widget socialButton(String title, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  static Widget footerList({
    required String title,
    required List<String> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 15),

        ...items.map(
          (e) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 3,
                  backgroundColor: Color(0xffF43676),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(e, style: const TextStyle(color: Colors.white70)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  static Widget petitionCard({
    required String image,
    required String title,
    required String signatures,
    required String date,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(image, width: 70, height: 70, fit: BoxFit.cover),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                signatures,
                style: const TextStyle(color: Colors.white60, fontSize: 12),
              ),

              const SizedBox(height: 3),

              Text(
                date,
                style: const TextStyle(color: Colors.white38, fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
