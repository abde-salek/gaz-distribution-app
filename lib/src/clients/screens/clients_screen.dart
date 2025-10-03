import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod
import 'package:gaz/core/app_colors.dart';
import 'package:gaz/src/clients/widgets/client_list.dart';
import 'package:gaz/core/app_assets.dart';
import 'package:gaz/core/app_text_styles.dart';
import 'package:gaz/widgets/app_bar.dart';
import 'package:gaz/widgets/app_navigation_bar.dart';

// Clients screen to display a list of clients.//

// CLIENTS SCREEN
class ClientsScreen extends ConsumerStatefulWidget {
  const ClientsScreen({super.key});

  @override
  ConsumerState<ClientsScreen> createState() => _ClientsScreenState();
}

class _ClientsScreenState extends ConsumerState<ClientsScreen> {
  int _selectedIndex = 1; // Set to 1 for clients tab

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Watch the provider to get the list of clients
    // final clients = ref.watch(clientProvider);

    // SCAFFOLD
    return Scaffold(
      // APPBAR
      appBar: CustomAppBar(
        title: 'Clients',
        // Left icon for the app bar: SVG icon from the icons folder
        leftIcon: SizedBox(
          height: 10,
          width: 10,
          child: Image.asset(AppAssets.addClient, fit: BoxFit.contain),
        ),
      ),
      // BODY
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: ShapeDecoration(
          color: const Color(0xFFF9F9F9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        // MAIN COLUMN
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: 844),
              child: Container(
                width: 402,
                height: 874,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF9F9F9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // HEADER
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.only(
                                top: 16,
                                left: 16,
                                right: 16,
                                bottom: 8,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF9F9F9),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 48,
                                    height: 48,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(width: 48, height: 2),
                                        Container(
                                          width: 32,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                "https://placehold.co/32x32",
                                              ),
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 282,
                                          child: Text(
                                            'Clients',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: AppColors.text,
                                              fontSize: 18,
                                              fontFamily:
                                                  AppTextStyles
                                                      .spaceGrotesk
                                                      .fontFamily,
                                              fontWeight: FontWeight.w700,
                                              height: 1.28,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 40,
                                    height: 45,
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          padding: const EdgeInsets.all(10),
                                        ),
                                        SizedBox(
                                          width: 40,
                                          height: 20,
                                          child: Text(
                                            'DH',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: const Color(0xFF0C111C),
                                              fontSize: 22,
                                              fontFamily:
                                                  AppTextStyles
                                                      .spaceGrotesk
                                                      .fontFamily,
                                              fontWeight: FontWeight.w400,
                                              height: 1.09,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                          height: 28,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 20,
                                                top: 20,
                                                child: Container(
                                                  transform:
                                                      Matrix4.identity()
                                                        ..rotateZ(3.14),
                                                  width: 20,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                        "https://placehold.co/20x20",
                                                      ),
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 0,
                                                top: 8,
                                                child: Container(
                                                  width: 20,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                        "https://placehold.co/20x20",
                                                      ),
                                                      fit: BoxFit.contain,
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
                            // SEARCH BAR
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ConstrainedBox(
                                    constraints: BoxConstraints(minWidth: 160),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: 48,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: double.infinity,
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: double.infinity,
                                                    padding:
                                                        const EdgeInsets.only(
                                                          left: 16,
                                                        ),
                                                    decoration: ShapeDecoration(
                                                      color: const Color(
                                                        0xFFEAEDEF,
                                                      ),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                              topLeft:
                                                                  Radius.circular(
                                                                    12,
                                                                  ),
                                                              bottomLeft:
                                                                  Radius.circular(
                                                                    12,
                                                                  ),
                                                            ),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            height: 24,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(),

                                                            child: Stack(
                                                              children: [
                                                                Positioned(
                                                                  left: null,
                                                                  top: null,
                                                                  child:
                                                                      Container(),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      height: double.infinity,
                                                      padding:
                                                          const EdgeInsets.only(
                                                            top: 8,
                                                            left: 8,
                                                            right: 16,
                                                            bottom: 8,
                                                          ),
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: ShapeDecoration(
                                                        color: const Color(
                                                          0xFFEAEDEF,
                                                        ),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                topRight:
                                                                    Radius.circular(
                                                                      12,
                                                                    ),
                                                                bottomRight:
                                                                    Radius.circular(
                                                                      12,
                                                                    ),
                                                              ),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Search  clients',
                                                            style: TextStyle(
                                                              color:
                                                                  const Color(
                                                                    0xFF66707F,
                                                                  ),
                                                              fontSize: 16,
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .spaceGrotesk
                                                                      .fontFamily,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              height: 1.50,
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
                                ],
                              ),
                            ),
                            // CLIENTS LIST - Using reusable widget
                            Expanded(
                              child: ClientList(
                                onClientTap: () {},
                                showSearchBar: true,
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
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}
