import 'package:flutter/material.dart';
import '../widgets/top_bar.dart';
import '../widgets/sidebar.dart';
import '../widgets/footer_widget.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf0f2f5),
      appBar: const TopBar(),
      drawer: const Sidebar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
        child: Column(
          children: [
            // Header
            const Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1a1a2e),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "We'd love to hear from you! Reach out to us using the contact details below or send us a message.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            
            // Contact Cards - Row 1
            _buildContactRow1(),
            const SizedBox(height: 16),
            
            // Contact Cards - Row 2
            _buildContactRow2(),
            const SizedBox(height: 30),
            
            // Contact Form
            _buildContactForm(),
            const SizedBox(height: 40),
            
            // Footer
            const FooterWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildContactRow1() {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return Row(
            children: [
              Expanded(child: _buildLocationCard()),
              const SizedBox(width: 16),
              Expanded(child: _buildWebsiteCard(context)),
            ],
          );
        } else {
          return Column(
            children: [
              _buildLocationCard(),
              const SizedBox(height: 16),
              _buildWebsiteCard(context),
            ],
          );
        }
      },
    );
  }

  Widget _buildContactRow2() {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return Row(
            children: [
              Expanded(child: _buildPhoneCard(context)),
              const SizedBox(width: 16),
              Expanded(child: _buildEmailCard(context)),
            ],
          );
        } else {
          return Column(
            children: [
              _buildPhoneCard(context),
              const SizedBox(height: 16),
              _buildEmailCard(context),
            ],
          );
        }
      },
    );
  }

  Widget _buildLocationCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
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
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFF3650AD).withOpacity(0.1),
                ),
                child: const Icon(
                  Icons.location_on,
                  color: Color(0xFF3650AD),
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              const Text(
                'Our Location',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1a1a2e),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'NESCO CENTER, GOREGAON EAST\nMumbai, India',
            style: TextStyle(
              color: Color(0xFF4a4a4a),
              fontSize: 16,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWebsiteCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
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
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFFF43676).withOpacity(0.1),
                ),
                child: const Icon(
                  Icons.public,
                  color: Color(0xFFF43676),
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              const Text(
                'Website',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1a1a2e),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Opening: https://sosign.in')),
              );
            },
            child: const Text(
              'SOSIGN.IN',
              style: TextStyle(
                color: Color(0xFF3650AD),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
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
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.green.withOpacity(0.1),
                ),
                child: const Icon(
                  Icons.phone,
                  color: Colors.green,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              const Text(
                'Phone',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1a1a2e),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Calling: +91 9323677688')),
              );
            },
            child: const Text(
              '+91 9323677688',
              style: TextStyle(
                color: Color(0xFF3650AD),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
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
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.amber.withOpacity(0.1),
                ),
                child: const Icon(
                  Icons.email,
                  color: Colors.amber,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1a1a2e),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Email: support@sosign.in')),
              );
            },
            child: const Text(
              'support@sosign.in',
              style: TextStyle(
                color: Color(0xFF3650AD),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactForm() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Send us a Message',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1a1a2e),
            ),
          ),
          const SizedBox(height: 20),
          
          // Name
          _buildTextField('Name', 'Your Name', Icons.person),
          const SizedBox(height: 16),
          
          // Email
          _buildTextField('Email', 'you@example.com', Icons.email, isEmail: true),
          const SizedBox(height: 16),
          
          // Subject
          _buildTextField('Subject', 'Subject of your message', Icons.subject),
          const SizedBox(height: 16),
          
          // Message
          _buildTextField('Message', 'Your message', Icons.message, isMessage: true),
          const SizedBox(height: 24),
          
          // Submit Button
          Builder(
            builder: (context) {
              return Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF3650AD), Color(0xFFF43676)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Message sent successfully!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Send Message',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            }
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hint, IconData icon, 
      {bool isEmail = false, bool isMessage = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF4a4a4a),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: isMessage
              ? TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: hint,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(12),
                    hintStyle: TextStyle(color: Colors.grey[400]),
                  ),
                )
              : TextField(
                  keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
                  decoration: InputDecoration(
                    hintText: hint,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(12),
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    prefixIcon: Icon(icon, color: Colors.grey[400], size: 20),
                  ),
                ),
        ),
      ],
    );
  }
}