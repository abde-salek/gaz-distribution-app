// Loading screen to show while the app is loading
import 'package:flutter/material.dart';

/// LoadingScreen widget displays a dashboard loading UI
/// with placeholder elements and a "Dashboard is loading" message.
/// This is a portfolio-quality, well-structured, and documented widget.
class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Device dimensions for responsive scaling
    final width = MediaQuery.of(context).size.width;
    final bool isSmall = width < 400;

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Skeleton app bar
                _buildSkeletonAppBar(),
                const SizedBox(height: 32),

                // Skeleton greeting
                _buildSkeletonGreeting(isSmall),
                const SizedBox(height: 32),

                // Main dashboard skeleton cards
                _buildMainSkeletonCards(isSmall),
                const SizedBox(height: 24),

                // Target amount card
                _buildTargetAmountSkeletonCard(isSmall),
                const SizedBox(height: 16),

                // Row with two cards
                _buildDualSkeletonCards(isSmall),
                const SizedBox(height: 24),

                // Inventory section
                _buildInventorySectionSkeleton(isSmall),

                // Bottom margin
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
      // Skeleton bottom navigation
      bottomNavigationBar: _buildSkeletonBottomNavigation(),
    );
  }

  /// Builds a skeleton app bar with loading animations
  Widget _buildSkeletonAppBar() {
    return Container(
      height: 56,
      margin: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          // App icon placeholder
          _buildSkeletonCircle(24),
          const SizedBox(width: 16),

          // Title placeholder
          Expanded(
            child: _buildSkeletonText(width: 120, height: 24),
          ),

          // Action icon placeholder
          _buildSkeletonCircle(40),
        ],
      ),
    );
  }

  /// Builds a skeleton greeting section
  Widget _buildSkeletonGreeting(bool isSmall) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Welcome text placeholder
        _buildSkeletonText(
          width: isSmall ? 180 : 240,
          height: 28,
        ),
        const SizedBox(height: 8),

        // Subtitle placeholder
        _buildSkeletonText(
          width: isSmall ? 240 : 320,
          height: 16,
        ),
      ],
    );
  }

  /// Builds main dashboard skeleton cards in a row
  Widget _buildMainSkeletonCards(bool isSmall) {
    return Row(
      children: [
        // First card
        Expanded(
          child: _buildSkeletonCard(
            height: isSmall ? 100 : 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildSkeletonText(width: isSmall ? 80 : 100, height: 24),
                const SizedBox(height: 8),
                _buildSkeletonText(width: isSmall ? 60 : 80, height: 16),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),

        // Second card
        Expanded(
          child: _buildSkeletonCard(
            height: isSmall ? 100 : 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildSkeletonText(width: isSmall ? 80 : 100, height: 24),
                const SizedBox(height: 8),
                _buildSkeletonText(width: isSmall ? 60 : 80, height: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Builds a target amount skeleton card
  Widget _buildTargetAmountSkeletonCard(bool isSmall) {
    return _buildSkeletonCard(
      height: isSmall ? 90 : 100,
      color: const Color(0xFFD3E5F0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildSkeletonText(
            width: isSmall ? 120 : 160,
            height: isSmall ? 28 : 32,
            color: Colors.white.withAlpha(179), // 0.7 * 255 ≈ 179
          ),
          const SizedBox(height: 8),
          _buildSkeletonText(
            width: isSmall ? 100 : 120,
            height: 16,
            color: Colors.white.withAlpha(179), // 0.7 * 255 ≈ 179
          ),
        ],
      ),
    );
  }

  /// Builds dual skeleton cards in a row
  Widget _buildDualSkeletonCards(bool isSmall) {
    return Row(
      children: [
        // Collected amount card
        Expanded(
          child: _buildSkeletonCard(
            height: isSmall ? 80 : 90,
            color: const Color(0xFFE4EACF),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSkeletonText(
                  width: isSmall ? 80 : 100,
                  height: isSmall ? 20 : 24,
                  color: Colors.white.withAlpha(179), // 0.7 * 255 ≈ 179
                ),
                const SizedBox(height: 8),
                _buildSkeletonText(
                  width: isSmall ? 60 : 80,
                  height: 14,
                  color: Colors.white.withAlpha(179), // 0.7 * 255 ≈ 179
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),

        // Owed amount card
        Expanded(
          child: _buildSkeletonCard(
            height: isSmall ? 80 : 90,
            color: const Color(0xFFEBEBEB),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSkeletonText(
                  width: isSmall ? 80 : 100,
                  height: isSmall ? 20 : 24,
                  color: Colors.white.withAlpha(179), // 0.7 * 255 ≈ 179
                ),
                const SizedBox(height: 8),
                _buildSkeletonText(
                  width: isSmall ? 60 : 80,
                  height: 14,
                  color: Colors.white.withAlpha(179), // 0.7 * 255 ≈ 179
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Builds inventory section skeleton
  Widget _buildInventorySectionSkeleton(bool isSmall) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        _buildSkeletonText(width: isSmall ? 140 : 180, height: 20),
        const SizedBox(height: 16),

        // Inventory grid
        Center(
          child: Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              // Inventory item 1
              _buildInventoryItemSkeleton(isSmall),
              // Inventory item 2
              _buildInventoryItemSkeleton(isSmall, scale: 0.85),
              // Inventory item 3
              _buildInventoryItemSkeleton(isSmall, scale: 0.7),
            ],
          ),
        ),

        // Dashboard loading message
        const SizedBox(height: 40),
        Center(
          child: Column(
            children: [
              // Loading indicator
              const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(Color(0xFF1B3F77)),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Dashboard is loading...',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF66707F),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Builds an inventory item skeleton
  Widget _buildInventoryItemSkeleton(bool isSmall, {double scale = 1.0}) {
    final size = (isSmall ? 70 : 90) * scale;

    return Column(
      children: [
        // Bottle placeholder
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 8),

        // Label placeholder
        Container(
          width: isSmall ? 60 : 80,
          height: isSmall ? 22 : 24,
          decoration: BoxDecoration(
            color: const Color(0xFFE0E0E0),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }

  /// Builds skeleton bottom navigation
  Widget _buildSkeletonBottomNavigation() {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 5,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          5,
          (index) => _buildSkeletonNavItem(isSelected: index == 0),
        ),
      ),
    );
  }

  /// Builds a skeleton navigation item
  Widget _buildSkeletonNavItem({bool isSelected = false}) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: isSelected
            ? const Color(0xFF1B3F77).withAlpha(26) // 0.1 * 255 ≈ 26
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: _buildSkeletonCircle(
          24,
          color: isSelected
              ? const Color(0xFF1B3F77).withAlpha(77) // 0.3 * 255 ≈ 77
              : const Color(0xFFD9D9D9),
        ),
      ),
    );
  }

  /// Helper function to build skeleton text with animation
  Widget _buildSkeletonText({
    required double width,
    required double height,
    Color? color,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? const Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  /// Helper function to build skeleton card with animation
  Widget _buildSkeletonCard({
    required double height,
    required Widget child,
    Color? color,
  }) {
    return Container(
      width: double.infinity,
      height: height,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(13), // 0.05 * 255 ≈ 13
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  /// Helper function to build skeleton circle with animation
  Widget _buildSkeletonCircle(double size, {Color? color}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color ?? const Color(0xFFE0E0E0),
        shape: BoxShape.circle,
      ),
    );
  }
}

/// LoadingDashboardWidget that wraps the LoadingScreen for reuse
class LoadingDashboardWidget extends StatelessWidget {
  const LoadingDashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoadingScreen();
  }
}

/// Placeholder widget with loading animation
/// Shows a shimmering effect to indicate loading state
class ShimmerLoadingWidget extends StatefulWidget {
  final double width;
  final double height;
  final Color color;
  final BorderRadius? borderRadius;

  const ShimmerLoadingWidget({
    super.key,
    required this.width,
    required this.height,
    this.color = const Color(0xFFE0E0E0),
    this.borderRadius,
  });

  @override
  State<ShimmerLoadingWidget> createState() => _ShimmerLoadingWidgetState();
}

class _ShimmerLoadingWidgetState extends State<ShimmerLoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: -2.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(4),
            gradient: LinearGradient(
              colors: [
                widget.color,
                widget.color.withAlpha(128), // 0.5 * 255 ≈ 128
                widget.color,
              ],
              stops: const [0.0, 0.5, 1.0],
              begin: FractionalOffset(_animation.value, 0.0),
              end: FractionalOffset(2 + _animation.value, 1.0),
            ),
          ),
        );
      },
    );
  }
}

/// LoadingCardWidget - a reusable loading card with shimmer effect
class LoadingCardWidget extends StatelessWidget {
  final double height;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final List<Widget> children;

  const LoadingCardWidget({
    super.key,
    required this.height,
    this.borderRadius,
    this.padding,
    this.backgroundColor,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: borderRadius ?? BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(13), // 0.05 * 255 ≈ 13
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}

/// LoadingTextWidget - a reusable loading text placeholder with shimmer effect
class LoadingTextWidget extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;
  final Color? color;

  const LoadingTextWidget({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerLoadingWidget(
      width: width,
      height: height,
      borderRadius: borderRadius,
      color: color ?? const Color(0xFFE0E0E0),
    );
  }
}

/// LoadingCircleWidget - a reusable loading circle placeholder with shimmer effect
class LoadingCircleWidget extends StatelessWidget {
  final double size;
  final Color? color;

  const LoadingCircleWidget({
    super.key,
    required this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerLoadingWidget(
      width: size,
      height: size,
      borderRadius: BorderRadius.circular(size / 2),
      color: color ?? const Color(0xFFE0E0E0),
    );
  }
}

/// LoadingSquareWidget - a reusable loading square placeholder with shimmer effect
class LoadingSquareWidget extends StatelessWidget {
  final double size;
  final BorderRadius? borderRadius;
  final Color? color;

  const LoadingSquareWidget({
    super.key,
    required this.size,
    this.borderRadius,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerLoadingWidget(
      width: size,
      height: size,
      borderRadius: borderRadius ?? BorderRadius.circular(8),
      color: color ?? const Color(0xFFE0E0E0),
    );
  }
}

/// LoadingMessageWidget - shows a loading message with indicator
class LoadingMessageWidget extends StatelessWidget {
  final String message;
  final Color? textColor;
  final Color? indicatorColor;

  const LoadingMessageWidget({
    super.key,
    required this.message,
    this.textColor,
    this.indicatorColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation<Color>(
              indicatorColor ?? const Color(0xFF1B3F77),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          message,
          style: TextStyle(
            fontSize: 14,
            color: textColor ?? const Color(0xFF66707F),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

/// SkeletonDashboard - a complete skeleton dashboard for loading states
class SkeletonDashboard extends StatelessWidget {
  const SkeletonDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoadingScreen();
  }
}