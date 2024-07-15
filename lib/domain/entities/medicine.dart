class Medicine {
  final String uuid;
  final String name;
  final bool isCompleted;
  final bool isRecurrent;
  final int quantity;
  final String notificationDate;

  Medicine({
    required this.uuid,
    required this.name,
    required this.isCompleted,
    required this.isRecurrent,
    required this.quantity,
    required this.notificationDate,
  });
}
