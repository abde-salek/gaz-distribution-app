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

  factory DashboardSyncData.fromJson(Map<String, dynamic> json) {
    return DashboardSyncData(
      targetAmount: (json['targetAmount'] ?? 0.0).toDouble(),
      collectedAmount: (json['collectedAmount'] ?? 0.0).toDouble(),
      owedAmount: (json['owedAmount'] ?? 0.0).toDouble(),
      userName: json['userName'] ?? 'Unknown User',
      lastUpdated: DateTime.parse(
        json['lastUpdated'] ?? DateTime.now().toIso8601String(),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'targetAmount': targetAmount,
      'collectedAmount': collectedAmount,
      'owedAmount': owedAmount,
      'userName': userName,
      'lastUpdated': lastUpdated.toIso8601String(),
    };
  }
}
