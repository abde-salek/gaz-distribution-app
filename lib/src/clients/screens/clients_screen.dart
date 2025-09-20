
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaz/src/clients/widgets/client_list.dart';
import 'package:gaz/providers/client_provider.dart';
import 'package:gaz/widgets/app_bar.dart';
import 'package:gaz/widgets/app_navigation_bar.dart';
import 'package:gaz/widgets/currency_switcher.dart';

// Clients screen to display a list of clients.//

// CLIENTS SCREEN
class ClientsScreen extends ConsumerStatefulWidget {
  const ClientsScreen({super.key});

  @override
  ConsumerState<ClientsScreen> createState() => _ClientsScreenState();
}

class _ClientsScreenState extends ConsumerState<ClientsScreen> {
  int _selectedIndex = 1; // Set to 1 for clients tab
  DisplayUnit _currentUnit = DisplayUnit.dh;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onUnitChanged(DisplayUnit unit) {
    setState(() {
      _currentUnit = unit;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Watch the provider to get the list of clients
    final clients = ref.watch(clientProvider);

    // SCAFFOLD
    return Scaffold(
      // APPBAR
      appBar: CustomAppBar(
        title: 'Clients',
        // Left icon for the app bar: SVG icon from the icons folder
        leftIcon: SizedBox(
          height: 10,
          width: 10,
          child: Image.asset('icons/add_client.png', fit: BoxFit.contain),
        ),
        rightIcon: CurrencySwitcher(
          initialUnit: _currentUnit,
          onUnitChanged: _onUnitChanged,
        ),
      ),
      // BODY
      body:
      // Container(
      //   width: Responsive.width(context),
      //   height: Responsive.height(context),
      //   decoration: ShapeDecoration(
      //     color: const Color(0xFFF9F9F9),
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(50),
      //     ),
      //   ),
      //   // MAIN COLUMN
      //   child:
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ConstrainedBox(
          //   constraints: BoxConstraints(minHeight: 402),
          //   child: Container(
          //     width: Responsive.width(context),
          //     height: Responsive.height(context),
          //     clipBehavior: Clip.antiAlias,
          //     decoration: ShapeDecoration(
          //       color: const Color(0xFFF9F9F9),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(50),
          //       ),
          //     ),
          //     child: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Expanded(
          //           child: Container(
          //             width: double.infinity,
          //             clipBehavior: Clip.antiAlias,
          //             decoration: BoxDecoration(),
          //             child: Column(
          //               mainAxisSize: MainAxisSize.min,
          //               mainAxisAlignment: MainAxisAlignment.start,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 // SEARCH BAR
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: double.infinity,
                                  padding: const EdgeInsets.only(left: 16),
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFEAEDEF),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        bottomLeft: Radius.circular(12),
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: Container(
                                          height: 24,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(),

                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: null,
                                                top: null,
                                                child: Container(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: Container(
                                    height: double.infinity,
                                    padding: const EdgeInsets.only(
                                      top: 8,
                                      left: 8,
                                      right: 16,
                                      bottom: 8,
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFEAEDEF),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Search  clients',
                                          style: TextStyle(
                                            color: const Color(0xFF66707F),
                                            fontSize: 16,
                                            fontFamily: 'Space Grotesk',
                                            fontWeight: FontWeight.w400,
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
          SingleChildScrollView(
            child: ClientList(
              onClientTap: () {
                // TODO: Navigate to client details
                print('Client tapped');
              },
              showSearchBar: true,
              searchHint: 'Search clients',
            ),
          ),
        ],
      ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}
