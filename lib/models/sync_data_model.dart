class SyncData {
  final String id;
  final DateTime lastSync;
  final SyncStatus status;
  final Map<String, dynamic> data;

  SyncData({
    required this.id,
    required this.lastSync,
    required this.status,
    required this.data,
  });

  factory SyncData.fromJson(Map<String, dynamic> json) {
    return SyncData(
      id: json['id'] ?? '',
      lastSync: DateTime.parse(
        json['lastSync'] ?? DateTime.now().toIso8601String(),
      ),
      status: SyncStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => SyncStatus.pending,
      ),
      data: json['data'] ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lastSync': lastSync.toIso8601String(),
      'status': status.name,
      'data': data,
    };
  }
}

enum SyncStatus { pending, syncing, completed, failed }
