import 'package:flutter/material.dart';
import 'package:gaz/widgets/app_bar.dart';

class Dash extends StatefulWidget {
  const Dash({super.key});

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Dashboard',
        leftIcon: IconButton(
          icon: const Icon(Icons.contactless_sharp),
          onPressed: () {},
        ),
        rightIcon: null,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Welcome message
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 160),
            child: Container(
              width: 402,
              height: 54,
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              height: double.infinity,
                              padding: const EdgeInsets.all(16),
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Welcome, Ethan Carter',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Color(0xFF1B3F77),
                                      fontSize: 22,
                                      fontFamily: 'Futura Hv BT',
                                      fontWeight: FontWeight.w400,
                                      height: 1.09,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Date display
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 212,
                  child: Text(
                    'Monday, 12th August',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF0C8C96),
                      fontSize: 16,
                      fontFamily: 'Space Grotesk',
                      color: Color(0xFF0C8C96), // Custom color
                      fontSize: 16, // Font size
                      fontFamily: 'Space Grotesk', // Custom font
                      fontWeight: FontWeight.w400, // Normal weight
                      height: 1.31, // Line height
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Profile or avatar image section
          Container(
            width: double.infinity, // Full width
            padding: const EdgeInsets.only(
              top: 8,
              left: 16,
              right: 16,
            ), // Padding
            child: Row(
              mainAxisSize: MainAxisSize.min, // Minimum horizontal space
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center horizontally
              crossAxisAlignment: CrossAxisAlignment.start, // Align to top
              children: [
                Container(
                  width: 47, // Avatar width
                  height: 47, // Avatar height
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://placehold.co/47x47",
                      ), // Placeholder image
                      fit: BoxFit.contain, // Contain within box
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Main dashboard card section
          Container(
            width: double.infinity, // Full width
            padding: const EdgeInsets.all(16), // Padding on all sides
            child: Row(
              mainAxisSize: MainAxisSize.min, // Minimum horizontal space
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Space between children
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Center vertically
              children: [
                // Main card with target, collected, owed
                Container(
                  width: 310, // Card width
                  height: 220, // Card height
                  decoration: ShapeDecoration(
                    color: const Color(0xFFE2E2E2), // Card background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        16,
                      ), // Rounded corners
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Minimum vertical space
                    mainAxisAlignment: MainAxisAlignment.start, // Align to top
                    crossAxisAlignment:
                        CrossAxisAlignment.center, // Center horizontally
                    children: [
                      // Target amount section
                      Container(
                        width: 256, // Section width
                        height: 125, // Section height
                        clipBehavior: Clip.antiAlias, // Clip overflow
                        decoration: const BoxDecoration(), // No decoration
                        child: Row(
                          mainAxisSize:
                              MainAxisSize.min, // Minimum horizontal space
                          mainAxisAlignment:
                              MainAxisAlignment.center, // Center horizontally
                          crossAxisAlignment:
                              CrossAxisAlignment.center, // Center vertically
                          children: [
                            Container(
                              width: 217, // Target card width
                              height: 111, // Target card height
                              clipBehavior: Clip.antiAlias, // Clip overflow
                              decoration: ShapeDecoration(
                                color: const Color(0xFF6BC6F0), // Card color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    16,
                                  ), // Rounded corners
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0xFF66707F), // Shadow color
                                    blurRadius: 0,
                                    offset: Offset(3, 3), // Shadow offset
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisSize:
                                    MainAxisSize.min, // Minimum vertical space
                                mainAxisAlignment:
                                    MainAxisAlignment
                                        .center, // Center vertically
                                crossAxisAlignment:
                                    CrossAxisAlignment.start, // Align to left
                                children: [
                                  // Target amount value
                                  ConstrainedBox(
                                    constraints: const BoxConstraints(
                                      minWidth: 150,
                                    ), // Minimum width
                                    child: SizedBox(
                                      width: double.infinity, // Full width
                                      height: 40, // Height for value
                                      child: Row(
                                        mainAxisSize:
                                            MainAxisSize
                                                .min, // Minimum horizontal space
                                        mainAxisAlignment:
                                            MainAxisAlignment
                                                .center, // Center horizontally
                                        crossAxisAlignment:
                                            CrossAxisAlignment
                                                .center, // Center vertically
                                        children: [
                                          SizedBox(
                                            width: 217, // Value width
                                            height: 41, // Value height
                                            child: ConstrainedBox(
                                              constraints: const BoxConstraints(
                                                minHeight: 32,
                                              ), // Minimum height
                                              child: const Text(
                                                '484848', // Target amount value (static)
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(
                                                    0xFF1B3F77,
                                                  ), // Text color
                                                  fontSize:
                                                      40, // Large font size
                                                  fontFamily:
                                                      'Space Grotesk', // Custom font
                                                  fontWeight:
                                                      FontWeight
                                                          .w600, // Semi-bold
                                                  height: 0.53, // Line height
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Target amount label
                                  SizedBox(
                                    width: double.infinity, // Full width
                                    child: Column(
                                      mainAxisSize:
                                          MainAxisSize
                                              .min, // Minimum vertical space
                                      mainAxisAlignment:
                                          MainAxisAlignment
                                              .start, // Align to top
                                      crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start, // Align to left
                                      children: [
                                        SizedBox(
                                          width: 217, // Label width
                                          child: const Text(
                                            'Target Amount', // Label text
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(
                                                0xFF0F1911,
                                              ), // Label color
                                              fontSize: 16, // Font size
                                              fontFamily:
                                                  'Futura Hv BT', // Custom font
                                              fontWeight:
                                                  FontWeight
                                                      .w400, // Normal weight
                                              height: 1.25, // Line height
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Collected and Owed section
                      SizedBox(
                        width: double.infinity, // Full width
                        child: Row(
                          mainAxisSize: MainAxisSize.min, // Minimum horizontal space
                          mainAxisAlignment: MainAxisAlignment.start, // Align to left
                          crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
                          children: [
                            // Collected card
                            Container(
                              width: 151, // Card width
                              height: 87, // Card height
                              clipBehavior: Clip.antiAlias, // Clip overflow
                              decoration:
                                  const BoxDecoration(), // No decoration
                                mainAxisSize:
                                    MainAxisSize
                                        .min, // Minimum horizontal space
                                mainAxisAlignment:
                                    MainAxisAlignment
                                        .center, // Center horizontally
                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .center, // Center vertically
                                children: [
                                  Container(
                                    width: 143, // Card width
                                    height: 75, // Card height
                                    clipBehavior:
                                        Clip.antiAlias, // Clip overflow
                                    decoration: ShapeDecoration(
                                      color: const Color(
                                        0xFFA8D03D,
                                      ), // Card color
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          16,
                                        ), // Rounded corners
                                      ),
                                      shadows: const [
                                        BoxShadow(
                                          color: Color(
                                            0xFF66707F,
                                          ), // Shadow color
                                          blurRadius: 0,
                                          offset: Offset(3, 3), // Shadow offset
                                          spreadRadius: 0,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisSize:
                                          MainAxisSize
                                              .min, // Minimum vertical space
                                      mainAxisAlignment:
                                          MainAxisAlignment
                                              .center, // Center vertically
                                      crossAxisAlignment:
                                          CrossAxisAlignment
                                              .center, // Center horizontally
                                      children: [
                                        // Collected value
                                        ConstrainedBox(
                                          constraints: const BoxConstraints(
                                            minWidth: 150,
                                          ), // Minimum width
                                          child: SizedBox(
                                            width: 150, // Value width
                                            height: 40, // Value height
                                            child: Row(
                                              mainAxisSize:
                                                  MainAxisSize
                                                      .min, // Minimum horizontal space
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center, // Center horizontally
                                              crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .center, // Center vertically
                                              children: [
                                                SizedBox(
                                                  width: 150, // Value width
                                                  height: 41, // Value height
                                                  child: ConstrainedBox(
                                                    constraints:
                                                        const BoxConstraints(
                                                          minHeight: 32,
                                                        ), // Minimum height
                                                    child: const Text(
                                                      '48485', // Collected value (static)
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Color(
                                                          0xFF1B3F77,
                                                        ), // Text color
                                                        fontSize:
                                                            32, // Font size
                                                        fontFamily:
                                                            'Space Grotesk', // Custom font
                                                        fontWeight:
                                                            FontWeight
                                                                .w600, // Semi-bold
                                                        height:
                                                            0.66, // Line height
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        // Collected label
                                        Container(
                                          width: 150, // Label width
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 2,
                                          ), // Vertical padding
                                          child: Column(
                                            mainAxisSize:
                                                MainAxisSize
                                                    .min, // Minimum vertical space
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .start, // Align to top
                                            crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start, // Align to left
                                            children: [
                                              SizedBox(
                                                width: 150, // Label width
                                                child: const Text(
                                                  'Collected', // Label text
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color(
                                                      0xFF0F1911,
                                                    ), // Label color
                                                    fontSize: 16, // Font size
                                                    fontFamily:
                                                        'Futura Hv BT', // Custom font
                                                    fontWeight:
                                                        FontWeight
                                                            .w400, // Normal weight
                                                    height: 1.25, // Line height
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Owed card
                            Container(
                              width: 151, // Card width
                              height: 87, // Card height
                              clipBehavior: Clip.antiAlias, // Clip overflow
                              decoration:
                                  const BoxDecoration(), // No decoration
                              child: Row(
                                mainAxisSize:
                                    MainAxisSize
                                        .min, // Minimum horizontal space
                                mainAxisAlignment:
                                    MainAxisAlignment
                                        .center, // Center horizontally
                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .center, // Center vertically
                                children: [
                                  Container(
                                    width: 143, // Card width
                                    height: 75, // Card height
                                    clipBehavior:
                                        Clip.antiAlias, // Clip overflow
                                    decoration: ShapeDecoration(
                                      color: const Color(
                                        0xFFDBDBDB,
                                      ), // Card color
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          16,
                                        ), // Rounded corners
                                      ),
                                      shadows: const [
                                        BoxShadow(
                                          color: Color(
                                            0xFF66707F,
                                          ), // Shadow color
                                          blurRadius: 0,
                                          offset: Offset(3, 3), // Shadow offset
                                          spreadRadius: 0,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisSize:
                                          MainAxisSize
                                              .min, // Minimum vertical space
                                      mainAxisAlignment:
                                          MainAxisAlignment
                                              .center, // Center vertically
                                      crossAxisAlignment:
                                          CrossAxisAlignment
                                              .center, // Center horizontally
                                      children: [
                                        // Owed value
                                        ConstrainedBox(
                                          constraints: const BoxConstraints(
                                            minWidth: 150,
                                          ), // Minimum width
                                          child: SizedBox(
                                            width: 150, // Value width
                                            height: 40, // Value height
                                            child: Row(
                                              mainAxisSize:
                                                  MainAxisSize
                                                      .min, // Minimum horizontal space
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center, // Center horizontally
                                              crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .center, // Center vertically
                                              children: [
                                                SizedBox(
                                                  width: 150, // Value width
                                                  height: 41, // Value height
                                                  child: ConstrainedBox(
                                                    constraints:
                                                        const BoxConstraints(
                                                          minHeight: 32,
                                                        ), // Minimum height
                                                    child: const Text(
                                                      '48485', // Owed value (static)
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Color(
                                                          0xFF1B3F77,
                                                        ), // Text color
                                                        fontSize:
                                                            32, // Font size
                                                        fontFamily:
                                                            'Space Grotesk', // Custom font
                                                        fontWeight:
                                                            FontWeight
                                                                .w600, // Semi-bold
                                                        height:
                                                            0.66, // Line height
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        // Owed label
                                        Container(
                                          width: 150, // Label width
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 2,
                                          ), // Vertical padding
                                          child: Column(
                                            mainAxisSize:
                                                MainAxisSize
                                                    .min, // Minimum vertical space
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .start, // Align to top
                                            crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start, // Align to left
                                            children: [
                                              SizedBox(
                                                width: 150, // Label width
                                                child: const Text(
                                                  'Owed', // Label text
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color(
                                                      0xFF0F1911,
                                                    ), // Label color
                                                    fontSize: 16, // Font size
                                                    fontFamily:
                                                        'Futura Hv BT', // Custom font
                                                    fontWeight:
                                                        FontWeight
                                                            .w400, // Normal weight
                                                    height: 1.25, // Line height
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Currency or icon section (DH)
                Container(
                  width: 49, // Container width
                  height: 45, // Container height
                  padding: const EdgeInsets.all(10), // Padding on all sides
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Minimum vertical space
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center vertically
                    crossAxisAlignment:
                        CrossAxisAlignment.center, // Center horizontally
                    children: [
                      // Empty container for spacing or design
                      Container(
                        width: 10,
                        height: 10,
                        padding: const EdgeInsets.all(10),
                      ),
                      // Currency label
                      const Text(
                        'DH', // Currency or unit
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF0C111C), // Text color
                          fontSize: 22, // Font size
                          fontFamily: 'Space Grotesk', // Custom font
                          fontWeight: FontWeight.w400, // Normal weight
                          height: 1.09, // Line height
                        ),
                      ),
                      // Icon stack (decorative)
                      SizedBox(
                        width: 20, // Stack width
                        height: 28, // Stack height
                        child: Stack(
                          children: [
                            // Rotated image positioned at (20, 20)
                            Positioned(
                              left: 20,
                              top: 20,
                              child: Transform(
                                alignment: Alignment.center,
                                transform:
                                    Matrix4.identity()
                                      ..translate(0.0, 0.0)
                                      ..rotateZ(3.14), // 180 degree rotation
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://placehold.co/20x20",
                                      ), // Placeholder image
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Normal image positioned at (0, 8)
                            const Positioned(
                              left: 0,
                              top: 8,
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://placehold.co/20x20",
                                      ), // Placeholder image
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
