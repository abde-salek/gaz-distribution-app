import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    // Get device screen dimensions for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // ----------------------------------------------------------------------------
    // RESPONSIVE FONT SIZES
    // ----------------------------------------------------------------------------
    final titleFontSize = screenWidth * 0.08;
    final bodyFontSize = screenWidth * 0.04;
    final subtitleFontSize = screenWidth * 0.045;

    // ----------------------------------------------------------------------------
    // DECORATIVE CIRCLE SIZES
    // These circles add visual interest to the design
    // ----------------------------------------------------------------------------
    final double bottomCircleSize = screenWidth * 0.8;
    final double topCircleSize = screenWidth * 0.9;

    // ----------------------------------------------------------------------------
    // CIRCLE POSITIONING CALCULATIONS
    // ----------------------------------------------------------------------------
    final double bottomCircleOffset = screenWidth * 0.4;
    final double topCircleOffset = screenWidth * 0.4;

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
            // --------------------------------------------------------------------------
            // BOTTOM-RIGHT DECORATIVE CIRCLE (TEAL)
            // --------------------------------------------------------------------------
            Positioned(
              right: -bottomCircleOffset * 0.5,
              bottom: -bottomCircleOffset,
              child: Container(
                width: bottomCircleSize,
                height: bottomCircleSize,
                decoration: const BoxDecoration(
                  color: Color(0xFF26A69A), // Teal
                  shape: BoxShape.circle,
                ),
              ),
            ),

            // --------------------------------------------------------------------------
            // BACK BUTTON
            // --------------------------------------------------------------------------
            Positioned(
              top: 40,
              left: 20,
              child: SafeArea(
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, size: 28),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),

            // --------------------------------------------------------------------------
            // TOP-LEFT DECORATIVE CIRCLE (NAVY BLUE)
            // --------------------------------------------------------------------------
            Positioned(
              left: -topCircleOffset,
              top: -topCircleOffset * 0.5,
              child: Container(
                width: topCircleSize,
                height: topCircleSize,
                decoration: const BoxDecoration(
                  color: Color(0xFF0D47A1), // Navy Blue
                  shape: BoxShape.circle,
                ),
                child: Align(
                  alignment: const Alignment(0.6, 0.3),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Verify',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: titleFontSize.clamp(24.0, 36.0),
                          fontFamily: 'Futura Hv BT',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'Number',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: titleFontSize.clamp(24.0, 36.0),
                          fontFamily: 'Futura Hv BT',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
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
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // This SizedBox creates space from the top circle/title
                        SizedBox(height: screenHeight * 0.22),

                        // "Enter Verification Code" Title
                        Text(
                          'Enter Verification Code',
                          style: TextStyle(
                            fontSize: subtitleFontSize,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF0D47A1),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),

                        // Phone number information text
                        Text(
                          'We sent a code to ${widget.phoneNumber}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: bodyFontSize * 0.9,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.05),

                        // OTP input fields
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            4,
                            (index) => _buildOtpField(index),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.05),

                        // "Resend Code" Button
                        TextButton(
                          onPressed: () {
                            // TODO: Implement resend code functionality
                          },
                          child: Text(
                            'Resend Code',
                            style: TextStyle(
                              color: const Color(0xFF0D47A1),
                              fontSize: bodyFontSize,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.04),

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

                        // This SizedBox creates space from the bottom circle
                        SizedBox(height: screenHeight * 0.15),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // --------------------------------------------------------------------------
            // NEXT BUTTON (INSIDE THE TEAL CIRCLE)
            // --------------------------------------------------------------------------
            Positioned(
              bottom: 20,
              right: 20,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 35,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // TODO: Verify OTP and navigate to next screen
                    String otp = _otpControllers.map((c) => c.text).join();
                    print('OTP entered: $otp');
                  }
                },
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
            color: Colors.grey.withOpacity(0.3),
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
