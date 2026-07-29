import 'package:flutter/material.dart';
import '../widgets/top_bar.dart';
import '../widgets/sidebar.dart';
import '../widgets/footer_widget.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0f2f5),
      appBar: const TopBar(),
      drawer: const Sidebar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Hero Header
            _buildHeroHeader(context),
            const SizedBox(height: 30),
            
            // Main Content Container
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  children: [
                    // Who We Are
                    _buildWhoWeAre(),
                    const SizedBox(height: 30),
                    
                    // What We Do
                    _buildWhatWeDo(),
                    const SizedBox(height: 30),
                    
                    // Why Sosign Matters
                    _buildWhySosignMatters(),
                    const SizedBox(height: 30),
                    
                    // Our Mission
                    _buildOurMission(),
                    const SizedBox(height: 30),
                    
                    // Future Scope
                    _buildFutureScope(),
                    const SizedBox(height: 30),
                    
                    // Join the Change
                    _buildJoinTheChange(),
                    const SizedBox(height: 50),
                    
                    const FooterWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroHeader(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff002050), Color(0xff2D3A8C)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'About Us – Sosign.in',
            style: TextStyle(
              fontSize: isSmallScreen ? 28 : 48,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Sosign.in is a powerful petition and signature-campaign platform built to transform voices into real-world change. We exist with one clear purpose: to create awareness, unite people, and help resolve social issues quickly, transparently, and permanently.',
            style: TextStyle(
              fontSize: isSmallScreen ? 16 : 20,
              color: Colors.white.withOpacity(0.9),
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildWhoWeAre() {
    return _buildCard(
      icon: Icons.people_outline,
      title: 'Who We Are',
      children: [
        Text(
          'Sosign is a new-age digital movement that brings people from across the nation onto one common platform. We believe that every individual\'s opinion matters and that collective voices can influence decisions, policies, and actions.',
          style: _bodyTextStyle(),
        ),
        const SizedBox(height: 16),
        Text(
          'At Sosign, we help citizens use their online identity as a force for good—to start petitions, support causes, and build campaigns that address the social challenges affecting our country today.',
          style: _bodyTextStyle(),
        ),
      ],
    );
  }

  Widget _buildWhatWeDo() {
    return _buildCard(
      icon: Icons.handshake_outlined,
      title: 'What We Do',
      children: [
        Text(
          'We connect:',
          style: _bodyTextStyle(),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: [
            _buildConnectionCard(
              icon: Icons.people_outline,
              label: 'Ordinary citizens who want change',
              iconBgColor: const Color(0xff002050),
            ),
            _buildConnectionCard(
              icon: Icons.favorite_outline,
              label: 'Social workers and NGOs working on the ground',
              iconBgColor: const Color(0xffF43676),
            ),
            _buildConnectionCard(
              icon: Icons.account_balance_outlined,
              label: 'Political leaders and parties who can drive policy and action',
              iconBgColor: const Color(0xff2D3A8C),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'By bringing these stakeholders together, Sosign becomes a bridge between problems, people, and solutions. Our platform enables meaningful discussions, verified signature campaigns, and focused awareness drives that push issues in the right direction.',
          style: _bodyTextStyle(),
        ),
      ],
    );
  }

  Widget _buildWhySosignMatters() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xffF43676), Color(0xffff6b9d)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffF43676).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.lightbulb_outline,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Why Sosign Matters',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Too often, important issues are discussed only in closed circles—with friends, on local street corners, or on social media without impact. Sosign changes that.',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white.withOpacity(0.95),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Instead of just talking about problems, we help you act.',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Sosign gives you the medium to speak up, but you are the real power. Every signature, every shared campaign, and every discussion moves us closer to a better society.',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white.withOpacity(0.95),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOurMission() {
    return _buildCard(
      icon: Icons.flag_outlined,
      title: 'Our Mission',
      children: [
        Text(
          'Our mission is simple yet strong:',
          style: _bodyTextStyle(),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: [
            _buildMissionItem('Create social awareness'),
            _buildMissionItem('Encourage responsible participation'),
            _buildMissionItem('Support campaigns that lead to real solutions'),
            _buildMissionItem('Strengthen democracy through people-driven action'),
          ],
        ),
      ],
    );
  }

  Widget _buildFutureScope() {
    return _buildCard(
      icon: Icons.rocket_launch_outlined,
      title: 'Future Scope of Sosign',
      children: [
        Text(
          'We are building Sosign not just for today, but for the future.',
          style: _bodyTextStyle(),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: [
            _buildFutureItem(
              icon: Icons.phone_android_outlined,
              text: 'Launch of a dedicated Android app to make starting and supporting petitions even easier',
            ),
            _buildFutureItem(
              icon: Icons.public_outlined,
              text: 'Expansion into large-scale national and global campaigns',
            ),
            _buildFutureItem(
              icon: Icons.favorite_outline,
              text: 'Focus on critical issues such as human trafficking, social justice, public welfare, and human rights',
            ),
            _buildFutureItem(
              icon: Icons.trending_up_outlined,
              text: 'Becoming a trusted digital space where voices lead to measurable outcomes',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildJoinTheChange() {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff002050), Color(0xff2D3A8C)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Join the Change',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'We are not just talking about changing the world—we are doing it together.',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white.withOpacity(0.9),
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              _buildActionChip('Join Sosign.in'),
              _buildActionChip('Start a campaign'),
              _buildActionChip('Support a cause'),
              _buildActionChip('Add your signature'),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Because when people unite with purpose, change is not optional—it\'s inevitable.',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Color(0xffF43676),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Helper Widgets
  Widget _buildCard({
    required IconData icon,
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xffF43676).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: const Color(0xffF43676),
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff002050),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...children,
        ],
      ),
    );
  }

  Widget _buildConnectionCard({
    required IconData icon,
    required String label,
    required Color iconBgColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xfff0f2f5),
        borderRadius: BorderRadius.circular(16),
      ),
      width: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xff002050),
              fontWeight: FontWeight.w600,
              fontSize: 14,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildMissionItem(String text) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 350),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xfff0f2f5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              color: Color(0xff002050),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 14,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xff002050),
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFutureItem({
    required IconData icon,
    required String text,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xfff0f2f5),
        borderRadius: BorderRadius.circular(12),
      ),
      constraints: const BoxConstraints(maxWidth: 350),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: Color(0xffF43676),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 16,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xff302d55),
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }

  TextStyle _bodyTextStyle() {
    return const TextStyle(
      fontSize: 18,
      color: Color(0xff302d55),
      height: 1.6,
    );
  }
}