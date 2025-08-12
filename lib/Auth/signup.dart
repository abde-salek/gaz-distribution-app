import 'package:flutter/material.dart';
import 'package:gaz/Auth/otp.dart';

/// SignupPage - User Registration Screen
///
/// A beautifully designed signup page with:
/// - Responsive layout that adapts to different screen sizes
/// - Decorative circles for visual appeal
/// - Form validation for user inputs
/// - Navigation to login page
///
/// This page is part of a Product Delivery Tracker app
/// Author: [Your Name]
/// Created for: Portfolio Project
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // ============================================================================
  // FORM CONTROLLERS & KEYS
  // ============================================================================
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // ============================================================================
  // LIFECYCLE METHODS
  // ============================================================================

  @override
  void dispose() {
    // Properly dispose of controllers to prevent memory leaks
    // This is called when the widget is removed from the widget tree
    _nameController.dispose();
    _phoneController.dispose();
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
    //final late List PhoneNumber = [];
    // Get device screen dimensions for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // ----------------------------------------------------------------------------
    // DECORATIVE CIRCLE SIZES
    // ----------------------------------------------------------------------------
    final double topCircleSize = screenWidth * 1.33;

    // ----------------------------------------------------------------------------
    // CIRCLE POSITIONING CALCULATIONS
    // ----------------------------------------------------------------------------
    final double bottomCircleOffset = screenWidth * 0.88 * 0.4;
    final double topCircleOffset = topCircleSize * 0.5;

    // ----------------------------------------------------------------------------
    // RESPONSIVE FONT SIZES
    // All font sizes scale with screen width for consistency
    // ----------------------------------------------------------------------------

    final double titleFontSize = screenWidth * 0.075;
    final double subtitleFontSize = screenWidth * 0.055;
    final double inputFontSize = screenWidth * 0.045;
    final double linkFontSize = screenWidth * 0.038;

    // ============================================================================
    // MAIN SCAFFOLD - ROOT WIDGET
    // ============================================================================

    return Scaffold(
      // Light gray background color for the entire screen
      backgroundColor: const Color(0xFFF3F4F6),

      // Stack allows overlapping of decorative elements and main content
      body: Stack(
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
                // Teal color - secondary brand color
                color: Color(0xFF0C8C96),
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
                        onTap: () {
                          // Validate form and proceed if valid
                          if (_formKey.currentState!.validate()) {
                            // Handle signup or navigation to next screen
                            print('Form validated, proceeding to next step');
                            // TODO: Implement signup logic or navigation
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(screenWidth * 0.88 * 0.02),
                          decoration: BoxDecoration(
                            //color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 35,
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Navigate to OTP verification page with phone number
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
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // =====================.33=====================================================
          // MAIN CONTENT LAYER
          // Contains the form and all interactive elements
          // ==========================================================================
          SafeArea(
            child: Center(
              // SingleChildScrollView enables scrolling on small screens
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  // Horizontal padding: 8% of screen width
                  horizontal: screenWidth * 0.08,
                ),
                child: Form(
                  // Form key for validation management
                  key: _formKey,
                  child: Column(
                    // Center all children vertically and horizontally
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // --------------------------------------------------------------------------
                      // TOP SPACING
                      // Creates space between top of safe area and content
                      // --------------------------------------------------------------------------
                      SizedBox(
                        // 15% of screen height for proportional spacing
                        height: screenHeight * 0.15,
                      ),

                      // --------------------------------------------------------------------------
                      // PAGE SUBTITLE
                      // "Enter Your Details" instruction text
                      // --------------------------------------------------------------------------
                      Text(
                        'Enter Your Details',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          // Navy blue to match brand colors
                          color: const Color(0xFF1B3F77),
                          // Responsive font size with constraints
                          fontSize: subtitleFontSize.clamp(
                            18.0, // Minimum size
                            28.0, // Maximum size
                          ),
                          fontFamily: 'Space Grotesk',
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      // Spacing between title and first input
                      SizedBox(height: screenHeight * 0.04),

                      // --------------------------------------------------------------------------
                      // NAME INPUT FIELD
                      // First form field for user's name
                      // --------------------------------------------------------------------------
                      Container(
                        // Constrain width for better appearance on large screens
                        constraints: BoxConstraints(
                          // Max width: 350px on large screens, 85% on small screens
                          maxWidth:
                              screenWidth > 400 ? 350 : screenWidth * 0.85,
                        ),
                        child: TextFormField(
                          // Connect to name controller
                          controller: _nameController,
                          // Center the input text
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            // Placeholder text
                            hintText: 'Name',
                            hintStyle: TextStyle(
                              // Teal color for hints
                              color: const Color(0xFF0C8C96),
                              // Responsive font size
                              fontSize: inputFontSize.clamp(
                                14.0, // Minimum size
                                20.0, // Maximum size
                              ),
                              fontFamily: 'Space Grotesk',
                              fontWeight: FontWeight.w500,
                            ),
                            // White background for input field
                            filled: true,
                            fillColor: Colors.white,
                            // Internal padding of the input field
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 14,
                            ),
                            // Default border style
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xFF0C8C96),
                                width: 1,
                              ),
                            ),
                            // Border when field is enabled but not focused
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xFFE0E0E0),
                                width: 1,
                              ),
                            ),
                            // Border when field is focused
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                // Teal color when focused
                                color: Color(0xFF0C8C96),
                                width: 2,
                              ),
                            ),
                          ),
                          // Validation logic for name field
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                      ),

                      // Spacing between input fields
                      SizedBox(height: screenHeight * 0.02),

                      // --------------------------------------------------------------------------
                      // PHONE NUMBER INPUT FIELD
                      // Second form field for user's phone number
                      // --------------------------------------------------------------------------
                      Container(
                        // Constrain width for better appearance on large screens
                        constraints: BoxConstraints(
                          // Max width: 350px on large screens, 85% on small screens
                          maxWidth:
                              screenWidth > 400 ? 350 : screenWidth * 0.85,
                        ),
                        child: TextFormField(
                          // Connect to phone controller
                          controller: _phoneController,
                          // Set keyboard type to phone for better UX
                          keyboardType: TextInputType.phone,
                          // Center the input text
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            // Placeholder text
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                              // Teal color for hints
                              color: const Color(0xFF0C8C96),
                              // Responsive font size
                              fontSize: inputFontSize.clamp(
                                14.0, // Minimum size
                                20.0, // Maximum size
                              ),
                              fontFamily: 'Space Grotesk',
                              fontWeight: FontWeight.w500,
                            ),
                            // White background for input field
                            filled: true,
                            fillColor: Colors.white,
                            // Internal padding of the input field
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 14,
                            ),
                            // Default border style
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xFFE0E0E0),
                                width: 1,
                              ),
                            ),
                            // Border when field is enabled but not focused
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xFFE0E0E0),
                                width: 1,
                              ),
                            ),
                            // Border when field is focused
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                // Teal color when focused
                                color: Color(0xFF0C8C96),
                                width: 2,
                              ),
                            ),
                          ),
                          // Validation logic for phone field
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            // Basic phone number validation (minimum 10 digits)
                            if (value.length < 10) {
                              return 'Please enter a valid phone number';
                            }
                            return null;
                          },
                        ),
                      ),

                      // Spacing before navigation link
                      SizedBox(height: screenHeight * 0.02),

                      // // --------------------------------------------------------------------------
                      // NAVIGATION LINK
                      // Link to navigate back to login page for existing users
                      // --------------------------------------------------------------------------
                      GestureDetector(
                        onTap: () {
                          // Navigate back to login
                        },
                        child: Text(
                          'Already have an account ?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            // Navy blue to match brand colors
                            color: const Color(0xFF1B3F77),
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

                      // Small spacing before progress indicators
                      SizedBox(height: screenHeight * 0.04),

                      // --------------------------------------------------------------------------
                      // PROGRESS INDICATORS
                      // Visual indicators showing current step in signup process
                      // First dot (navy) = current page, Second dot (gray) = next step
                      // --------------------------------------------------------------------------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Active indicator (current page)
                          Container(
                            // Size: 2.5% of screen width for responsive scaling
                            width: screenWidth * 0.025,
                            height: screenHeight * 0.025,
                            decoration: const BoxDecoration(
                              // Navy blue for active state
                              color: Color(0xFF1B3F77),
                              shape: BoxShape.circle,
                            ),
                          ),
                          // Spacing between indicators
                          SizedBox(width: screenWidth * 0.02),
                          // Inactive indicator (next step)
                          Container(
                            // Size: 2.5% of screen width for responsive scaling
                            width: screenWidth * 0.025,
                            height: screenHeight * 0.025,
                            decoration: const BoxDecoration(
                              // Gray for inactive state
                              color: Color(0xFFCCCCCC),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),

                      // Bottom spacing
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
