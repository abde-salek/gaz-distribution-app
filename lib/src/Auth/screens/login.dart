import 'package:flutter/material.dart';
import 'package:gaz/Core/app_colors.dart';
import 'package:gaz/src/Auth/screens/auth_background.dart';
import 'package:gaz/src/Auth/screens/signup.dart';
import 'package:gaz/src/dashboard/screens/dashboard_screen.dart';
import 'package:gaz/Core/responsive.dart';

/// LoginPage - User Authentication Screen
///
/// Features:
/// - Responsive layout using the custom Responsive class
/// - Decorative circles for visual appeal
/// - Form validation for user inputs (name and phone)
/// - Navigation to signup and dashboard screens
///

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // ============================================================================
  // FORM CONTROLLERS & KEYS
  // ============================================================================
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // ============================================================================
  // LIFECYCLE METHODS
  // ============================================================================

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  /// Handles login button press.
  /// Validates the form and navigates to the dashboard if valid.
  void _handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      // Navigation to dashboard screen after successful validation
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        ),
      );
    }
  }

  /// Handles navigation to the signup page.
  void _navigateToSignup() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignupPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Responsive sizing using the custom Responsive class
    final double screenWidth = Responsive.width(context);
    final double screenHeight = Responsive.height(context);

    // Responsive circle and font calculations
    final double topCircleOffset = Responsive.getTopCircleOffset(context);
    final double subtitleFontSize = Responsive.getSubtitleFontSize(context);
    final double inputFontSize = Responsive.getInputFontSize(context);
    final double linkFontSize = Responsive.getLinkFontSize(context);
    final double bottomCircleOffset = Responsive.getBottomCircleOffset(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: Stack(
        children: [
          // Top decorative circle
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
                    TopCircleText(text: 'Login', screenWidth: screenWidth),
                  ],
                ),
              ),
            ),
          ),

          // Bottom decorative circle with login button
          Positioned(
            right: -bottomCircleOffset * 1.3,
            bottom: -bottomCircleOffset,
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.38,
              decoration: const BoxDecoration(
                color: AppColors.secondary,
                shape: BoxShape.circle,
              ),
              child: Align(
                alignment: const Alignment(-0.66, -0.5),
                child: Container(
                  padding: EdgeInsets.only(left: screenWidth * 0.15),
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Stack(
                    children: [
                      // Login button (arrow)
                      GestureDetector(
                        onTap: _handleLogin,
                        child: Container(
                          padding: EdgeInsets.all(screenWidth * 0.88 * 0.02),
                          decoration: const BoxDecoration(shape: BoxShape.circle),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 35,
                            ),
                            onPressed: _handleLogin,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Main login form
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

                      // Title
                      Text(
                        'Enter Your Credentials',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.text,
                          fontSize: subtitleFontSize.clamp(18.0, 28.0),
                          fontFamily: 'Space Grotesk',
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.04),

                      // Name input field
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: screenWidth > 400 ? 350 : screenWidth * 0.85,
                        ),
                        child: TextFormField(
                          controller: _nameController,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            hintText: 'Name',
                            hintStyle: TextStyle(
                              color: AppColors.secondary,
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
                                color: AppColors.secondary,
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
                                color: AppColors.secondary,
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
                          maxWidth: screenWidth > 400 ? 350 : screenWidth * 0.85,
                        ),
                        child: TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                              color: AppColors.secondary,
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
                                color: AppColors.secondary,
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

                      // Signup navigation link
                      GestureDetector(
                        onTap: _navigateToSignup,
                        child: Text(
                          'Don\'t have an account ?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.text,
                            fontSize: linkFontSize.clamp(12.0, 18.0),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.04),

                      // Decorative dots indicator
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: screenWidth * 0.025,
                            height: screenHeight * 0.025,
                            decoration: const BoxDecoration(
                              color: AppColors.text,
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
