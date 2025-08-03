import 'package:flutter/material.dart';
import '../../../../core/models/delivery.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/overview_card.dart';
import '../widgets/delivery_list_item.dart';
import '../widgets/quick_action_button.dart';
import '../../../delivery/presentation/pages/delivery_details_page.dart';
import '../../../delivery/presentation/pages/new_delivery_page.dart';
import '../../../payment/presentation/pages/payment_collection_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<Delivery> deliveries = [];
  double totalRevenue = 0;
  double totalCollected = 0;
  int pendingDeliveries = 0;
  int overduePayments = 0;

  @override
  void initState() {
    super.initState();
    _loadMockData();
  }

  void _loadMockData() {
    deliveries = [
      Delivery(
        id: '1',
        clientName: 'John Smith',
        clientPhone: '+1234567890',
        address: '123 Main St, City, State',
        productName: 'Premium Widget',
        quantity: 5,
        unitPrice: 25.0,
        totalAmount: 125.0,
        amountPaid: 75.0,
        deliveryStatus: DeliveryStatus.delivered,
        paymentStatus: PaymentStatus.partial,
        deliveryDate: DateTime.now().subtract(const Duration(days: 2)),
      ),
      Delivery(
        id: '2',
        clientName: 'Sarah Johnson',
        clientPhone: '+1987654321',
        address: '456 Oak Ave, City, State',
        productName: 'Standard Package',
        quantity: 3,
        unitPrice: 15.0,
        totalAmount: 45.0,
        amountPaid: 45.0,
        deliveryStatus: DeliveryStatus.delivered,
        paymentStatus: PaymentStatus.paid,
        deliveryDate: DateTime.now().subtract(const Duration(days: 1)),
        completedDate: DateTime.now().subtract(const Duration(days: 1)),
      ),
      Delivery(
        id: '3',
        clientName: 'Mike Wilson',
        clientPhone: '+1122334455',
        address: '789 Pine Rd, City, State',
        productName: 'Deluxe Bundle',
        quantity: 2,
        unitPrice: 50.0,
        totalAmount: 100.0,
        amountPaid: 0.0,
        deliveryStatus: DeliveryStatus.pending,
        paymentStatus: PaymentStatus.pending,
        deliveryDate: DateTime.now().add(const Duration(days: 1)),
      ),
      Delivery(
        id: '4',
        clientName: 'Lisa Brown',
        clientPhone: '+1555666777',
        address: '321 Elm St, City, State',
        productName: 'Basic Kit',
        quantity: 4,
        unitPrice: 20.0,
        totalAmount: 80.0,
        amountPaid: 0.0,
        deliveryStatus: DeliveryStatus.delivered,
        paymentStatus: PaymentStatus.overdue,
        deliveryDate: DateTime.now().subtract(const Duration(days: 5)),
        completedDate: DateTime.now().subtract(const Duration(days: 5)),
      ),
    ];

    _calculateStats();
  }

  void _calculateStats() {
    totalRevenue = deliveries.fold(0, (sum, delivery) => sum + delivery.totalAmount);
    totalCollected = deliveries.fold(0, (sum, delivery) => sum + delivery.amountPaid);
    pendingDeliveries = deliveries.where((d) => d.deliveryStatus == DeliveryStatus.pending).length;
    overduePayments = deliveries.where((d) => d.paymentStatus == PaymentStatus.overdue).length;
  }

  void _showPaymentSelectionDialog(BuildContext context) {
    final unpaidDeliveries = deliveries.where((d) => d.remainingAmount > 0).toList();
    
    if (unpaidDeliveries.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No unpaid deliveries found'),
          backgroundColor: AppTheme.errorRed,
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Delivery for Payment'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: unpaidDeliveries.length,
            itemBuilder: (context, index) {
              final delivery = unpaidDeliveries[index];
              return ListTile(
                title: Text(delivery.clientName),
                subtitle: Text('${delivery.productName} - \$${delivery.remainingAmount.toStringAsFixed(2)} remaining'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentCollectionPage(delivery: delivery),
                    ),
                  );
                },
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // TODO: Implement notifications
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // TODO: Implement refresh logic
          await Future.delayed(const Duration(seconds: 1));
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Overview Cards
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.2,
                  children: [
                    OverviewCard(
                      title: 'Total Revenue',
                      value: '\$${totalRevenue.toStringAsFixed(0)}',
                      icon: Icons.attach_money,
                      color: AppTheme.deepNavy,
                    ),
                    OverviewCard(
                      title: 'Collected',
                      value: '\$${totalCollected.toStringAsFixed(0)}',
                      icon: Icons.payment,
                      color: AppTheme.teal,
                    ),
                    OverviewCard(
                      title: 'Pending',
                      value: pendingDeliveries.toString(),
                      icon: Icons.schedule,
                      color: AppTheme.deepNavy,
                    ),
                    OverviewCard(
                      title: 'Overdue',
                      value: overduePayments.toString(),
                      icon: Icons.warning,
                      color: AppTheme.errorRed,
                    ),
                  ],
                ),
                
                const SizedBox(height: 24),
                
                // Quick Actions
                Text(
                  'Quick Actions',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: QuickActionButton(
                        title: 'New Delivery',
                        icon: Icons.add,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NewDeliveryPage(),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: QuickActionButton(
                        title: 'Collect Payment',
                        icon: Icons.payment,
                        onTap: () {
                          // Show dialog to select delivery for payment
                          _showPaymentSelectionDialog(context);
                        },
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 24),
                
                // Recent Deliveries
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Deliveries',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TextButton(
                      onPressed: () {
                        // TODO: Navigate to all deliveries
                      },
                      child: const Text('View All'),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                
                // Delivery List
                ...deliveries.map((delivery) => DeliveryListItem(
                  delivery: delivery,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DeliveryDetailsPage(delivery: delivery),
                      ),
                    );
                  },
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 