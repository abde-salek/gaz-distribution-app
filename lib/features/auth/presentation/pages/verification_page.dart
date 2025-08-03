// import 'package:flutter/material.dart';
// import '../../../../core/theme/app_theme.dart';
// import '../../../../core/services/auth_service.dart';
// import '../../../main/presentation/pages/main_navigation_page.dart';

// class VerificationPage extends StatefulWidget {
//   const VerificationPage({super.key});

//   @override
//   State<VerificationPage> createState() => _VerificationPageState();
// }

// class _VerificationPageState extends State<VerificationPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _otpController = TextEditingController();
//   bool _isLoading = false;

//   @override
//   void dispose() {
//     _otpController.dispose();
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

//                     // Header
//                     const Text(
//                       'Verify OTP',
//                       style: TextStyle(
//                         fontSize: 32,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                         letterSpacing: 1,
//                       ),
//                     ),
//                     const SizedBox(height: 40),

//                     // Form Fields
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
//                           const Text(
//                             'Enter OTP',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                               color: AppTheme.text,
//                             ),
//                           ),
//                           const SizedBox(height: 24),

//                           TextFormField(
//                             controller: _otpController,
//                             decoration: InputDecoration(
//                               labelText: 'OTP Code',
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
//                             keyboardType: TextInputType.number,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter OTP';
//                               }
//                               return null;
//                             },
//                           ),
//                           const SizedBox(height: 32),

//                           SizedBox(
//                             width: double.infinity,
//                             height: 56,
//                             child: ElevatedButton(
//                               onPressed: _isLoading ? null : _handleVerify,
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: AppTheme.actions,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 elevation: 0,
//                                 shadowColor: AppTheme.actions.withOpacity(0.3),
//                               ),
//                               child: _isLoading
//                                   ? const SizedBox(
//                                       width: 24,
//                                       height: 24,
//                                       child: CircularProgressIndicator(
//                                         color: Colors.white,
//                                         strokeWidth: 2,
//                                       ),
//                                     )
//                                   : const Text(
//                                       'Verify',
//                                       style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.w600,
//                                         color: Colors.white,
//                                         letterSpacing: 0.5,
//                                       ),
//                                     ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     const SizedBox(height: 32),

//                     // Resend OTP Link
//                     Center(
//                       child: GestureDetector(
//                         onTap: () {
//                           // TODO: Implement resend OTP
//                         },
//                         child: Text(
//                           'Resend OTP',
//                           style: TextStyle(
//                             color: AppTheme.secondary,
//                             fontWeight: FontWeight.w600,
//                           ),
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

//   Future<void> _handleVerify() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _isLoading = true;
//       });

//       try {
//         final success = await AuthService.verifyOTP(
//           phoneNumber: AuthService.currentUser?.phoneNumber ?? '',
//           otp: _otpController.text,
//         );

//         if (success && mounted) {
//           Navigator.pushAndRemoveUntil(
//             context,
//             MaterialPageRoute(builder: (context) => const MainNavigationPage()),
//             (route) => false,
//           );
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('Verification failed. Please try again.'),
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
//     final paint = Paint()
//       ..color = AppTheme.text
//       ..style = PaintingStyle.fill;

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
//     final bottomPaint = Paint()
//       ..color = AppTheme.secondary
//       ..style = PaintingStyle.fill;

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
