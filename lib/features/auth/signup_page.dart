// import 'package:flutter/material.dart';
// import '../../../../core/theme/app_theme.dart';
// import '../../../../core/services/auth_service.dart';
// import 'verification_page.dart';

// class SignupPage extends StatefulWidget {
//   const SignupPage({super.key});

//   @override
//   State<SignupPage> createState() => _SignupPageState();
// }

// class _SignupPageState extends State<SignupPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _phoneController = TextEditingController();
//   bool _isLoading = false;

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _phoneController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background with curved shapes
//           Container(
//             decoration: const BoxDecoration(color: Colors.white),
//             child: CustomPaint(
//               painter: CurvedShapesPainter(),
//               size: Size.infinite,
//             ),
//           ),

//           // Content
//           SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.all(24.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 80),

//                     // Header - Create Account
//                     const Text(
//                       'Create\nAccount',
//                       style: TextStyle(
//                         fontSize: 32,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                         letterSpacing: 1,
//                         height: 1.1,
//                       ),
//                     ),
//                     const SizedBox(height: 50),

//                     // Form Fields Section
//                     Container(
//                       padding: const EdgeInsets.all(24),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(16),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.1),
//                             blurRadius: 20,
//                             offset: const Offset(0, 10),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Title
//                           const Text(
//                             'Enter Your Details',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                               color: AppTheme.text,
//                             ),
//                           ),
//                           const SizedBox(height: 24),

//                           // Name Field
//                           TextFormField(
//                             controller: _nameController,
//                             decoration: InputDecoration(
//                               labelText: 'Name',
//                               labelStyle: TextStyle(
//                                 color: Colors.grey[600],
//                                 fontWeight: FontWeight.w500,
//                               ),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                                 borderSide: BorderSide(
//                                   color: Colors.grey[300]!,
//                                   width: 1,
//                                 ),
//                               ),
//                               enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                                 borderSide: BorderSide(
//                                   color: Colors.grey[300]!,
//                                   width: 1,
//                                 ),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                                 borderSide: const BorderSide(
//                                   color: AppTheme.secondary,
//                                   width: 2,
//                                 ),
//                               ),
//                               filled: true,
//                               fillColor: Colors.grey[50],
//                               contentPadding: const EdgeInsets.symmetric(
//                                 horizontal: 16,
//                                 vertical: 16,
//                               ),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter your name';
//                               }
//                               return null;
//                             },
//                           ),
//                           const SizedBox(height: 20),

//                           // Phone Number Field
//                           TextFormField(
//                             controller: _phoneController,
//                             decoration: InputDecoration(
//                               labelText: 'Phone Number',
//                               labelStyle: TextStyle(
//                                 color: Colors.grey[600],
//                                 fontWeight: FontWeight.w500,
//                               ),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                                 borderSide: BorderSide(
//                                   color: Colors.grey[300]!,
//                                   width: 1,
//                                 ),
//                               ),
//                               enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                                 borderSide: BorderSide(
//                                   color: Colors.grey[300]!,
//                                   width: 1,
//                                 ),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                                 borderSide: const BorderSide(
//                                   color: AppTheme.secondary,
//                                   width: 2,
//                                 ),
//                               ),
//                               filled: true,
//                               fillColor: Colors.grey[50],
//                               contentPadding: const EdgeInsets.symmetric(
//                                 horizontal: 16,
//                                 vertical: 16,
//                               ),
//                             ),
//                             keyboardType: TextInputType.phone,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter your phone number';
//                               }
//                               return null;
//                             },
//                           ),
//                         ],
//                       ),
//                     ),

//                     const SizedBox(height: 40),

//                     // Navigation Dots
//                     Center(
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Container(
//                             width: 12,
//                             height: 12,
//                             decoration: const BoxDecoration(
//                               color: AppTheme.text,
//                               shape: BoxShape.circle,
//                             ),
//                           ),
//                           const SizedBox(width: 8),
//                           Container(
//                             width: 12,
//                             height: 12,
//                             decoration: BoxDecoration(
//                               color: Colors.grey[300],
//                               shape: BoxShape.circle,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     const SizedBox(height: 40),

//                     // Already Have Account Link
//                     Center(
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: Text(
//                           'Already Have an account?',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: const Color(0xFF1B3F77),
//                             fontWeight: FontWeight.w500,
//                             decoration: TextDecoration.underline,
//                           ),
//                         ),
//                       ),
//                     ),

//                     const Spacer(),

//                     // Next Button (Arrow)
//                     Align(
//                       alignment: Alignment.bottomRight,
//                       child: GestureDetector(
//                         onTap: _isLoading ? null : _handleSignUp,
//                         child: Container(
//                           width: 60,
//                           height: 60,
//                           decoration: BoxDecoration(
//                             color: AppTheme.actions,
//                             borderRadius: BorderRadius.circular(30),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: AppTheme.actions.withOpacity(0.3),
//                                 blurRadius: 10,
//                                 offset: const Offset(0, 5),
//                               ),
//                             ],
//                           ),
//                           child:
//                               _isLoading
//                                   ? const Center(
//                                     child: SizedBox(
//                                       width: 24,
//                                       height: 24,
//                                       child: CircularProgressIndicator(
//                                         color: Colors.white,
//                                         strokeWidth: 2,
//                                       ),
//                                     ),
//                                   )
//                                   : const Icon(
//                                     Icons.arrow_forward,
//                                     color: Colors.white,
//                                     size: 30,
//                                   ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _handleSignUp() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _isLoading = true;
//       });

//       try {
//         final success = await AuthService.signUp(
//           name: _nameController.text,
//           phoneNumber: _phoneController.text,
//         );

//         if (success && mounted) {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const VerificationPage()),
//           );
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('Sign up failed. Please try again.'),
//               backgroundColor: AppTheme.errorRed,
//             ),
//           );
//         }
//       } finally {
//         if (mounted) {
//           setState(() {
//             _isLoading = false;
//           });
//         }
//       }
//     }
//   }
// }

// class CurvedShapesPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint =
//         Paint()
//           ..color = AppTheme.text
//           ..style = PaintingStyle.fill;

//     // Top curved shape
//     final topPath = Path();
//     topPath.moveTo(size.width, 0);
//     topPath.quadraticBezierTo(
//       size.width * 0.7,
//       size.height * 0.15,
//       size.width * 0.3,
//       size.height * 0.15,
//     );
//     topPath.lineTo(0, size.height * 0.15);
//     topPath.lineTo(0, 0);
//     topPath.close();
//     canvas.drawPath(topPath, paint);

//     // Bottom curved shape
//     final bottomPaint =
//         Paint()
//           ..color = AppTheme.secondary
//           ..style = PaintingStyle.fill;

//     final bottomPath = Path();
//     bottomPath.moveTo(0, size.height);
//     bottomPath.quadraticBezierTo(
//       size.width * 0.3,
//       size.height * 0.85,
//       size.width * 0.7,
//       size.height * 0.85,
//     );
//     bottomPath.lineTo(size.width, size.height * 0.85);
//     bottomPath.lineTo(size.width, size.height);
//     bottomPath.close();
//     canvas.drawPath(bottomPath, bottomPaint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }
