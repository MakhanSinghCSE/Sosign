import 'package:flutter/material.dart';
import '../widgets/top_bar.dart';
import '../widgets/sidebar.dart';
import '../widgets/footer_widget.dart';

class StartCrowdfundingScreen extends StatefulWidget {
  const StartCrowdfundingScreen({super.key});

  @override
  State<StartCrowdfundingScreen> createState() => _StartCrowdfundingScreenState();
}

class _StartCrowdfundingScreenState extends State<StartCrowdfundingScreen> {
  // Form controllers
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _goalController = TextEditingController();
  final TextEditingController _deadlineController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _storyController = TextEditingController();

  // Selected category
  String _selectedCategory = 'Medical';

  // Current step
  int _currentStep = 0;

  // Form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Step titles
  final List<String> _stepTitles = ['Basic Info', 'Identity', 'Medical', 'Bank', 'Finalize'];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Scaffold(
      backgroundColor: const Color(0xfff8fafc),
      appBar: isMobile ? const TopBar() : null,
      drawer: isMobile ? const Sidebar() : null,
      body: Container(
        width: double.infinity,
        color: const Color(0xfff8fafc),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Top bar for desktop
                if (!isMobile) const TopBar(),

                // Header Section
                _buildHeaderSection(),

                // Steps Progress
                _buildStepsProgress(isMobile),

                // Main Form
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 1000),
                      child: _buildForm(isMobile),
                    ),
                  ),
                ),

                // Footer
                const FooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Color(0xffe2e8f0), width: 1),
        ),
      ),
      child: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Start Fundraising',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1e293b),
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Fill in the details to launch your campaign',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff64748b),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepsProgress(bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 16, vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Color(0xffe2e8f0), width: 1),
        ),
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(5, (index) {
                final isActive = index == _currentStep;
                final isCompleted = index < _currentStep;

                return Row(
                  children: [
                    // Step circle
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isActive
                            ? const Color(0xffF43676)
                            : isCompleted
                                ? const Color(0xffF43676)
                                : const Color(0xffe2e8f0),
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: isActive || isCompleted
                                ? Colors.white
                                : const Color(0xff64748b),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Step label
                    Text(
                      _stepTitles[index],
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: isActive
                            ? const Color(0xff1e293b)
                            : isCompleted
                                ? const Color(0xff1e293b)
                                : const Color(0xff94a3b8),
                      ),
                    ),
                    if (index < 4) ...[
                      const SizedBox(width: 8),
                      Container(
                        width: isMobile ? 8 : 16,
                        height: 1,
                        color: isCompleted
                            ? const Color(0xffF43676)
                            : const Color(0xffe2e8f0),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm(bool isMobile) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(color: const Color(0xfff1f5f9)),
      ),
      padding: EdgeInsets.all(isMobile ? 16 : 32),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Form content based on current step
            _buildStepContent(isMobile),

            const SizedBox(height: 32),

            // Action buttons
            Row(
              children: [
                // Cancel button
                Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {
                      // Navigate back
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff64748b),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Next/Submit button
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentStep == 4) {
                        // Submit form
                        if (_formKey.currentState?.validate() ?? false) {
                          // Process submission
                        }
                      } else {
                        setState(() {
                          if (_currentStep < 4) _currentStep++;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffF43676),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      shadowColor: const Color(0xffF43676).withOpacity(0.3),
                    ),
                    child: Text(
                      _currentStep == 4 ? 'Submit' : 'Next Step',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepContent(bool isMobile) {
    switch (_currentStep) {
      case 0:
        return _buildBasicInfoStep(isMobile);
      case 1:
        return _buildIdentityStep();
      case 2:
        return _buildMedicalStep();
      case 3:
        return _buildBankStep();
      case 4:
        return _buildFinalizeStep();
      default:
        return const SizedBox();
    }
  }

  Widget _buildBasicInfoStep(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Basic Information',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xff1e293b),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Provide the essential details about your campaign',
          style: TextStyle(color: Color(0xff64748b)),
        ),
        const SizedBox(height: 24),

        // Campaign Title
        const Text(
          'Campaign Title',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xff1e293b),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _titleController,
          decoration: InputDecoration(
            hintText: "e.g., Support Rajesh's Cancer Treatment",
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xffe2e8f0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xffe2e8f0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xffF43676), width: 2),
            ),
          ),
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Please enter a campaign title';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),

        // Goal Amount and Deadline (Row)
        if (!isMobile)
          Row(
            children: [
              Expanded(
                child: _buildGoalField(),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildDeadlineField(),
              ),
            ],
          )
        else ...[
          _buildGoalField(),
          const SizedBox(height: 20),
          _buildDeadlineField(),
        ],
        const SizedBox(height: 20),

        // Category and Location (Row)
        if (!isMobile)
          Row(
            children: [
              Expanded(
                child: _buildCategoryDropdown(),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildLocationField(),
              ),
            ],
          )
        else ...[
          _buildCategoryDropdown(),
          const SizedBox(height: 20),
          _buildLocationField(),
        ],
        const SizedBox(height: 20),

        // Image Upload
        _buildImageUpload(),
        const SizedBox(height: 20),

        // Story
        const Text(
          'Your Story',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xff1e293b),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _storyController,
          maxLines: 8,
          decoration: InputDecoration(
            hintText:
                "Describe who needs help, why, and how the funds will be used...",
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xffe2e8f0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xffe2e8f0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xffF43676), width: 2),
            ),
          ),
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Please tell your story';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildGoalField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Goal Amount (₹)',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xff1e293b),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _goalController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "e.g., 500000",
            prefixIcon: const Icon(Icons.currency_rupee),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xffe2e8f0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xffe2e8f0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xffF43676), width: 2),
            ),
          ),
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Please enter a goal amount';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildDeadlineField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Campaign Deadline',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xff1e293b),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _deadlineController,
          readOnly: true,
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now().add(const Duration(days: 30)),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 365)),
            );
            if (date != null) {
              setState(() {
                _deadlineController.text =
                    '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
              });
            }
          },
          decoration: InputDecoration(
            hintText: "Select date",
            suffixIcon: const Icon(Icons.calendar_today),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xffe2e8f0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xffe2e8f0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xffF43676), width: 2),
            ),
          ),
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Please select a deadline';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildCategoryDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Category',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xff1e293b),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffe2e8f0)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonFormField<String>(
            value: _selectedCategory,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
            ),
            items: const [
              DropdownMenuItem(value: 'Medical', child: Text('Medical')),
              DropdownMenuItem(value: 'Education', child: Text('Education')),
              DropdownMenuItem(value: 'Community', child: Text('Community')),
              DropdownMenuItem(
                value: 'Animal Welfare',
                child: Text('Animal Welfare'),
              ),
              DropdownMenuItem(
                value: 'Emergency Relief',
                child: Text('Emergency Relief'),
              ),
              DropdownMenuItem(
                value: 'Environment',
                child: Text('Environment'),
              ),
              DropdownMenuItem(value: 'Other', child: Text('Other')),
            ],
            onChanged: (value) {
              setState(() {
                _selectedCategory = value!;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLocationField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Location',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xff1e293b),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _locationController,
          decoration: InputDecoration(
            hintText: "City, State",
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xffe2e8f0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xffe2e8f0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xffF43676), width: 2),
            ),
          ),
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Please enter your location';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildImageUpload() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Campaign Main Image',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xff1e293b),
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            // Handle image upload
          },
          child: Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffe2e8f0),
                width: 2,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.upload_file,
                  size: 48,
                  color: const Color(0xff94a3b8),
                ),
                const SizedBox(height: 8),
                Text(
                  'Click to upload high-quality cover photo',
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color(0xff94a3b8),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'JPG, PNG, WebP (Max 5MB)',
                  style: TextStyle(
                    fontSize: 12,
                    color: const Color(0xffcbd5e1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIdentityStep() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Icon(Icons.person, size: 80, color: Color(0xff94a3b8)),
            SizedBox(height: 16),
            Text(
              'Identity Verification',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff1e293b),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Please upload your identity documents',
              style: TextStyle(color: Color(0xff64748b)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicalStep() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Icon(Icons.medical_services, size: 80, color: Color(0xff94a3b8)),
            SizedBox(height: 16),
            Text(
              'Medical Information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff1e293b),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Provide medical details and supporting documents',
              style: TextStyle(color: Color(0xff64748b)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBankStep() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Icon(Icons.account_balance, size: 80, color: Color(0xff94a3b8)),
            SizedBox(height: 16),
            Text(
              'Bank Details',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff1e293b),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Enter your bank account information for fund transfer',
              style: TextStyle(color: Color(0xff64748b)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFinalizeStep() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Icon(Icons.check_circle, size: 80, color: Color(0xffF43676)),
            SizedBox(height: 16),
            Text(
              'Ready to Launch!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff1e293b),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Review all details before submitting your campaign',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xff64748b)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _goalController.dispose();
    _deadlineController.dispose();
    _locationController.dispose();
    _storyController.dispose();
    super.dispose();
  }
}