import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gaz/core/app_colors.dart';
import 'package:gaz/src/auth/screens/signup.dart';
import 'package:gaz/src/dashboard/screens/dashboard_screen.dart';
import 'dart:math';

class OtpVerificationPage extends StatefulWidget {
  final String phoneNumber;

  const OtpVerificationPage({super.key, required this.phoneNumber});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  // ============================================================================
  // FORM CONTROLLERS & KEYS
  // ============================================================================
  final List<TextEditingController> _otpControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  final _formKey = GlobalKey<FormState>();

  // ============================================================================
  // LIFECYCLE METHODS
  // ============================================================================
  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  // ============================================================================
  // BUILD METHOD - MAIN UI CONSTRUCTION
  // ============================================================================
  @override
  Widget build(BuildContext context) {
    // ============================================================================
    // RESPONSIVE DESIGN CALCULATIONS
    // ============================================================================

    // Get device screen dimensions for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // ----------------------------------------------------------------------------
    // DECORATIVE CIRCLE SIZES
    // ----------------------------------------------------------------------------
    final double bottomCircleSize = screenWidth * 0.88;
    final double topCircleSize = screenWidth * 1.33;

    // ----------------------------------------------------------------------------
    // CIRCLE POSITIONING CALCULATIONS
    // ----------------------------------------------------------------------------
    final double bottomCircleOffset = bottomCircleSize * 0.4;
    final double topCircleOffset = topCircleSize * 0.5;

    // ----------------------------------------------------------------------------
    // RESPONSIVE FONT SIZES
    // All font sizes scale with screen width for consistency
    // ----------------------------------------------------------------------------

    final double titleFontSize = screenWidth * 0.075;
    final double bodyFontSize = screenWidth * 0.04;
    final double linkFontSize = screenWidth * 0.038;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF0F0F0), Color(0xFFFAFAFA)],
          ),
        ),
        child: Stack(
          children: [
            // ==========================================================================
            // DECORATIVE ELEMENTS LAYER
            // ==========================================================================

            // --------------------------------------------------------------------------
            // TOP-LEFT DECORATIVE CIRCLE (NAVY BLUE)
            // --------------------------------------------------------------------------
            Positioned(
              // More negative offset to push it further off-screen to the left
              left: -topCircleOffset * 0.5,
              // Less negative offset on the top to make it appear "dragged down"
              top: -topCircleOffset,
              child: Container(
                width: screenWidth * 1.339,
                height: screenHeight * 0.66,
                decoration: const BoxDecoration(
                  // Navy blue - primary brand color
                  color: Color(0xFF0D47A1), // Navy Blue
                  shape: BoxShape.circle,
                ),
                child: Align(
                  // Adjust alignment to re-center text in the new visible area
                  alignment: const Alignment(0, 0.66),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Create',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          // Responsive font size with min/max constraints
                          fontSize: titleFontSize.clamp(24.0, 36.0),
                          fontFamily: 'Futura Hv BT',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '  Account',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          // Responsive font size with min/max constraints
                          fontSize: titleFontSize.clamp(24.0, 36.0),
                          fontFamily: 'Futura Hv BT',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // --------------------------------------------------------------------------
            // BOTTOM-RIGHT DECORATIVE CIRCLE (TEAL)
            // --------------------------------------------------------------------------
            Positioned(
              // Less negative offset on the right to make the right side dominate
              right: -bottomCircleOffset * 1.3,
              // More negative offset on the bottom to push it further down
              bottom: -bottomCircleOffset,
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.38,
                decoration: const BoxDecoration(
                  // Teal color - AppColors.secondary brand color
                  color: AppColors.secondary,
                  shape: BoxShape.circle,
                ),
                // Adding a bold right arrow as a button
                child: Align(
                  // Position it where the circle is visible (top-left quadrant)
                  alignment: const Alignment(-0.66, -0.5),
                  child: Container(
                    padding: EdgeInsets.only(
                      // Responsive padding based on screen width
                      left: screenWidth * 0.15,
                    ),
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(screenWidth * 0.88 * 0.02),
                            decoration: BoxDecoration(
                              //color: Colors.white.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),

                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 50,
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // Navigate to main dashboard
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => const DashboardScreen(),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // --------------------------------------------------------------------------
            // MAIN CONTENT AREA
            // This is centered and contains the form elements
            // --------------------------------------------------------------------------
            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // This SizedBox creates space from the top circle/title
                        SizedBox(height: screenHeight * 0.33),
                        // "Enter Verification Code" Title
                        SizedBox(
                          width: 206,
                          child: Text(
                            'Verification Needed!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: bodyFontSize * 1.8,
                              fontFamily: 'Space Grotesk',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        // Phone number information text
                        Text(
                          'OTP code sent to:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: bodyFontSize,
                            color: const Color.fromARGB(255, 96, 95, 95),
                          ),
                        ),
                        Text(
                          widget.phoneNumber,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: bodyFontSize,
                            color: const Color.fromARGB(255, 87, 87, 87),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        // OTP input fields
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < 4; i++) ...[
                              _buildOtpField(i),
                              SizedBox(
                                width: screenWidth / pow(10, 6),
                                height: screenHeight / pow(10, 6),
                              ), // Control spacing by adjusting this width
                            ],
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        // "Resend Code" Button
                        GestureDetector(
                          onTap: () {
                            // Navigate back to login
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Resend Code',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  // Navy blue to match brand colors
                                  color: AppColors.text,
                                  // Responsive font size
                                  fontSize: linkFontSize.clamp(
                                    12.0, // Minimum size
                                    18.0, // Maximum size
                                  ),
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  // Underline to indicate it's clickable
                                  decoration: TextDecoration.underline,
                                  letterSpacing: -0.5,
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.01),
                              // Refresh icon
                              Icon(
                                Icons.refresh_rounded,
                                color: AppColors.text,
                                size: linkFontSize.clamp(16.0, 20.0),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        // Edit Phone Number GETS back to Sign Up first page
                        GestureDetector(
                          onTap: () {
                            // Navigate back to login
                            SignupPage();
                          },
                          child: Text(
                            'Edit phone number?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              // Navy blue to match brand colors
                              color: AppColors.text,
                              // Responsive font size
                              fontSize: linkFontSize.clamp(
                                12.0, // Minimum size
                                18.0, // Maximum size
                              ),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              // Underline to indicate it's clickable
                              decoration: TextDecoration.underline,
                              letterSpacing: -0.5,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.05),
                        // Page indicator dots
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                color: Color(0xFF0D47A1),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.2),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================================
  // HELPER METHODS
  // ============================================================================

  /// Builds an individual OTP input field
  Widget _buildOtpField(int index) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(
              0x1A9E9E9E,
            ), // Equivalent to Colors.grey with 10% opacity
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        controller: _otpControllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: '',
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
          }
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '';
          }
          return null;
        },
      ),
    );
  }
}
