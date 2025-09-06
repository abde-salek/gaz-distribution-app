import 'package:flutter/material.dart';
import 'package:gaz/Core/app_colors.dart';
import 'package:gaz/Core/responsive_ui.dart';
import 'package:gaz/src/auth/screens/login.dart';
import 'package:gaz/src/auth/screens/otp.dart';

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
    final double bottomCircleOffset = Responsive.getBottomCircleOffset(context);
    final double titleFontSize = Responsive.getTitleFontSize(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.authGradientStart, AppColors.authGradientEnd],
          ),
        ),
        child: Stack(
          children: [
            // --------------------------------------------------------------------------
            // TOP-LEFT DECORATIVE CIRCLE (NAVY BLUE)
            // --------------------------------------------------------------------------
            Positioned(
              left: topCircleOffset * 0.5,
              top: topCircleOffset,
              child: Container(
                width: screenWidth * 1.339,
                height: screenHeight * 0.66,
                decoration: const BoxDecoration(
                  // Navy blue - primary brand color
                  color: AppColors.darkNavy, // Navy Blue
                  shape: BoxShape.circle,
                ),
                child: Align(
                  alignment: const Alignment(0.09, 0.66),
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
            // BOTTOM DECORATIVE CIRCLE (TEAL)
            // --------------------------------------------------------------------------
            Positioned(
              right: -bottomCircleOffset * 1.3,
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
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 50,
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate() &&
                                    _nameController.text.isNotEmpty &&
                                    _phoneController.text == 10) {
                                  // Navigate to OTP
                                  Navigator.pushReplacement(
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
                            maxWidth:
                                screenWidth > 400 ? 350 : screenWidth * 0.85,
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
                                  color: AppColors.background,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: AppColors.lightBorder,
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
                                  color: AppColors.lightBorder,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: AppColors.lightBorder,
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

                        // Login navigation link
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Already have an account ?',
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

                        // Progress indicators
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
      ),
    );
  }
}
