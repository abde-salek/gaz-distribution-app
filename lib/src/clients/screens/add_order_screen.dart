// Add order screen.//
import 'package:flutter/material.dart';

class ProductData {
  final String size;
  final double price;
  int quantity;

  ProductData({
    required this.size,
    required this.price,
    required this.quantity,
  });
}

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({super.key});

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  int _selectedTabIndex = 1; // Clients tab selected
  double _paymentAmount = 0.0;
  final TextEditingController _paymentController = TextEditingController();

  List<ProductData> products = [
    ProductData(size: "Large", price: 2347.50, quantity: 4),
    ProductData(size: "Medium", price: 2347.50, quantity: 4),
    ProductData(size: "Small", price: 2347.50, quantity: 4),
  ];

  double get totalPrice {
    return products.fold(
      0.0,
      (sum, product) => sum + (product.price * product.quantity),
    );
  }

  void updateQuantity(int index, int newQuantity) {
    setState(() {
      products[index].quantity = newQuantity;
    });
  }

  void updatePaymentAmount(String value) {
    setState(() {
      _paymentAmount = double.tryParse(value) ?? 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),

                    // Select Quantity Title
                    const Text(
                      'Select Quantity',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF111827),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Product Variants
                    ...products.asMap().entries.map((entry) {
                      int index = entry.key;
                      ProductData product = entry.value;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _buildProductVariant(product, index),
                      );
                    }),

                    const SizedBox(height: 24),

                    // Payment Section
                    _buildPaymentSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Color(0xFFFAFAFA)],
        ),
        border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB), width: 1)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Row(
          children: [
            // Back Button
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xFFE5E7EB)),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x0F000000),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color(0xFF374151),
                  size: 24,
                ),
              ),
            ),

            // Title
            const Expanded(
              child: Text(
                'Order Details',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B3F77),
                ),
              ),
            ),

            // Currency Icon
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xFFE5E7EB)),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x0F000000),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'DH',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B3F77),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductVariant(ProductData product, int index) {
    double imageSize =
        product.size == "Large"
            ? 64
            : product.size == "Medium"
            ? 56
            : 48;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x05000000),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Product Image Placeholder
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Container(
                  width: imageSize,
                  height: imageSize,
                  decoration: BoxDecoration(
                    color: const Color(0xFF6BC6F0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.shopping_bag,
                    color: Color(0xFF1B3F77),
                    size: 24,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 16),

            // Product Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.size,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Prix ${product.size}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${product.price.toStringAsFixed(2)} DH',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF111827),
                    ),
                  ),
                ],
              ),
            ),

            // Quantity Controls
            Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Decrease Button
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color:
                            product.quantity > 0
                                ? const Color(0xFF6BC6F0)
                                : const Color(0xFFD1D5DB),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: IconButton(
                        onPressed:
                            product.quantity > 0
                                ? () =>
                                    updateQuantity(index, product.quantity - 1)
                                : null,
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.remove,
                          color: Color(0xFF1B3F77),
                          size: 16,
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    // Quantity Display
                    Container(
                      width: 64,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFF6BC6F0),
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '${product.quantity}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1B3F77),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    // Increase Button
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: const Color(0xFF6BC6F0),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: IconButton(
                        onPressed:
                            () => updateQuantity(index, product.quantity + 1),
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.add,
                          color: Color(0xFF1B3F77),
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Total Price
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFFFAFAFA), Color(0xFFF3F4F6)],
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE5E7EB)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Prix Total',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF111827),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      totalPrice.toStringAsFixed(2),
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1B3F77),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'DH',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 24),

        // Instant Payment Title
        const Text(
          'Instant Payment',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF111827),
          ),
        ),

        const SizedBox(height: 16),

        // Payment Input
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF6BC6F0), width: 2),
            boxShadow: const [
              BoxShadow(
                color: Color(0x05000000),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _paymentController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  onChanged: updatePaymentAmount,
                  decoration: const InputDecoration(
                    hintText: 'Enter amount to pay now',
                    hintStyle: TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 18,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                  ),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFF111827),
                  ),
                ),
              ),
              Container(
                width: 64,
                height: 64,
                decoration: const BoxDecoration(
                  color: Color(0xFF6BC6F0),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'DH',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B3F77),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Payment Summary
        if (_paymentAmount > 0) ...[
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFBFDBFE)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Amount Paid:',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                      Text(
                        '${_paymentAmount.toStringAsFixed(2)} DH',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1B3F77),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Remaining:',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                      Text(
                        '${(totalPrice - _paymentAmount).clamp(0.0, double.infinity).toStringAsFixed(2)} DH',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFDC2626),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],

        const SizedBox(height: 16),

        // Confirm Button
        SizedBox(
          width: double.infinity,
          height: 64,
          child: ElevatedButton(
            onPressed:
                totalPrice > 0
                    ? () {
                      // Handle confirm order
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              title: const Text('Order Confirmed'),
                              content: Text(
                                'Total: ${totalPrice.toStringAsFixed(2)} DH\nPaid: ${_paymentAmount.toStringAsFixed(2)} DH',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                      );
                    }
                    : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1B3F77),
              disabledBackgroundColor: const Color(0xFFD1D5DB),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
            ),
            child: const Text(
              'Confirm Order',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFE5E7EB), width: 1)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Row(
            children: [
              _buildNavItem(Icons.home, 'Home', 0),
              _buildNavItem(Icons.people, 'Clients', 1),
              _buildNavItem(Icons.history, 'History', 2),
              _buildNavItem(Icons.settings, 'Settings', 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isActive = _selectedTabIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFFA8D03D) : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            boxShadow:
                isActive
                    ? const [
                      BoxShadow(
                        color: Color(0x15000000),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ]
                    : null,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 24,
                color:
                    isActive
                        ? const Color(0xFF1B3F77)
                        : const Color(0xFF0C8C96),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color:
                      isActive
                          ? const Color(0xFF1B3F77)
                          : const Color(0xFF667080),
                ),
              ),
              if (isActive) ...[
                const SizedBox(height: 4),
                Container(
                  width: 24,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B3F77),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
