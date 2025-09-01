import 'package:flutter/material.dart';

/// SyncScreen - Skeleton loading screen that displays while app is syncing
/// Matches the Figma design with gray placeholder elements
class SyncScreen extends StatefulWidget {
  const SyncScreen({super.key});

  @override
  State<SyncScreen> createState() => _SyncScreenState();
}

/// Navigates to the SyncScreen
Future<void> showSyncScreen(BuildContext context) async {
  // Push the SyncScreen onto the navigation stack
  await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const SyncScreen(),
    ),
  );
  // Wait for 500 milliseconds before closing the SyncScreen
  await Future.delayed(const Duration(milliseconds: 500));
  // Pop the SyncScreen if it's still on the stack
  if (Navigator.canPop(context)) {
    Navigator.pop(context);
  }
}

class _SyncScreenState extends State<SyncScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: const ShapeDecoration(
          color: Color(0xFFF0F0F0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Bar Skeleton
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
                bottom: 8,
              ),
              decoration: const BoxDecoration(color: Color(0xFFF0F0F0)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Left icon placeholder
                  Container(
                    width: 48,
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            color: Color(0xFFE6E6E6),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Title placeholder
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(right: 48),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 120,
                            height: 20,
                            decoration: const BoxDecoration(
                              color: Color(0xFFE6E6E6),
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
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

            // Welcome message skeleton
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    height: 24,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE6E6E6),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Date skeleton
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    height: 16,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE6E6E6),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Profile image skeleton
            Center(
              child: Container(
                width: 47,
                height: 47,
                decoration: const BoxDecoration(
                  color: Color(0xFFE6E6E6),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Main dashboard cards skeleton
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Target amount card skeleton
                  Container(
                    width: double.infinity,
                    height: 120,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE6E6E6),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Collected and Owed cards skeleton
                  Row(
                    children: [
                      // Collected card skeleton
                      Expanded(
                        child: Container(
                          height: 100,
                          decoration: const BoxDecoration(
                            color: Color(0xFFE6E6E6),
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Owed card skeleton
                      Expanded(
                        child: Container(
                          height: 100,
                          decoration: const BoxDecoration(
                            color: Color(0xFFE6E6E6),
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Currency section skeleton
                  Container(
                    width: 60,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE6E6E6),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Bottom navigation skeleton
            Container(
              width: double.infinity,
              height: 95,
              decoration: const BoxDecoration(color: Color(0xFFF9F9F9)),
              child: Stack(
                children: [
                  // Top border
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: double.infinity,
                      height: 20,
                      decoration: const BoxDecoration(color: Color(0xFFEFEFEF)),
                    ),
                  ),
                  // Navigation items
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                        top: 8,
                        left: 16,
                        right: 16,
                        bottom: 12,
                      ),
                      decoration: const ShapeDecoration(
                        color: Color(0xFFF9F9F9),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFF9F9F9)),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Home tab (active)
                          Container(
                            width: 86.50,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 32,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFA8D03D),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Home',
                                      style: TextStyle(
                                        color: Color(0xFF141414),
                                        fontSize: 12,
                                        fontFamily: 'Space Grotesk',
                                        fontWeight: FontWeight.w500,
                                        height: 1.50,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Container(
                                  width: 65,
                                  height: 3,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFA8D03D),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(2),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Other tabs
                          ...List.generate(3, (index) {
                            final tabNames = ['Clients', 'History', 'Settings'];
                            return Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 32,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFE6E6E6),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        tabNames[index],
                                        style: const TextStyle(
                                          color: Color(0xFF66707F),
                                          fontSize: 12,
                                          fontFamily: 'Space Grotesk',
                                          fontWeight: FontWeight.w500,
                                          height: 1.50,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Container(
                                    width: 65,
                                    height: 3,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFE6E6E6),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
