import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gaz/core/app_assets.dart';
import 'package:gaz/widgets/app_bar.dart';
import 'package:gaz/widgets/app_navigation_bar.dart';
import 'package:gaz/widgets/currency_switcher.dart';
import 'package:gaz/widgets/search_bar.dart';

class DeliveryHistoryScreen extends StatefulWidget {
  const DeliveryHistoryScreen({super.key});

  @override
  State<DeliveryHistoryScreen> createState() => _DeliveryHistoryScreenState();
}

class _DeliveryHistoryScreenState extends State<DeliveryHistoryScreen> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Delivery History',
        leftIcon: SizedBox(
          height: 10,
          width: 10,
          child: SvgPicture.asset(
            AppAssets.nfc,
            fit: BoxFit.contain, // Ensures the SVG scales to fit the SizedBox
          ),
        ),
        rightIcon: CurrencySwitcher(
          initialUnit: DisplayUnit.dh,
          onUnitChanged: (unit) {},
        ),
      ),
      // body:
      body: CustomScrollView(
        slivers: [
          // Search bar
          GazSearchBar(
            // Using (_) instead of () in the onChanged callback is important because the callback receives a parameter (the current text input).
            // The underscore (_) is a convention in Dart to indicate that the parameter is intentionally unused.
            // This makes the code clearer to readers and avoids unused variable warnings.
            hintText: 'Search deliveries',
            onChanged: (_) {},
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, clientId) => null,
              //DeliveryCard(clientId: clientId ), //DeliveryCard(),
            ),
          ),
          SliverToBoxAdapter(
            //child: DeliveryList(), // Add non-scrollable content
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }

  Widget DeliveryList() {
    return //delivery list section
    ConstrainedBox(
      constraints: BoxConstraints(),
      child: SizedBox(
        width: 20,
        height: 48,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: 20,
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
                      height: 20,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              height: 24,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Stack(
                                children: [
                                  //Positioned(left: undefined, top: undefined),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 20,
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Search  Delivery',
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
    );
  }
}
