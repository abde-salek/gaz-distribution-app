import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaz/core/responsive.dart';

/// DeliveryCard represents a single delivery entry for use in a delivery list.
/// It is not a list itself and should be used as a single item in a parent ListView or similar.

class DeliveryCard extends ConsumerWidget {
  /// Name of the client or recipient.
  final String name;
  final String address;

  /// List of icons/images representing delivery items or status.
  final List<String> iconUrls;
  /// List of values to display in the three boxes (e.g., quantities).
  final List<String> values;

  /// Time & Date of delivery (e.g., '17:06', '11 Sept.').
  final String time;
  final String date;

  //tap callback.
  final VoidCallback? onTap;

  const DeliveryCard({
    super.key,
    required this.name,
    required this.address,
    required this.iconUrls,
    required this.values,
    required this.time,
    required this.date,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Ensure iconUrls and values have exactly 3 items for the UI, fill with placeholders if needed
    final List<String> icons = List<String>.from(iconUrls)
      ..length = 3;
    for (int i = 0; i < 3; i++) {
      icons[i] = icons[i] ?? "https://placehold.co/27x27";
    }
    final List<String> boxValues = List<String>.from(values)
      ..length = 3;
    for (int i = 0; i < 3; i++) {
      boxValues[i] = boxValues[i] ?? '';
    }

    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 72),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: Responsive.height(context) * 0.072,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: const BoxDecoration(
            color: Color(0xFFF9F9F9),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left: Name and Address
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Responsive.width(context) * 0.145,
                    child: Text(
                      name,
                      style: const TextStyle(
                        color: Color(0xFF111416),
                        fontSize: 16,
                        fontFamily: 'Space Grotesk',
                        fontWeight: FontWeight.w500,
                        height: 1.50,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    address,
                    style: const TextStyle(
                      color: Color(0xFF66707F),
                      fontSize: 14,
                      fontFamily: 'Space Grotesk',
                      fontWeight: FontWeight.w400,
                      height: 1.50,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              // Middle: Icons and Value Boxes
              Container(
                width: 138,
                padding: const EdgeInsets.symmetric(horizontal: 12.36, vertical: 2.75),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icons Row
                    SizedBox(
                      width: 108,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // First Icon
                          Container(
                            width: 27.04,
                            height: 27.04,
                            alignment: Alignment.center,
                            child: Transform.rotate(
                              angle: 3.14,
                              child: Container(
                                width: 27.04,
                                height: 27.04,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(icons[0]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 17.18),
                          // Second Icon
                          Container(
                            width: 22.12,
                            height: 22.12,
                            alignment: Alignment.center,
                            child: Container(
                              width: 17.20,
                              height: 17.20,
                              padding: const EdgeInsets.all(1.72),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(icons[1]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 17.18),
                          // Third Icon
                          Container(
                            width: 22.12,
                            height: 22.12,
                            alignment: Alignment.center,
                            child: Transform.rotate(
                              angle: 3.14,
                              child: Container(
                                width: 12.78,
                                height: 12.78,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(icons[2]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 3.43),
                    // Value Boxes Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(3, (i) {
                        return Padding(
                          padding: EdgeInsets.only(right: i < 2 ? 9 : 0),
                          child: Container(
                            width: 34.33,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFD9D9D9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.67),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 34.08,
                              height: 17.17,
                              child: Text(
                                boxValues[i],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xFF1B3F77),
                                  fontSize: 11.60,
                                  fontFamily: 'Space Grotesk',
                                  fontWeight: FontWeight.w500,
                                  height: 1.05,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              // Right: Time and Date
              SizedBox(
                width: 78,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 41,
                      child: Text(
                        time,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: Color(0xFF111416),
                          fontSize: 16,
                          fontFamily: 'Space Grotesk',
                          fontWeight: FontWeight.w500,
                          height: 1.50,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 78,
                      child: Text(
                        date,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF66707F),
                          fontSize: 14,
                          fontFamily: 'Space Grotesk',
                          fontWeight: FontWeight.w400,
                          height: 1.50,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
