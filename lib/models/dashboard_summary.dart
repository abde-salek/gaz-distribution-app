class DashboardState {
   final double targetAmount;
  final double collectedAmount;
  final double owedAmount;
  final String userName;
  final DateTime lastUpdated;


  /// Creates a new immutable [DashboardState] instance.
  DashboardState({
    required this.targetAmount,
    required this.collectedAmount,
    required this.owedAmount,
    required this.userName,
    required this.lastUpdated,
  });

  /// Factory constructor to create an initial/default instance of [DashboardState].
  /// initializing state before real data loads.
  factory DashboardState.initial() {
    return DashboardState(
      targetAmount: 484848.0,
      collectedAmount: 12345.0,
      owedAmount: 9349.0,
      userName: 'Unknown User',
      lastUpdated: DateTime.now(),
    );
  }
  // DashboardState copyWith({
  //   //Currency? currency,
  //   double? targetAmountDh,
  //   double? collectedAmountDh,
  //   double? owedAmountDh,
  // }) {
  
  // }
  
}
