import 'package:flutter/material.dart';
import 'package:gaz/Core/responsive_ui.dart';
import 'package:gaz/src/Auth/screens/auth_background.dart';
import 'package:gaz/src/Auth/screens/otp.dart';

/// SignupPage - User Registration Screen
///
/// Features:
/// - Responsive layout for different screen sizes
/// - Form validation for user inputs
/// - Navigation to OTP verification
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // Form controllers & keys
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = Responsive.width(context);
    final double screenHeight = Responsive.height(context);

    // Responsive circle calculations
    final double topCircleOffset = Responsive.getTopCircleOffset(context);
    final double subtitleFontSize = Responsive.getSubtitleFontSize(context);
    final double inputFontSize = Responsive.getInputFontSize(context);
    final double linkFontSize = Responsive.getLinkFontSize(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: Stack(
        children: [
          //Top-left decorative circle (Navy blue)
          Positioned(
            left: -topCircleOffset * 0.5,
            top: -topCircleOffset,
            child: Container(
              width: screenWidth * 1.339,
              height: screenHeight * 0.66,
              decoration: const BoxDecoration(
                color: Color(0xFF0D47A1),
                shape: BoxShape.circle,
              ),
              child: Align(
                alignment: const Alignment(0, 0.66),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TopCircleText(text: 'Create', screenWidth: screenWidth),
                    TopCircleText(text: '  Account', screenWidth: screenWidth),
                  ],
                ),
              ),
            ),
          ),

          AuthBackground(
            onArrowPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => OtpVerificationPage(
                          phoneNumber: _phoneController.text,
                        ),
                  ),
                );
              }
            },
          ),

          // Main content
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: screenHeight * 0.15),

                      // Page subtitle
                      Text(
                        'Enter Your Details',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF1B3F77),
                          fontSize: subtitleFontSize.clamp(18.0, 28.0),
                          fontFamily: 'Space Grotesk',
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.04),

                      // Name input field
                      Container(
                        constraints: BoxConstraints(
                          maxWidth:
                              screenWidth > 400 ? 350 : screenWidth * 0.85,
                        ),
                        child: TextFormField(
                          controller: _nameController,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            hintText: 'Name',
                            hintStyle: TextStyle(
                              color: const Color(0xFF0C8C96),
                              fontSize: inputFontSize.clamp(14.0, 20.0),
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
                                color: Color(0xFF0C8C96),
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
                      ),

                      SizedBox(height: screenHeight * 0.02),

                      // Phone number input field
                      Container(
                        constraints: BoxConstraints(
                          maxWidth:
                              screenWidth > 400 ? 350 : screenWidth * 0.85,
                        ),
                        child: TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                              color: const Color(0xFF0C8C96),
                              fontSize: inputFontSize.clamp(14.0, 20.0),
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
                            if (value.length < 10) {
                              return 'Please enter a valid phone number';
                            }
                            return null;
                          },
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.02),

                      // Login navigation link
                      GestureDetector(
                        onTap: () {
                          // Navigate back to login
                        },
                        child: Text(
                          'Already have an account ?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF1B3F77),
                            fontSize: linkFontSize.clamp(12.0, 18.0),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.04),

                      // Progress indicators
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: screenWidth * 0.025,
                            height: screenHeight * 0.025,
                            decoration: const BoxDecoration(
                              color: Color(0xFF1B3F77),
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Container(
                            width: screenWidth * 0.025,
                            height: screenHeight * 0.025,
                            decoration: const BoxDecoration(
                              color: Color(0xFFCCCCCC),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: screenHeight * 0.04),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
