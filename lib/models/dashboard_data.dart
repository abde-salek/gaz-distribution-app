class DashboardData {
  final double targetAmount;
  final double collectedAmount;
  final double owedAmount;
  final String userName;
  final DateTime lastUpdated;

  /// Creates a new immutable [DashboardData] instance.
  DashboardData({
    required this.targetAmount,
    required this.collectedAmount,
    required this.owedAmount,
    required this.userName,
    required this.lastUpdated,
  });

  /// Factory constructor to create an initial/default instance of [DashboardData].
  /// initializing state before real data loads.
  factory DashboardData.initial() {
    return DashboardData(
      targetAmount: 484848.0,
      collectedAmount: 12345.0,
      owedAmount: 9349.0,
      userName: 'Unknown User',
      lastUpdated: DateTime.now(),
    );
  }
  DashboardData copyWith({
    double? targetAmount,
    double? collectedAmount,
    double? owedAmount,
    String? userName,
    DateTime? lastUpdated,
  }) {
    return DashboardData(
      targetAmount: targetAmount ?? this.targetAmount,
      collectedAmount: collectedAmount ?? this.collectedAmount,
      owedAmount: owedAmount ?? this.owedAmount,
      userName: userName ?? this.userName,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}
