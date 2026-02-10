class ClipboardItem {
  const ClipboardItem({
    required this.value,
    required this.createdAt,
  });

  factory ClipboardItem.fromMap(Map<String, dynamic> map) {
    return ClipboardItem(
      value: map['value'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(
        (map['timestamp'] as num).toInt(),
      ),
    );
  }

  final String value;
  final DateTime createdAt;
}
