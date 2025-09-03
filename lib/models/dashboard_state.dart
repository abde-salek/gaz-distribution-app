class DashboardSyncData {
  final double targetAmount;
  final double collectedAmount;
  final double owedAmount;
  final String userName;
  final DateTime lastUpdated;

  DashboardSyncData({
    required this.targetAmount,
    required this.collectedAmount,
    required this.owedAmount,
    required this.userName,
    required this.lastUpdated,
  });

  /// Factory constructor to create an initial/default instance of [DashboardSyncData].
  /// 
  /// This can be used as a placeholder or for initializing state before real data is loaded.
  factory DashboardSyncData.initial() {
    return DashboardSyncData(
      targetAmount: 484848.0,
      collectedAmount: 12345.0,
      owedAmount: 9349.0,
      userName: 'Unknown User',
      lastUpdated: DateTime.now(),
    );
  }
  
}
