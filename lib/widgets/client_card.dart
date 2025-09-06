import 'package:flutter/material.dart';
import 'package:gaz/Core/app_colors.dart';
import 'package:gaz/models/client.dart';
import 'package:gaz/services/currency_service.dart';
import 'package:gaz/widgets/currency_switcher.dart';

class ClientCard extends StatelessWidget {
  final Client client;
  final VoidCallback? onTap;
  final DisplayUnit displayUnit;

  const ClientCard({
    super.key, 
    required this.client,
    this.onTap,
    this.displayUnit = DisplayUnit.dh,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasPositiveBalance = client.balance > 0;
    final Color balanceColor =
        hasPositiveBalance ? AppColors.text : AppColors.secondary;

    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 72),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 72,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: const BoxDecoration(color: AppColors.background),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    client.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.text,
                      fontSize: 16,
                      fontFamily: 'Space Grotesk',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    client.address,
                    style: const TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                      fontFamily: 'Space Grotesk',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
                          Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  CurrencyService.formatAmount(client.balance, displayUnit),
                  style: TextStyle(
                    color: balanceColor,
                    fontSize: 20,
                    fontFamily: 'Space Grotesk',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  CurrencyService.getUnitName(displayUnit),
                  style: TextStyle(
                    color: balanceColor,
                    fontSize: 16,
                    fontFamily: 'Space Grotesk',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
        ),
      ),
    );
  }
}
