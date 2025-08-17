// import 'package:flutter/material.dart';

// Container(
//     width: 402,
//     height: 874,
//     decoration: ShapeDecoration(
//         color: const Color(0xFFF9F9F9),
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(50),
//         ),
//     ),
//     child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//             ConstrainedBox(
//                 constraints: BoxConstraints(minHeight: 844),
//                 child: Container(
//                     width: 402,
//                     height: 874,
//                     clipBehavior: Clip.antiAlias,
//                     decoration: ShapeDecoration(
//                         color: const Color(0xFFF9F9F9),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(50),
//                         ),
//                     ),
//                     child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                             Expanded(
//                                 child: Container(
//                                     width: double.infinity,
//                                     clipBehavior: Clip.antiAlias,
//                                     decoration: BoxDecoration(),
//                                     child: Column(
//                                         mainAxisSize: MainAxisSize.min,
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                             Container(
//                                                 width: double.infinity,
//                                                 padding: const EdgeInsets.only(
//                                                     top: 16,
//                                                     left: 16,
//                                                     right: 16,
//                                                     bottom: 8,
//                                                 ),
//                                                 decoration: BoxDecoration(color: const Color(0xFFF9F9F9)),
//                                                 child: Row(
//                                                     mainAxisSize: MainAxisSize.min,
//                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                                     children: [
//                                                         Container(
//                                                             width: 48,
//                                                             height: 48,
//                                                             child: Column(
//                                                                 mainAxisSize: MainAxisSize.min,
//                                                                 mainAxisAlignment: MainAxisAlignment.center,
//                                                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                                                 children: [
//                                                                     Container(width: 48, height: 2),
//                                                                     Container(
//                                                                         width: 32,
//                                                                         height: 32,
//                                                                         decoration: BoxDecoration(
//                                                                             image: DecorationImage(
//                                                                                 image: NetworkImage("https://placehold.co/32x32"),
//                                                                                 fit: BoxFit.contain,
//                                                                             ),
//                                                                         ),
//                                                                     ),
//                                                                 ],
//                                                             ),
//                                                         ),
//                                                         Expanded(
//                                                             child: Column(
//                                                                 mainAxisSize: MainAxisSize.min,
//                                                                 mainAxisAlignment: MainAxisAlignment.start,
//                                                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                                                 children: [
//                                                                     SizedBox(
//                                                                         width: 282,
//                                                                         child: Text(
//                                                                             'Clients',
//                                                                             textAlign: TextAlign.center,
//                                                                             style: TextStyle(
//                                                                                 color: const Color(0xFF1B3F77),
//                                                                                 fontSize: 18,
//                                                                                 fontFamily: 'Space Grotesk',
//                                                                                 fontWeight: FontWeight.w700,
//                                                                                 height: 1.28,
//                                                                             ),
//                                                                         ),
//                                                                     ),
//                                                                 ],
//                                                             ),
//                                                         ),
//                                                         Container(
//                                                             width: 40,
//                                                             height: 45,
//                                                             padding: const EdgeInsets.all(10),
//                                                             child: Column(
//                                                                 mainAxisSize: MainAxisSize.min,
//                                                                 mainAxisAlignment: MainAxisAlignment.center,
//                                                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                                                 children: [
//                                                                     Container(
//                                                                         width: 10,
//                                                                         height: 10,
//                                                                         padding: const EdgeInsets.all(10),
//                                                                     ),
//                                                                     SizedBox(
//                                                                         width: 40,
//                                                                         height: 20,
//                                                                         child: Text(
//                                                                             'DH',
//                                                                             textAlign: TextAlign.center,
//                                                                             style: TextStyle(
//                                                                                 color: const Color(0xFF0C111C),
//                                                                                 fontSize: 22,
//                                                                                 fontFamily: 'Space Grotesk',
//                                                                                 fontWeight: FontWeight.w400,
//                                                                                 height: 1.09,
//                                                                             ),
//                                                                         ),
//                                                                     ),
//                                                                     Container(
//                                                                         width: 20,
//                                                                         height: 28,
//                                                                         child: Stack(
//                                                                             children: [
//                                                                                 Positioned(
//                                                                                     left: 20,
//                                                                                     top: 20,
//                                                                                     child: Container(
//                                                                                         transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(3.14),
//                                                                                         width: 20,
//                                                                                         height: 20,
//                                                                                         decoration: BoxDecoration(
//                                                                                             image: DecorationImage(
//                                                                                                 image: NetworkImage("https://placehold.co/20x20"),
//                                                                                                 fit: BoxFit.contain,
//                                                                                             ),
//                                                                                         ),
//                                                                                     ),
//                                                                                 ),
//                                                                                 Positioned(
//                                                                                     left: 0,
//                                                                                     top: 8,
//                                                                                     child: Container(
//                                                                                         width: 20,
//                                                                                         height: 20,
//                                                                                         decoration: BoxDecoration(
//                                                                                             image: DecorationImage(
//                                                                                                 image: NetworkImage("https://placehold.co/20x20"),
//                                                                                                 fit: BoxFit.contain,
//                                                                                             ),
//                                                                                         ),
//                                                                                     ),
//                                                                                 ),
//                                                                             ],
//                                                                         ),
//                                                                     ),
//                                                                 ],
//                                                             ),
//                                                         ),
//                                                     ],
//                                                 ),
//                                             ),
//                                             Container(
//                                                 width: double.infinity,
//                                                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                                                 child: Column(
//                                                     mainAxisSize: MainAxisSize.min,
//                                                     mainAxisAlignment: MainAxisAlignment.start,
//                                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                                     children: [
//                                                         ConstrainedBox(
//                                                             constraints: BoxConstraints(minWidth: 160),
//                                                             child: Container(
//                                                                 width: double.infinity,
//                                                                 height: 48,
//                                                                 child: Column(
//                                                                     mainAxisSize: MainAxisSize.min,
//                                                                     mainAxisAlignment: MainAxisAlignment.start,
//                                                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                                                     children: [
//                                                                         Expanded(
//                                                                             child: Container(
//                                                                                 width: double.infinity,
//                                                                                 decoration: ShapeDecoration(
//                                                                                     shape: RoundedRectangleBorder(
//                                                                                         borderRadius: BorderRadius.circular(12),
//                                                                                     ),
//                                                                                 ),
//                                                                                 child: Row(
//                                                                                     mainAxisSize: MainAxisSize.min,
//                                                                                     mainAxisAlignment: MainAxisAlignment.start,
//                                                                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                     children: [
//                                                                                         Container(
//                                                                                             height: double.infinity,
//                                                                                             padding: const EdgeInsets.only(left: 16),
//                                                                                             decoration: ShapeDecoration(
//                                                                                                 color: const Color(0xFFEAEDEF),
//                                                                                                 shape: RoundedRectangleBorder(
//                                                                                                     borderRadius: BorderRadius.only(
//                                                                                                         topLeft: Radius.circular(12),
//                                                                                                         bottomLeft: Radius.circular(12),
//                                                                                                     ),
//                                                                                                 ),
//                                                                                             ),
//                                                                                             child: Row(
//                                                                                                 mainAxisSize: MainAxisSize.min,
//                                                                                                 mainAxisAlignment: MainAxisAlignment.center,
//                                                                                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                                                                                 children: [
//                                                                                                     Expanded(
//                                                                                                         child: Container(
//                                                                                                             height: 24,
//                                                                                                             clipBehavior: Clip.antiAlias,
//                                                                                                             decoration: BoxDecoration(),
//                                                                                                             child: Stack(
//                                                                                                                 children: [
//                                                                                                                     Positioned(left: undefined, top: undefined),
//                                                                                                                 ],
//                                                                                                             ),
//                                                                                                         ),
//                                                                                                     ),
//                                                                                                 ],
//                                                                                             ),
//                                                                                         ),
//                                                                                         Expanded(
//                                                                                             child: Container(
//                                                                                                 height: double.infinity,
//                                                                                                 padding: const EdgeInsets.only(top: 8, left: 8, right: 16, bottom: 8),
//                                                                                                 clipBehavior: Clip.antiAlias,
//                                                                                                 decoration: ShapeDecoration(
//                                                                                                     color: const Color(0xFFEAEDEF),
//                                                                                                     shape: RoundedRectangleBorder(
//                                                                                                         borderRadius: BorderRadius.only(
//                                                                                                             topRight: Radius.circular(12),
//                                                                                                             bottomRight: Radius.circular(12),
//                                                                                                         ),
//                                                                                                     ),
//                                                                                                 ),
//                                                                                                 child: Row(
//                                                                                                     mainAxisSize: MainAxisSize.min,
//                                                                                                     mainAxisAlignment: MainAxisAlignment.start,
//                                                                                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                                                                                     children: [
//                                                                                                         Text(
//                                                                                                             'Search  clients',
//                                                                                                             style: TextStyle(
//                                                                                                                 color: const Color(0xFF66707F),
//                                                                                                                 fontSize: 16,
//                                                                                                                 fontFamily: 'Space Grotesk',
//                                                                                                                 fontWeight: FontWeight.w400,
//                                                                                                                 height: 1.50,
//                                                                                                             ),
//                                                                                                         ),
//                                                                                                     ],
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ),
//                                                                                     ],
//                                                                                 ),
//                                                                             ),
//                                                                         ),
//                                                                     ],
//                                                                 ),
//                                                             ),
//                                                         ),
//                                                     ],
//                                                 ),
//                                             ),
//                                             Container(
//                                                 height: 730,
//                                                 clipBehavior: Clip.antiAlias,
//                                                 decoration: BoxDecoration(),
//                                                 child: Column(
//                                                     mainAxisSize: MainAxisSize.min,
//                                                     mainAxisAlignment: MainAxisAlignment.start,
//                                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                                     children: [
//                                                         ConstrainedBox(
//                                                             constraints: BoxConstraints(minHeight: 72),
//                                                             child: Container(
//                                                                 width: 402,
//                                                                 height: 72,
//                                                                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                                                                 decoration: BoxDecoration(color: const Color(0xFFF9F9F9)),
//                                                                 child: Row(
//                                                                     mainAxisSize: MainAxisSize.min,
//                                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                                                     spacing: 16,
//                                                                     children: [
//                                                                         Column(
//                                                                             mainAxisSize: MainAxisSize.min,
//                                                                             mainAxisAlignment: MainAxisAlignment.center,
//                                                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                                                             children: [
//                                                                                 Container(
//                                                                                     width: 145,
//                                                                                     clipBehavior: Clip.antiAlias,
//                                                                                     decoration: BoxDecoration(),
//                                                                                     child: Column(
//                                                                                         mainAxisSize: MainAxisSize.min,
//                                                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                         children: [
//                                                                                             SizedBox(
//                                                                                                 width: 145,
//                                                                                                 child: Text(
//                                                                                                     'Sarah Johnson',
//                                                                                                     style: TextStyle(
//                                                                                                         color: const Color(0xFF111416),
//                                                                                                         fontSize: 16,
//                                                                                                         fontFamily: 'Space Grotesk',
//                                                                                                         fontWeight: FontWeight.w500,
//                                                                                                         height: 1.50,
//                                                                                                     ),
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                                 Container(
//                                                                                     clipBehavior: Clip.antiAlias,
//                                                                                     decoration: BoxDecoration(),
//                                                                                     child: Column(
//                                                                                         mainAxisSize: MainAxisSize.min,
//                                                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                         children: [
//                                                                                             Text(
//                                                                                                 '123 Main St, Anytown',
//                                                                                                 style: TextStyle(
//                                                                                                     color: const Color(0xFF66707F),
//                                                                                                     fontSize: 14,
//                                                                                                     fontFamily: 'Space Grotesk',
//                                                                                                     fontWeight: FontWeight.w400,
//                                                                                                     height: 1.50,
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                             ],
//                                                                         ),
//                                                                         Row(
//                                                                             mainAxisSize: MainAxisSize.min,
//                                                                             mainAxisAlignment: MainAxisAlignment.start,
//                                                                             crossAxisAlignment: CrossAxisAlignment.center,
//                                                                             spacing: 4,
//                                                                             children: [
//                                                                                 Container(
//                                                                                     height: 24,
//                                                                                     child: Row(
//                                                                                         mainAxisSize: MainAxisSize.min,
//                                                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                         spacing: 5,
//                                                                                         children: [
//                                                                                             Text(
//                                                                                                 '25.00',
//                                                                                                 style: TextStyle(
//                                                                                                     color: const Color(0xFF1B3F77),
//                                                                                                     fontSize: 20,
//                                                                                                     fontFamily: 'Space Grotesk',
//                                                                                                     fontWeight: FontWeight.w700,
//                                                                                                     height: 1.20,
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                                 Container(
//                                                                                     width: 22,
//                                                                                     height: 24,
//                                                                                     child: Stack(
//                                                                                         children: [
//                                                                                             Positioned(
//                                                                                                 left: 0,
//                                                                                                 top: 0,
//                                                                                                 child: Text(
//                                                                                                     'DH',
//                                                                                                     style: TextStyle(
//                                                                                                         color: const Color(0xFF1B3F77),
//                                                                                                         fontSize: 16,
//                                                                                                         fontFamily: 'Space Grotesk',
//                                                                                                         fontWeight: FontWeight.w400,
//                                                                                                         height: 1.50,
//                                                                                                     ),
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                             ],
//                                                                         ),
//                                                                     ],
//                                                                 ),
//                                                             ),
//                                                         ),
//                                                         ConstrainedBox(
//                                                             constraints: BoxConstraints(minHeight: 72),
//                                                             child: Container(
//                                                                 width: 402,
//                                                                 height: 72,
//                                                                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                                                                 decoration: BoxDecoration(color: const Color(0xFFF9F9F9)),
//                                                                 child: Row(
//                                                                     mainAxisSize: MainAxisSize.min,
//                                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                                                     spacing: 16,
//                                                                     children: [
//                                                                         Column(
//                                                                             mainAxisSize: MainAxisSize.min,
//                                                                             mainAxisAlignment: MainAxisAlignment.center,
//                                                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                                                             children: [
//                                                                                 Container(
//                                                                                     width: 150,
//                                                                                     clipBehavior: Clip.antiAlias,
//                                                                                     decoration: BoxDecoration(),
//                                                                                     child: Column(
//                                                                                         mainAxisSize: MainAxisSize.min,
//                                                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                         children: [
//                                                                                             SizedBox(
//                                                                                                 width: 150,
//                                                                                                 child: Text(
//                                                                                                     'Michael Brown',
//                                                                                                     style: TextStyle(
//                                                                                                         color: const Color(0xFF111416),
//                                                                                                         fontSize: 16,
//                                                                                                         fontFamily: 'Space Grotesk',
//                                                                                                         fontWeight: FontWeight.w500,
//                                                                                                         height: 1.50,
//                                                                                                     ),
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                                 Container(
//                                                                                     clipBehavior: Clip.antiAlias,
//                                                                                     decoration: BoxDecoration(),
//                                                                                     child: Column(
//                                                                                         mainAxisSize: MainAxisSize.min,
//                                                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                         children: [
//                                                                                             Text(
//                                                                                                 '456 Oak Ave, Anytown',
//                                                                                                 style: TextStyle(
//                                                                                                     color: const Color(0xFF66707F),
//                                                                                                     fontSize: 14,
//                                                                                                     fontFamily: 'Space Grotesk',
//                                                                                                     fontWeight: FontWeight.w400,
//                                                                                                     height: 1.50,
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                             ],
//                                                                         ),
//                                                                         Row(
//                                                                             mainAxisSize: MainAxisSize.min,
//                                                                             mainAxisAlignment: MainAxisAlignment.start,
//                                                                             crossAxisAlignment: CrossAxisAlignment.center,
//                                                                             spacing: 4,
//                                                                             children: [
//                                                                                 Container(
//                                                                                     height: 24,
//                                                                                     child: Row(
//                                                                                         mainAxisSize: MainAxisSize.min,
//                                                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                         spacing: 5,
//                                                                                         children: [
//                                                                                             Text(
//                                                                                                 '0.00',
//                                                                                                 style: TextStyle(
//                                                                                                     color: const Color(0xFF0C8C96),
//                                                                                                     fontSize: 20,
//                                                                                                     fontFamily: 'Space Grotesk',
//                                                                                                     fontWeight: FontWeight.w700,
//                                                                                                     height: 1.20,
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                                 Container(
//                                                                                     width: 22,
//                                                                                     height: 24,
//                                                                                     child: Stack(
//                                                                                         children: [
//                                                                                             Positioned(
//                                                                                                 left: 0,
//                                                                                                 top: 0,
//                                                                                                 child: Text(
//                                                                                                     'DH',
//                                                                                                     style: TextStyle(
//                                                                                                         color: const Color(0xFF0C8C96),
//                                                                                                         fontSize: 16,
//                                                                                                         fontFamily: 'Space Grotesk',
//                                                                                                         fontWeight: FontWeight.w400,
//                                                                                                         height: 1.50,
//                                                                                                     ),
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                             ],
//                                                                         ),
//                                                                     ],
//                                                                 ),
//                                                             ),
//                                                         ),
//                                                         ConstrainedBox(
//                                                             constraints: BoxConstraints(minHeight: 72),
//                                                             child: Container(
//                                                                 width: 402,
//                                                                 height: 72,
//                                                                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                                                                 decoration: BoxDecoration(color: const Color(0xFFF9F9F9)),
//                                                                 child: Row(
//                                                                     mainAxisSize: MainAxisSize.min,
//                                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                                                     spacing: 16,
//                                                                     children: [
//                                                                         Container(
//                                                                             height: 46,
//                                                                             child: Column(
//                                                                                 mainAxisSize: MainAxisSize.min,
//                                                                                 mainAxisAlignment: MainAxisAlignment.center,
//                                                                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                 children: [
//                                                                                     Container(
//                                                                                         width: 145,
//                                                                                         clipBehavior: Clip.antiAlias,
//                                                                                         decoration: BoxDecoration(),
//                                                                                         child: Column(
//                                                                                             mainAxisSize: MainAxisSize.min,
//                                                                                             mainAxisAlignment: MainAxisAlignment.start,
//                                                                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                             children: [
//                                                                                                 SizedBox(
//                                                                                                     width: 145,
//                                                                                                     child: Text(
//                                                                                                         'Emily Davis',
//                                                                                                         style: TextStyle(
//                                                                                                             color: const Color(0xFF111416),
//                                                                                                             fontSize: 16,
//                                                                                                             fontFamily: 'Space Grotesk',
//                                                                                                             fontWeight: FontWeight.w500,
//                                                                                                             height: 1.50,
//                                                                                                         ),
//                                                                                                     ),
//                                                                                                 ),
//                                                                                             ],
//                                                                                         ),
//                                                                                     ),
//                                                                                     Container(
//                                                                                         clipBehavior: Clip.antiAlias,
//                                                                                         decoration: BoxDecoration(),
//                                                                                         child: Column(
//                                                                                             mainAxisSize: MainAxisSize.min,
//                                                                                             mainAxisAlignment: MainAxisAlignment.start,
//                                                                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                             children: [
//                                                                                                 Text(
//                                                                                                     '789 Pine Ln, Anytown',
//                                                                                                     style: TextStyle(
//                                                                                                         color: const Color(0xFF66707F),
//                                                                                                         fontSize: 14,
//                                                                                                         fontFamily: 'Space Grotesk',
//                                                                                                         fontWeight: FontWeight.w400,
//                                                                                                         height: 1.50,
//                                                                                                     ),
//                                                                                                 ),
//                                                                                             ],
//                                                                                         ),
//                                                                                     ),
//                                                                                 ],
//                                                                             ),
//                                                                         ),
//                                                                         Row(
//                                                                             mainAxisSize: MainAxisSize.min,
//                                                                             mainAxisAlignment: MainAxisAlignment.start,
//                                                                             crossAxisAlignment: CrossAxisAlignment.center,
//                                                                             spacing: 4,
//                                                                             children: [
//                                                                                 Container(
//                                                                                     height: 24,
//                                                                                     child: Row(
//                                                                                         mainAxisSize: MainAxisSize.min,
//                                                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                         spacing: 5,
//                                                                                         children: [
//                                                                                             Text(
//                                                                                                 '7654.00',
//                                                                                                 style: TextStyle(
//                                                                                                     color: const Color(0xFF1B3F77),
//                                                                                                     fontSize: 20,
//                                                                                                     fontFamily: 'Space Grotesk',
//                                                                                                     fontWeight: FontWeight.w700,
//                                                                                                     height: 1.20,
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                                 Container(
//                                                                                     width: 22,
//                                                                                     height: 24,
//                                                                                     child: Stack(
//                                                                                         children: [
//                                                                                             Positioned(
//                                                                                                 left: 0,
//                                                                                                 top: 0,
//                                                                                                 child: Text(
//                                                                                                     'DH',
//                                                                                                     style: TextStyle(
//                                                                                                         color: const Color(0xFF1B3F77),
//                                                                                                         fontSize: 16,
//                                                                                                         fontFamily: 'Space Grotesk',
//                                                                                                         fontWeight: FontWeight.w400,
//                                                                                                         height: 1.50,
//                                                                                                     ),
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                             ],
//                                                                         ),
//                                                                     ],
//                                                                 ),
//                                                             ),
//                                                         ),
//                                                         ConstrainedBox(
//                                                             constraints: BoxConstraints(minHeight: 72),
//                                                             child: Container(
//                                                                 width: 402,
//                                                                 height: 72,
//                                                                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                                                                 decoration: BoxDecoration(color: const Color(0xFFF9F9F9)),
//                                                                 child: Row(
//                                                                     mainAxisSize: MainAxisSize.min,
//                                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                                                     spacing: 16,
//                                                                     children: [
//                                                                         Column(
//                                                                             mainAxisSize: MainAxisSize.min,
//                                                                             mainAxisAlignment: MainAxisAlignment.center,
//                                                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                                                             children: [
//                                                                                 Container(
//                                                                                     width: 137,
//                                                                                     clipBehavior: Clip.antiAlias,
//                                                                                     decoration: BoxDecoration(),
//                                                                                     child: Column(
//                                                                                         mainAxisSize: MainAxisSize.min,
//                                                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                         children: [
//                                                                                             SizedBox(
//                                                                                                 width: 137,
//                                                                                                 child: Text(
//                                                                                                     'David Wilson',
//                                                                                                     style: TextStyle(
//                                                                                                         color: const Color(0xFF111416),
//                                                                                                         fontSize: 16,
//                                                                                                         fontFamily: 'Space Grotesk',
//                                                                                                         fontWeight: FontWeight.w500,
//                                                                                                         height: 1.50,
//                                                                                                     ),
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                                 Container(
//                                                                                     clipBehavior: Clip.antiAlias,
//                                                                                     decoration: BoxDecoration(),
//                                                                                     child: Column(
//                                                                                         mainAxisSize: MainAxisSize.min,
//                                                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                         children: [
//                                                                                             Text(
//                                                                                                 '101 Elm Rd, Anytown',
//                                                                                                 style: TextStyle(
//                                                                                                     color: const Color(0xFF66707F),
//                                                                                                     fontSize: 14,
//                                                                                                     fontFamily: 'Space Grotesk',
//                                                                                                     fontWeight: FontWeight.w400,
//                                                                                                     height: 1.50,
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                             ],
//                                                                         ),
//                                                                         Row(
//                                                                             mainAxisSize: MainAxisSize.min,
//                                                                             mainAxisAlignment: MainAxisAlignment.start,
//                                                                             crossAxisAlignment: CrossAxisAlignment.center,
//                                                                             spacing: 4,
//                                                                             children: [
//                                                                                 Container(
//                                                                                     height: 24,
//                                                                                     child: Row(
//                                                                                         mainAxisSize: MainAxisSize.min,
//                                                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                         spacing: 5,
//                                                                                         children: [
//                                                                                             Text(
//                                                                                                 '25.00',
//                                                                                                 style: TextStyle(
//                                                                                                     color: const Color(0xFF0C8C96),
//                                                                                                     fontSize: 20,
//                                                                                                     fontFamily: 'Space Grotesk',
//                                                                                                     fontWeight: FontWeight.w700,
//                                                                                                     height: 1.20,
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                                 Container(
//                                                                                     width: 22,
//                                                                                     height: 24,
//                                                                                     child: Stack(
//                                                                                         children: [
//                                                                                             Positioned(
//                                                                                                 left: 0,
//                                                                                                 top: 0,
//                                                                                                 child: Text(
//                                                                                                     'DH',
//                                                                                                     style: TextStyle(
//                                                                                                         color: const Color(0xFF0C8C96),
//                                                                                                         fontSize: 16,
//                                                                                                         fontFamily: 'Space Grotesk',
//                                                                                                         fontWeight: FontWeight.w400,
//                                                                                                         height: 1.50,
//                                                                                                     ),
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                             ],
//                                                                         ),
//                                                                     ],
//                                                                 ),
//                                                             ),
//                                                         ),
//                                                         ConstrainedBox(
//                                                             constraints: BoxConstraints(minHeight: 72),
//                                                             child: Container(
//                                                                 width: 402,
//                                                                 height: 72,
//                                                                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                                                                 decoration: BoxDecoration(color: const Color(0xFFF9F9F9)),
//                                                                 child: Row(
//                                                                     mainAxisSize: MainAxisSize.min,
//                                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                                                     spacing: 16,
//                                                                     children: [
//                                                                         Column(
//                                                                             mainAxisSize: MainAxisSize.min,
//                                                                             mainAxisAlignment: MainAxisAlignment.center,
//                                                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                                                             children: [
//                                                                                 Container(
//                                                                                     width: 155,
//                                                                                     clipBehavior: Clip.antiAlias,
//                                                                                     decoration: BoxDecoration(),
//                                                                                     child: Column(
//                                                                                         mainAxisSize: MainAxisSize.min,
//                                                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                         children: [
//                                                                                             SizedBox(
//                                                                                                 width: 155,
//                                                                                                 child: Text(
//                                                                                                     'Jessica Garcia',
//                                                                                                     style: TextStyle(
//                                                                                                         color: const Color(0xFF111416),
//                                                                                                         fontSize: 16,
//                                                                                                         fontFamily: 'Space Grotesk',
//                                                                                                         fontWeight: FontWeight.w500,
//                                                                                                         height: 1.50,
//                                                                                                     ),
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                                 Container(
//                                                                                     clipBehavior: Clip.antiAlias,
//                                                                                     decoration: BoxDecoration(),
//                                                                                     child: Column(
//                                                                                         mainAxisSize: MainAxisSize.min,
//                                                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                         children: [
//                                                                                             Text(
//                                                                                                 '222 Maple Dr, Anytown',
//                                                                                                 style: TextStyle(
//                                                                                                     color: const Color(0xFF66707F),
//                                                                                                     fontSize: 14,
//                                                                                                     fontFamily: 'Space Grotesk',
//                                                                                                     fontWeight: FontWeight.w400,
//                                                                                                     height: 1.50,
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                             ],
//                                                                         ),
//                                                                         Row(
//                                                                             mainAxisSize: MainAxisSize.min,
//                                                                             mainAxisAlignment: MainAxisAlignment.start,
//                                                                             crossAxisAlignment: CrossAxisAlignment.center,
//                                                                             spacing: 4,
//                                                                             children: [
//                                                                                 Container(
//                                                                                     height: 24,
//                                                                                     child: Row(
//                                                                                         mainAxisSize: MainAxisSize.min,
//                                                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                         spacing: 5,
//                                                                                         children: [
//                                                                                             Text(
//                                                                                                 '436.00',
//                                                                                                 style: TextStyle(
//                                                                                                     color: const Color(0xFF1B3F77),
//                                                                                                     fontSize: 20,
//                                                                                                     fontFamily: 'Space Grotesk',
//                                                                                                     fontWeight: FontWeight.w700,
//                                                                                                     height: 1.20,
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                                 Container(
//                                                                                     width: 22,
//                                                                                     height: 24,
//                                                                                     child: Stack(
//                                                                                         children: [
//                                                                                             Positioned(
//                                                                                                 left: 0,
//                                                                                                 top: 0,
//                                                                                                 child: Text(
//                                                                                                     'DH',
//                                                                                                     style: TextStyle(
//                                                                                                         color: const Color(0xFF1B3F77),
//                                                                                                         fontSize: 16,
//                                                                                                         fontFamily: 'Space Grotesk',
//                                                                                                         fontWeight: FontWeight.w400,
//                                                                                                         height: 1.50,
//                                                                                                     ),
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                             ],
//                                                                         ),
//                                                                     ],
//                                                                 ),
//                                                             ),
//                                                         ),
//                                                         ConstrainedBox(
//                                                             constraints: BoxConstraints(minHeight: 72),
//                                                             child: Container(
//                                                                 width: 402,
//                                                                 height: 72,
//                                                                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                                                                 decoration: BoxDecoration(color: const Color(0xFFF9F9F9)),
//                                                                 child: Row(
//                                                                     mainAxisSize: MainAxisSize.min,
//                                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                                                     spacing: 16,
//                                                                     children: [
//                                                                         Column(
//                                                                             mainAxisSize: MainAxisSize.min,
//                                                                             mainAxisAlignment: MainAxisAlignment.center,
//                                                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                                                             children: [
//                                                                                 Container(
//                                                                                     width: 148,
//                                                                                     clipBehavior: Clip.antiAlias,
//                                                                                     decoration: BoxDecoration(),
//                                                                                     child: Column(
//                                                                                         mainAxisSize: MainAxisSize.min,
//                                                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                         children: [
//                                                                                             SizedBox(
//                                                                                                 width: 148,
//                                                                                                 child: Text(
//                                                                                                     'Amanda Rodriguez',
//                                                                                                     style: TextStyle(
//                                                                                                         color: const Color(0xFF111416),
//                                                                                                         fontSize: 16,
//                                                                                                         fontFamily: 'Space Grotesk',
//                                                                                                         fontWeight: FontWeight.w500,
//                                                                                                         height: 1.50,
//                                                                                                     ),
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                                 Container(
//                                                                                     clipBehavior: Clip.antiAlias,
//                                                                                     decoration: BoxDecoration(),
//                                                                                     child: Column(
//                                                                                         mainAxisSize: MainAxisSize.min,
//                                                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                         children: [
//                                                                                             Text(
//                                                                                                 '444 Birch Pl, Anytown',
//                                                                                                 style: TextStyle(
//                                                                                                     color: const Color(0xFF66707F),
//                                                                                                     fontSize: 14,
//                                                                                                     fontFamily: 'Space Grotesk',
//                                                                                                     fontWeight: FontWeight.w400,
//                                                                                                     height: 1.50,
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                             ],
//                                                                         ),
//                                                                         Row(
//                                                                             mainAxisSize: MainAxisSize.min,
//                                                                             mainAxisAlignment: MainAxisAlignment.start,
//                                                                             crossAxisAlignment: CrossAxisAlignment.center,
//                                                                             spacing: 4,
//                                                                             children: [
//                                                                                 Container(
//                                                                                     height: 24,
//                                                                                     child: Row(
//                                                                                         mainAxisSize: MainAxisSize.min,
//                                                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                         spacing: 5,
//                                                                                         children: [
//                                                                                             Text(
//                                                                                                 '937.00',
//                                                                                                 style: TextStyle(
//                                                                                                     color: const Color(0xFF1B3F77),
//                                                                                                     fontSize: 20,
//                                                                                                     fontFamily: 'Space Grotesk',
//                                                                                                     fontWeight: FontWeight.w700,
//                                                                                                     height: 1.20,
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                                 Container(
//                                                                                     width: 22,
//                                                                                     height: 24,
//                                                                                     child: Stack(
//                                                                                         children: [
//                                                                                             Positioned(
//                                                                                                 left: 0,
//                                                                                                 top: 0,
//                                                                                                 child: Text(
//                                                                                                     'DH',
//                                                                                                     style: TextStyle(
//                                                                                                         color: const Color(0xFF1B3F77),
//                                                                                                         fontSize: 16,
//                                                                                                         fontFamily: 'Space Grotesk',
//                                                                                                         fontWeight: FontWeight.w400,
//                                                                                                         height: 1.50,
//                                                                                                     ),
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                             ],
//                                                                         ),
//                                                                     ],
//                                                                 ),
//                                                             ),
//                                                         ),
//                                                         ConstrainedBox(
//                                                             constraints: BoxConstraints(minHeight: 72),
//                                                             child: Container(
//                                                                 width: 402,
//                                                                 height: 72,
//                                                                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                                                                 decoration: BoxDecoration(color: const Color(0xFFF9F9F9)),
//                                                                 child: Row(
//                                                                     mainAxisSize: MainAxisSize.min,
//                                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                                                     spacing: 16,
//                                                                     children: [
//                                                                         Column(
//                                                                             mainAxisSize: MainAxisSize.min,
//                                                                             mainAxisAlignment: MainAxisAlignment.center,
//                                                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                                                             children: [
//                                                                                 Container(
//                                                                                     width: 162,
//                                                                                     clipBehavior: Clip.antiAlias,
//                                                                                     decoration: BoxDecoration(),
//                                                                                     child: Column(
//                                                                                         mainAxisSize: MainAxisSize.min,
//                                                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                         children: [
//                                                                                             SizedBox(
//                                                                                                 width: 162,
//                                                                                                 child: Text(
//                                                                                                     'Christopher Lee',
//                                                                                                     style: TextStyle(
//                                                                                                         color: const Color(0xFF111416),
//                                                                                                         fontSize: 16,
//                                                                                                         fontFamily: 'Space Grotesk',
//                                                                                                         fontWeight: FontWeight.w500,
//                                                                                                         height: 1.50,
//                                                                                                     ),
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                                 Container(
//                                                                                     clipBehavior: Clip.antiAlias,
//                                                                                     decoration: BoxDecoration(),
//                                                                                     child: Column(
//                                                                                         mainAxisSize: MainAxisSize.min,
//                                                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                         children: [
//                                                                                             Text(
//                                                                                                 '555 Walnut St, Anytown',
//                                                                                                 style: TextStyle(
//                                                                                                     color: const Color(0xFF66707F),
//                                                                                                     fontSize: 14,
//                                                                                                     fontFamily: 'Space Grotesk',
//                                                                                                     fontWeight: FontWeight.w400,
//                                                                                                     height: 1.50,
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                             ],
//                                                                         ),
//                                                                         Row(
//                                                                             mainAxisSize: MainAxisSize.min,
//                                                                             mainAxisAlignment: MainAxisAlignment.start,
//                                                                             crossAxisAlignment: CrossAxisAlignment.center,
//                                                                             spacing: 4,
//                                                                             children: [
//                                                                                 Container(
//                                                                                     height: 24,
//                                                                                     child: Row(
//                                                                                         mainAxisSize: MainAxisSize.min,
//                                                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                         spacing: 5,
//                                                                                         children: [
//                                                                                             Text(
//                                                                                                 '0.00',
//                                                                                                 style: TextStyle(
//                                                                                                     color: const Color(0xFF0C8C96),
//                                                                                                     fontSize: 20,
//                                                                                                     fontFamily: 'Space Grotesk',
//                                                                                                     fontWeight: FontWeight.w700,
//                                                                                                     height: 1.20,
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                                 Container(
//                                                                                     width: 22,
//                                                                                     height: 24,
//                                                                                     child: Stack(
//                                                                                         children: [
//                                                                                             Positioned(
//                                                                                                 left: 0,
//                                                                                                 top: 0,
//                                                                                                 child: Text(
//                                                                                                     'DH',
//                                                                                                     style: TextStyle(
//                                                                                                         color: const Color(0xFF0C8C96),
//                                                                                                         fontSize: 16,
//                                                                                                         fontFamily: 'Space Grotesk',
//                                                                                                         fontWeight: FontWeight.w400,
//                                                                                                         height: 1.50,
//                                                                                                     ),
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                             ],
//                                                                         ),
//                                                                     ],
//                                                                 ),
//                                                             ),
//                                                         ),
//                                                         ConstrainedBox(
//                                                             constraints: BoxConstraints(minHeight: 72),
//                                                             child: Container(
//                                                                 width: 402,
//                                                                 height: 72,
//                                                                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                                                                 decoration: BoxDecoration(color: const Color(0xFFF9F9F9)),
//                                                                 child: Row(
//                                                                     mainAxisSize: MainAxisSize.min,
//                                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                                                     spacing: 16,
//                                                                     children: [
//                                                                         Column(
//                                                                             mainAxisSize: MainAxisSize.min,
//                                                                             mainAxisAlignment: MainAxisAlignment.center,
//                                                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                                                             children: [
//                                                                                 Container(
//                                                                                     width: 162,
//                                                                                     clipBehavior: Clip.antiAlias,
//                                                                                     decoration: BoxDecoration(),
//                                                                                     child: Column(
//                                                                                         mainAxisSize: MainAxisSize.min,
//                                                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                         children: [
//                                                                                             SizedBox(
//                                                                                                 width: 162,
//                                                                                                 child: Text(
//                                                                                                     'Christopher Lee',
//                                                                                                     style: TextStyle(
//                                                                                                         color: const Color(0xFF111416),
//                                                                                                         fontSize: 16,
//                                                                                                         fontFamily: 'Space Grotesk',
//                                                                                                         fontWeight: FontWeight.w500,
//                                                                                                         height: 1.50,
//                                                                                                     ),
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                                 Container(
//                                                                                     clipBehavior: Clip.antiAlias,
//                                                                                     decoration: BoxDecoration(),
//                                                                                     child: Column(
//                                                                                         mainAxisSize: MainAxisSize.min,
//                                                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                         children: [
//                                                                                             Text(
//                                                                                                 '555 Walnut St, Anytown',
//                                                                                                 style: TextStyle(
//                                                                                                     color: const Color(0xFF66707F),
//                                                                                                     fontSize: 14,
//                                                                                                     fontFamily: 'Space Grotesk',
//                                                                                                     fontWeight: FontWeight.w400,
//                                                                                                     height: 1.50,
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                             ],
//                                                                         ),
//                                                                         Row(
//                                                                             mainAxisSize: MainAxisSize.min,
//                                                                             mainAxisAlignment: MainAxisAlignment.start,
//                                                                             crossAxisAlignment: CrossAxisAlignment.center,
//                                                                             spacing: 4,
//                                                                             children: [
//                                                                                 Container(
//                                                                                     height: 24,
//                                                                                     child: Row(
//                                                                                         mainAxisSize: MainAxisSize.min,
//                                                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                         spacing: 5,
//                                                                                         children: [
//                                                                                             Text(
//                                                                                                 '14134.00',
//                                                                                                 style: TextStyle(
//                                                                                                     color: const Color(0xFF1B3F77),
//                                                                                                     fontSize: 20,
//                                                                                                     fontFamily: 'Space Grotesk',
//                                                                                                     fontWeight: FontWeight.w700,
//                                                                                                     height: 1.20,
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                                 Container(
//                                                                                     width: 22,
//                                                                                     height: 24,
//                                                                                     child: Stack(
//                                                                                         children: [
//                                                                                             Positioned(
//                                                                                                 left: 0,
//                                                                                                 top: 0,
//                                                                                                 child: Text(
//                                                                                                     'DH',
//                                                                                                     style: TextStyle(
//                                                                                                         color: const Color(0xFF1B3F77),
//                                                                                                         fontSize: 16,
//                                                                                                         fontFamily: 'Space Grotesk',
//                                                                                                         fontWeight: FontWeight.w400,
//                                                                                                         height: 1.50,
//                                                                                                     ),
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                             ],
//                                                                         ),
//                                                                     ],
//                                                                 ),
//                                                             ),
//                                                         ),
//                                                         ConstrainedBox(
//                                                             constraints: BoxConstraints(minHeight: 72),
//                                                             child: Container(
//                                                                 width: 402,
//                                                                 height: 72,
//                                                                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                                                                 decoration: BoxDecoration(color: const Color(0xFFF9F9F9)),
//                                                                 child: Row(
//                                                                     mainAxisSize: MainAxisSize.min,
//                                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                                                     spacing: 16,
//                                                                     children: [
//                                                                         Column(
//                                                                             mainAxisSize: MainAxisSize.min,
//                                                                             mainAxisAlignment: MainAxisAlignment.center,
//                                                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                                                             children: [
//                                                                                 Container(
//                                                                                     width: 162,
//                                                                                     clipBehavior: Clip.antiAlias,
//                                                                                     decoration: BoxDecoration(),
//                                                                                     child: Column(
//                                                                                         mainAxisSize: MainAxisSize.min,
//                                                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                         children: [
//                                                                                             SizedBox(
//                                                                                                 width: 162,
//                                                                                                 child: Text(
//                                                                                                     'Christopher Lee',
//                                                                                                     style: TextStyle(
//                                                                                                         color: const Color(0xFF111416),
//                                                                                                         fontSize: 16,
//                                                                                                         fontFamily: 'Space Grotesk',
//                                                                                                         fontWeight: FontWeight.w500,
//                                                                                                         height: 1.50,
//                                                                                                     ),
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                                 Container(
//                                                                                     clipBehavior: Clip.antiAlias,
//                                                                                     decoration: BoxDecoration(),
//                                                                                     child: Column(
//                                                                                         mainAxisSize: MainAxisSize.min,
//                                                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                         children: [
//                                                                                             Text(
//                                                                                                 '555 Walnut St, Anytown',
//                                                                                                 style: TextStyle(
//                                                                                                     color: const Color(0xFF66707F),
//                                                                                                     fontSize: 14,
//                                                                                                     fontFamily: 'Space Grotesk',
//                                                                                                     fontWeight: FontWeight.w400,
//                                                                                                     height: 1.50,
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                             ],
//                                                                         ),
//                                                                         Row(
//                                                                             mainAxisSize: MainAxisSize.min,
//                                                                             mainAxisAlignment: MainAxisAlignment.start,
//                                                                             crossAxisAlignment: CrossAxisAlignment.center,
//                                                                             spacing: 4,
//                                                                             children: [
//                                                                                 Container(
//                                                                                     height: 24,
//                                                                                     child: Row(
//                                                                                         mainAxisSize: MainAxisSize.min,
//                                                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                         spacing: 5,
//                                                                                         children: [
//                                                                                             Text(
//                                                                                                 '2542.00',
//                                                                                                 style: TextStyle(
//                                                                                                     color: const Color(0xFF1B3F77),
//                                                                                                     fontSize: 20,
//                                                                                                     fontFamily: 'Space Grotesk',
//                                                                                                     fontWeight: FontWeight.w700,
//                                                                                                     height: 1.20,
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                                 Container(
//                                                                                     width: 22,
//                                                                                     height: 24,
//                                                                                     child: Stack(
//                                                                                         children: [
//                                                                                             Positioned(
//                                                                                                 left: 0,
//                                                                                                 top: 0,
//                                                                                                 child: Text(
//                                                                                                     'DH',
//                                                                                                     style: TextStyle(
//                                                                                                         color: const Color(0xFF1B3F77),
//                                                                                                         fontSize: 16,
//                                                                                                         fontFamily: 'Space Grotesk',
//                                                                                                         fontWeight: FontWeight.w400,
//                                                                                                         height: 1.50,
//                                                                                                     ),
//                                                                                                 ),
//                                                                                             ),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                             ],
//                                                                         ),
//                                                                     ],
//                                                                 ),
//                                                             ),
//                                                         ),
//                                                     ],
//                                                 ),
//                                             ),
//                                         ],
//                                     ),
//                                 ),
//                             ),
//                             Container(
//                                 width: 402,
//                                 padding: const EdgeInsets.only(
//                                     top: 8,
//                                     left: 16,
//                                     right: 16,
//                                     bottom: 12,
//                                 ),
//                                 decoration: ShapeDecoration(
//                                     color: const Color(0xFFF9F9F9),
//                                     shape: RoundedRectangleBorder(
//                                         side: BorderSide(
//                                             width: 1,
//                                             color: const Color(0xFFF9F9F9),
//                                         ),
//                                     ),
//                                 ),
//                                 child: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     spacing: 8,
//                                     children: [
//                                         Container(
//                                             width: 86.50,
//                                             child: Column(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 mainAxisAlignment: MainAxisAlignment.start,
//                                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                                 spacing: 10,
//                                                 children: [
//                                                     Container(
//                                                         width: double.infinity,
//                                                         decoration: ShapeDecoration(
//                                                             shape: RoundedRectangleBorder(
//                                                                 borderRadius: BorderRadius.circular(16),
//                                                             ),
//                                                         ),
//                                                         child: Stack(
//                                                             children: [
//                                                                 Container(
//                                                                     height: 32,
//                                                                     child: Row(
//                                                                         mainAxisSize: MainAxisSize.min,
//                                                                         mainAxisAlignment: MainAxisAlignment.center,
//                                                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                                                         children: [
//                                                                             Expanded(
//                                                                                 child: Container(
//                                                                                     height: 24,
//                                                                                     clipBehavior: Clip.antiAlias,
//                                                                                     decoration: BoxDecoration(),
//                                                                                     child: Stack(
//                                                                                         children: [
//                                                                                             Positioned(left: undefined, top: undefined),
//                                                                                         ],
//                                                                                     ),
//                                                                                 ),
//                                                                             ),
//                                                                         ],
//                                                                     ),
//                                                                 ),
//                                                                 Column(
//                                                                     mainAxisSize: MainAxisSize.min,
//                                                                     mainAxisAlignment: MainAxisAlignment.start,
//                                                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                                                     children: [
//                                                                         Text(
//                                                                             'Home',
//                                                                             style: TextStyle(
//                                                                                 color: const Color(0xFF141414),
//                                                                                 fontSize: 12,
//                                                                                 fontFamily: 'Space Grotesk',
//                                                                                 fontWeight: FontWeight.w500,
//                                                                                 height: 1.50,
//                                                                             ),
//                                                                         ),
//                                                                     ],
//                                                                 ),
//                                                                 Positioned(
//                                                                     left: 11,
//                                                                     top: 64,
//                                                                     child: Container(
//                                                                         width: 65,
//                                                                         decoration: ShapeDecoration(
//                                                                             shape: RoundedRectangleBorder(
//                                                                                 side: BorderSide(
//                                                                                     width: 3,
//                                                                                     strokeAlign: BorderSide.strokeAlignCenter,
//                                                                                     color: const Color(0xFFF9F9F9),
//                                                                                 ),
//                                                                             ),
//                                                                         ),
//                                                                     ),
//                                                                 ),
//                                                             ],
//                                                         ),
//                                                     ),
//                                                 ],
//                                             ),
//                                         ),
//                                         Expanded(
//                                             child: Container(
//                                                 decoration: ShapeDecoration(
//                                                     color: const Color(0xFFA8D03D),
//                                                     shape: RoundedRectangleBorder(
//                                                         borderRadius: BorderRadius.circular(16),
//                                                     ),
//                                                 ),
//                                                 child: Stack(
//                                                     children: [
//                                                         Container(
//                                                             height: 32,
//                                                             child: Row(
//                                                                 mainAxisSize: MainAxisSize.min,
//                                                                 mainAxisAlignment: MainAxisAlignment.center,
//                                                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                                                 children: [
//                                                                     Expanded(
//                                                                         child: Container(
//                                                                             height: 24,
//                                                                             clipBehavior: Clip.antiAlias,
//                                                                             decoration: BoxDecoration(),
//                                                                             child: Stack(
//                                                                                 children: [
//                                                                                     Positioned(left: undefined, top: undefined),
//                                                                                 ],
//                                                                             ),
//                                                                         ),
//                                                                     ),
//                                                                 ],
//                                                             ),
//                                                         ),
//                                                         Column(
//                                                             mainAxisSize: MainAxisSize.min,
//                                                             mainAxisAlignment: MainAxisAlignment.start,
//                                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                                             children: [
//                                                                 Text(
//                                                                     'Clients',
//                                                                     style: TextStyle(
//                                                                         color: const Color(0xFF66707F),
//                                                                         fontSize: 12,
//                                                                         fontFamily: 'Space Grotesk',
//                                                                         fontWeight: FontWeight.w500,
//                                                                         height: 1.50,
//                                                                     ),
//                                                                 ),
//                                                             ],
//                                                         ),
//                                                         Positioned(
//                                                             left: 11,
//                                                             top: 63,
//                                                             child: Container(
//                                                                 width: 65,
//                                                                 decoration: ShapeDecoration(
//                                                                     shape: RoundedRectangleBorder(
//                                                                         side: BorderSide(
//                                                                             width: 3,
//                                                                             strokeAlign: BorderSide.strokeAlignCenter,
//                                                                             color: const Color(0xFFA8D03D),
//                                                                         ),
//                                                                     ),
//                                                                 ),
//                                                             ),
//                                                         ),
//                                                     ],
//                                                 ),
//                                             ),
//                                         ),
//                                         Expanded(
//                                             child: Container(
//                                                 decoration: ShapeDecoration(
//                                                     shape: RoundedRectangleBorder(
//                                                         borderRadius: BorderRadius.circular(16),
//                                                     ),
//                                                 ),
//                                                 child: Stack(
//                                                     children: [
//                                                         Container(
//                                                             height: 32,
//                                                             child: Row(
//                                                                 mainAxisSize: MainAxisSize.min,
//                                                                 mainAxisAlignment: MainAxisAlignment.center,
//                                                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                                                 children: [
//                                                                     Expanded(
//                                                                         child: Container(
//                                                                             height: 24,
//                                                                             clipBehavior: Clip.antiAlias,
//                                                                             decoration: BoxDecoration(),
//                                                                             child: Stack(
//                                                                                 children: [
//                                                                                     Positioned(left: undefined, top: undefined),
//                                                                                 ],
//                                                                             ),
//                                                                         ),
//                                                                     ),
//                                                                 ],
//                                                             ),
//                                                         ),
//                                                         Column(
//                                                             mainAxisSize: MainAxisSize.min,
//                                                             mainAxisAlignment: MainAxisAlignment.start,
//                                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                                             children: [
//                                                                 Text(
//                                                                     'History',
//                                                                     style: TextStyle(
//                                                                         color: const Color(0xFF66707F),
//                                                                         fontSize: 12,
//                                                                         fontFamily: 'Space Grotesk',
//                                                                         fontWeight: FontWeight.w500,
//                                                                         height: 1.50,
//                                                                     ),
//                                                                 ),
//                                                             ],
//                                                         ),
//                                                         Positioned(
//                                                             left: 11,
//                                                             top: 63,
//                                                             child: Container(
//                                                                 width: 65,
//                                                                 decoration: ShapeDecoration(
//                                                                     shape: RoundedRectangleBorder(
//                                                                         side: BorderSide(
//                                                                             width: 3,
//                                                                             strokeAlign: BorderSide.strokeAlignCenter,
//                                                                             color: const Color(0xFFF9F9F9),
//                                                                         ),
//                                                                     ),
//                                                                 ),
//                                                             ),
//                                                         ),
//                                                     ],
//                                                 ),
//                                             ),
//                                         ),
//                                         Expanded(
//                                             child: Container(
//                                                 decoration: ShapeDecoration(
//                                                     shape: RoundedRectangleBorder(
//                                                         borderRadius: BorderRadius.circular(16),
//                                                     ),
//                                                 ),
//                                                 child: Stack(
//                                                     children: [
//                                                         Container(
//                                                             height: 32,
//                                                             child: Row(
//                                                                 mainAxisSize: MainAxisSize.min,
//                                                                 mainAxisAlignment: MainAxisAlignment.center,
//                                                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                                                 children: [
//                                                                     Expanded(
//                                                                         child: Container(
//                                                                             height: 24,
//                                                                             clipBehavior: Clip.antiAlias,
//                                                                             decoration: BoxDecoration(),
//                                                                             child: Stack(
//                                                                                 children: [
//                                                                                     Positioned(left: undefined, top: undefined),
//                                                                                 ],
//                                                                             ),
//                                                                         ),
//                                                                     ),
//                                                                 ],
//                                                             ),
//                                                         ),
//                                                         Column(
//                                                             mainAxisSize: MainAxisSize.min,
//                                                             mainAxisAlignment: MainAxisAlignment.start,
//                                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                                             children: [
//                                                                 Text(
//                                                                     'Settings',
//                                                                     style: TextStyle(
//                                                                         color: const Color(0xFF66707F),
//                                                                         fontSize: 12,
//                                                                         fontFamily: 'Space Grotesk',
//                                                                         fontWeight: FontWeight.w500,
//                                                                         height: 1.50,
//                                                                     ),
//                                                                 ),
//                                                             ],
//                                                         ),
//                                                         Positioned(
//                                                             left: 11,
//                                                             top: 63,
//                                                             child: Container(
//                                                                 width: 65,
//                                                                 decoration: ShapeDecoration(
//                                                                     shape: RoundedRectangleBorder(
//                                                                         side: BorderSide(
//                                                                             width: 3,
//                                                                             strokeAlign: BorderSide.strokeAlignCenter,
//                                                                             color: const Color(0xFFF9F9F9),
//                                                                         ),
//                                                                     ),
//                                                                 ),
//                                                             ),
//                                                         ),
//                                                     ],
//                                                 ),
//                                             ),
//                                         ),
//                                     ],
//                                 ),
//                             ),
//                             Container(
//                                 width: double.infinity,
//                                 child: Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                         Container(
//                                             width: double.infinity,
//                                             height: 20,
//                                             decoration: BoxDecoration(color: const Color(0xFFF9F9F9)),
//                                         ),
//                                     ],
//                                 ),
//                             ),
//                         ],
//                     ),
//                 ),
//             ),
//         ],
//     ),
// )
