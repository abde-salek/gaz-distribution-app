import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // Controllers for the text fields
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up controllers when the widget is disposed
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate responsive sizes based on screen dimensions
    // Using screen width as the base for circle sizes
    final double bottomCircleSize = screenWidth * 0.4; // 40% of screen width
    final double topCircleSize = screenWidth * 0.55; // 55% of screen width

    // Calculate responsive positions
    // Position circles proportionally to screen size
    final double bottomCircleOffset =
        bottomCircleSize * 0.4; // Show 60% of circle
    final double topCircleOffset = topCircleSize * 0.4; // Show 60% of circle

    // Responsive font sizes
    final double titleFontSize = screenWidth * 0.075; // 7.5% of screen width
    final double subtitleFontSize = screenWidth * 0.055; // 5.5% of screen width
    final double inputFontSize = screenWidth * 0.045; // 4.5% of screen width
    final double linkFontSize = screenWidth * 0.038; // 3.8% of screen width

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: Stack(
        children: [
          // Bottom right decorative circle - responsive
          Positioned(
            right: -bottomCircleOffset,
            bottom: -bottomCircleOffset,
            child: Container(
              width: bottomCircleSize,
              height: bottomCircleSize,
              decoration: const BoxDecoration(
                color: Color(0xFF0C8C96),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Top left circle with Create Account text - responsive
          Positioned(
            left: -topCircleOffset,
            top: -topCircleOffset * 0.5, // Less offset on top for visibility
            child: Container(
              width: topCircleSize,
              height: topCircleSize,
              decoration: const BoxDecoration(
                color: Color(0xFF1B3F77),
                shape: BoxShape.circle,
              ),
              child: Align(
                alignment: const Alignment(0.3, 0.2),
                child: Text(
                  'Create\nAccount',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: titleFontSize.clamp(24.0, 36.0), // Min 24, Max 36
                    fontFamily: 'Futura Hv BT',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
          // Main content
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.08,
              ), // 8% padding
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.15,
                    ), // 15% of screen height
                    // Title
                    Text(
                      'Enter Your Details',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF1B3F77),
                        fontSize: subtitleFontSize.clamp(
                          18.0,
                          28.0,
                        ), // Min 18, Max 28
                        fontFamily: 'Space Grotesk',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04), // 4% spacing
                    // Name input field
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        hintStyle: TextStyle(
                          color: const Color(0xFF0C8C96),
                          fontSize: inputFontSize.clamp(
                            14.0,
                            20.0,
                          ), // Min 14, Max 20
                          fontFamily: 'Space Grotesk',
                          fontWeight: FontWeight.w500,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFE0E0E0),
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFE0E0E0),
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF0C8C96),
                            width: 2,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02), // 2% spacing
                    // Phone Number input field
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(
                          color: const Color(0xFF0C8C96),
                          fontSize: inputFontSize.clamp(
                            14.0,
                            20.0,
                          ), // Min 14, Max 20
                          fontFamily: 'Space Grotesk',
                          fontWeight: FontWeight.w500,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFE0E0E0),
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFE0E0E0),
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF0C8C96),
                            width: 2,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        // Basic phone number validation
                        if (value.length < 10) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: screenHeight * 0.04), // 4% spacing
                    // Already have account text
                    GestureDetector(
                      onTap: () {
                        // Navigate back to login page
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Already Have an account ?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF1B3F77),
                          fontSize: linkFontSize.clamp(
                            12.0,
                            18.0,
                          ), // Min 12, Max 18
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015), // 1.5% spacing
                    // Progress indicators
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: screenWidth * 0.025, // 2.5% of screen width
                          height: screenWidth * 0.025,
                          decoration: const BoxDecoration(
                            color: Color(0xFF1B3F77),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02), // 2% spacing
                        Container(
                          width: screenWidth * 0.025, // 2.5% of screen width
                          height: screenWidth * 0.025,
                          decoration: const BoxDecoration(
                            color: Color(0xFFCCCCCC),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.04), // 4% spacing
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
