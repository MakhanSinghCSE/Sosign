import 'package:flutter/material.dart';
import '../widgets/top_bar.dart';
import '../widgets/sidebar.dart';
import '../widgets/footer_widget.dart';

class MyPetitionsScreen extends StatefulWidget {
  const MyPetitionsScreen({super.key});

  @override
  State<MyPetitionsScreen> createState() => _MyPetitionsScreenState();
}

class _MyPetitionsScreenState extends State<MyPetitionsScreen> {
  int _createdCount = 0;
  int _signedCount = 1;
  int _totalSignatures = 0;
  int _approvedCount = 0;
  String _activeTab = 'my_petitions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0f2f5),
      appBar: const TopBar(),
      drawer: const Sidebar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildStatsGrid(),
            _buildContent(),
            const SizedBox(height: 50),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 32,
        vertical: 48,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xff1a1a2e),
            Color(0xff2D3A8C),
            Color(0xff1a1a2e),
          ],
        ),
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1280),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Petitions",
                        style: TextStyle(
                          fontSize: isMobile ? 24 : 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Manage your campaigns and track your impact",
                        style: TextStyle(
                          fontSize: isMobile ? 14 : 16,
                          color: const Color(0xffD1D5DB),
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildBreadcrumb(),
                    ],
                  ),
                ),
                if (!isMobile) _buildCreateButton(),
              ],
            ),
            if (isMobile) ...[
              const SizedBox(height: 16),
              _buildCreateButton(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildBreadcrumb() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Home",
            style: TextStyle(
              color: Color(0xff9CA3AF),
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(width: 8),
        const Icon(
          Icons.chevron_right,
          color: Color(0xff9CA3AF),
          size: 14,
        ),
        const SizedBox(width: 8),
        const Text(
          "My Petitions",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildCreateButton() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xffF43676),
            Color(0xffe02a60),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/start-petition');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 24,
            vertical: 12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.add, size: 20),
            const SizedBox(width: 8),
            Text(
              isMobile ? "Create" : "Create New Petition",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsGrid() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 640;

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1280),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.count(
          crossAxisCount: isMobile ? 2 : 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: isMobile ? 1.2 : 1.4,
          children: [
            _buildStatCard(
              icon: Icons.edit,
              iconColor: const Color(0xffF43676),
              bgColor: const Color(0xffF43676).withOpacity(0.1),
              count: _createdCount,
              label: "Created",
              borderColor: const Color(0xffF43676).withOpacity(0.2),
            ),
            _buildStatCard(
              icon: Icons.assignment_outlined,
              iconColor: Colors.blue,
              bgColor: Colors.blue.withOpacity(0.1),
              count: _signedCount,
              label: "Signed",
              borderColor: Colors.blue.withOpacity(0.2),
            ),
            _buildStatCard(
              icon: Icons.people_outline,
              iconColor: Colors.green,
              bgColor: Colors.green.withOpacity(0.1),
              count: _totalSignatures,
              label: "Total Signatures",
              borderColor: Colors.green.withOpacity(0.2),
              isClickable: true,
            ),
            _buildStatCard(
              icon: Icons.verified_outlined,
              iconColor: Colors.amber,
              bgColor: Colors.amber.withOpacity(0.1),
              count: _approvedCount,
              label: "Approved",
              borderColor: Colors.amber.withOpacity(0.2),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
    required int count,
    required String label,
    required Color borderColor,
    bool isClickable = false,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmall = screenWidth < 400;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            bgColor.withOpacity(0.3),
            Colors.white,
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 1),
      ),
      padding: const EdgeInsets.all(12),
      child: InkWell(
        onTap: isClickable ? () {
          // Handle tap
        } : null,
        borderRadius: BorderRadius.circular(12),
        child: Row(
          children: [
            Container(
              width: isSmall ? 32 : 40,
              height: isSmall ? 32 : 40,
              decoration: BoxDecoration(
                color: bgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: isSmall ? 16 : 20,
              ),
            ),
            SizedBox(width: isSmall ? 8 : 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    count.toString(),
                    style: TextStyle(
                      fontSize: isSmall ? 16 : 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff1a1a2e),
                    ),
                  ),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: isSmall ? 10 : 12,
                      color: const Color(0xff6B7280),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1280),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTabButtons(),
            const SizedBox(height: 24),
            _buildPetitionsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButtons() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmall = screenWidth < 400;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildTabButton(
            icon: Icons.edit,
            label: isSmall ? "My Petitions" : "My Petitions (0)",
            isActive: _activeTab == 'my_petitions',
            onTap: () {
              setState(() {
                _activeTab = 'my_petitions';
              });
            },
          ),
          const SizedBox(width: 8),
          _buildTabButton(
            icon: Icons.assignment_outlined,
            label: isSmall ? "Signed" : "Petitions I Signed (1)",
            isActive: _activeTab == 'signed',
            onTap: () {
              setState(() {
                _activeTab = 'signed';
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton({
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? null : Colors.white,
          gradient: isActive
              ? const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xffF43676),
                    Color(0xffe02a60),
                  ],
                )
              : null,
          borderRadius: BorderRadius.circular(12),
          border: isActive ? null : Border.all(color: const Color(0xffE5E7EB)),
          boxShadow: isActive
              ? const [
                  BoxShadow(
                    color: Color(0xffF43676),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive ? Colors.white : const Color(0xff6B7280),
              size: 16,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.white : const Color(0xff6B7280),
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPetitionsList() {
    if (_activeTab == 'my_petitions') {
      return _buildEmptyState();
    } else {
      return _buildSignedPetitions();
    }
  }

  Widget _buildEmptyState() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmall = screenWidth < 400;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isSmall ? 24 : 48),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: isSmall ? 60 : 80,
            height: isSmall ? 60 : 80,
            decoration: BoxDecoration(
              color: const Color(0xffF43676).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.edit,
              color: const Color(0xffF43676),
              size: isSmall ? 30 : 40,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "No Petitions Yet",
            style: TextStyle(
              fontSize: isSmall ? 18 : 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xff374151),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Start making a difference today!",
            style: TextStyle(
              fontSize: isSmall ? 14 : 16,
              color: const Color(0xff6B7280),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xffF43676),
                  Color(0xffe02a60),
                ],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/start-petition');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                shadowColor: Colors.transparent,
                padding: EdgeInsets.symmetric(
                  horizontal: isSmall ? 16 : 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                isSmall ? "Create First Petition" : "Create Your First Petition",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignedPetitions() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmall = screenWidth < 400;

    return Container(
      padding: EdgeInsets.all(isSmall ? 16 : 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xffF43676).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.pending_actions,
                color: Color(0xffF43676),
              ),
            ),
            title: const Text(
              "Sample Petition",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: const Text(
              "Signed on Jan 15, 2024",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff6B7280),
              ),
            ),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "Active",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}