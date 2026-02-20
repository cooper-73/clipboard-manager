class ClipboardItem {
  const ClipboardItem({
    required this.text,
    required this.createdAt,
  });

  factory ClipboardItem.fromMap(Map<String, dynamic> map) {
    return ClipboardItem(
      text: map['value'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(
        (map['timestamp'] as num).toInt(),
      ),
    );
  }

  final String text;
  final DateTime createdAt;
}
