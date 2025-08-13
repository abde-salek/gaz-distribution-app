import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gaz/Auth/signup.dart';
import 'package:gaz/Core/Dash.dart';
import 'package:gaz/features/auth/screens/auth_background.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final double bodyFontSize = screenWidth * 0.04;
    final double linkFontSize = screenWidth * 0.038;

    return AuthBackground(
      title: 'Create',
      subtitle: '  Account',
      useGradientBackground: true,
      onArrowPressed: () {
        if (_formKey.currentState!.validate()) {
          String otp = _otpControllers.map((c) => c.text).join();
          print('OTP entered: $otp');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Dash(),
            ),
          );
        }
      },
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.33),
                  
                  SizedBox(
                    width: 206,
                    child: Text(
                      'Verification Needed!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF1B3F77),
                        fontSize: bodyFontSize * 1.8,
                        fontFamily: 'Space Grotesk',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  
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
                  
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 4; i++) ...[
                          _buildOtpField(i),
                          SizedBox(
                            width: screenWidth / pow(10, 6),
                            height: screenHeight / pow(10, 6),
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  
                  GestureDetector(
                    onTap: () {
                      // Resend code logic
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Resend Code',
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
                        SizedBox(width: screenWidth * 0.01),
                        Icon(
                          Icons.refresh_rounded,
                          color: const Color(0xFF1B3F77),
                          size: linkFontSize.clamp(16.0, 20.0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  
                  GestureDetector(
                    onTap: () {
                      SignupPage();
                    },
                    child: Text(
                      'Edit phone number?',
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
                  SizedBox(height: screenHeight * 0.05),
                  
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
            color: Colors.grey.withOpacity(0.2),
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
