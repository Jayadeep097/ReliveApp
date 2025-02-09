class Transaction {
  final String transactionId;
  final String userId;
  final String type; // e.g., "credit" or "debit"
  final double amount;
  final String currency;
  final String reason;
  final DateTime timestamp;

  Transaction({
    required this.transactionId,
    required this.userId,
    required this.type,
    required this.amount,
    required this.currency,
    required this.reason,
    required this.timestamp,
  });

  // Factory method to create a Transaction object from Firebase data
  factory Transaction.fromMap(Map<String, dynamic> data) {
    return Transaction(
      transactionId: data['transactionId'] ?? '',
      userId: data['userId'] ?? '',
      type: data['type'] ?? 'unknown',
      amount: data['amount']?.toDouble() ?? 0.0,
      currency: data['currency'] ?? 'USD',
      reason: data['reason'] ?? '',
      timestamp: DateTime.parse(data['timestamp']),
    );
  }

  // Convert Transaction object to a map
  Map<String, dynamic> toMap() {
    return {
      'transactionId': transactionId,
      'userId': userId,
      'type': type,
      'amount': amount,
      'currency': currency,
      'reason': reason,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
