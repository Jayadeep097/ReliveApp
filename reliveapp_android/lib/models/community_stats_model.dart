class CommunityStats {
  final String id;
  final String name;
  final double value;
  final Map<String, dynamic> data;

  CommunityStats({
    required this.id,
    required this.name,
    required this.value,
    required this.data,
  });

  factory CommunityStats.fromMap(Map<String, dynamic> map, String id) {
    return CommunityStats(
      id: id,
      name: map['name'] ?? 'Unknown',
      value: (map['value'] ?? 0.0).toDouble(),
      data: map['data'] ?? {},
    );
  }
}
