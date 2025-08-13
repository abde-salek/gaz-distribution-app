import 'package:flutter/material.dart';
import 'package:gaz/Auth/otp.dart';
import 'package:gaz/Auth/signup.dart';
import 'package:gaz/Core/Dash.dart';
import 'package:gaz/features/auth/screens/auth_background.dart';

/// LoginPage - User Authentication Screen
///
/// A beautifully designed login page with:
/// - Responsive layout that adapts to different screen sizes
/// - Decorative circles for visual appeal
/// - Form validation for user inputs
/// - Navigation to signup page
///
/// This page is part of a Product Delivery Tracker app
/// Author: [Your Name]
/// Created for: Portfolio Project
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final double subtitleFontSize = screenWidth * 0.055;
    final double inputFontSize = screenWidth * 0.045;
    final double linkFontSize = screenWidth * 0.038;

    return AuthBackground(
      title: 'Login',
      onArrowPressed: () {
        if (_formKey.currentState!.validate()) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dash(),
            ),
          );
        }
      },
      child: SafeArea(
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

                  Text(
                    'Enter Your Credentials',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF1B3F77),
                      fontSize: subtitleFontSize.clamp(18.0, 28.0),
                      fontFamily: 'Space Grotesk',
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.04),

                  Container(
                    constraints: BoxConstraints(
                      maxWidth:
                          screenWidth > 400 ? 350 : screenWidth * 0.85,
                    ),
                    child: TextFormField(
                      controller: _nameController,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: 'Username',
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
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),

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

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Don\'t have an account ?',
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
    );
  }
}
